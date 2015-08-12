#!/usr/bin/env python
# -*- coding: utf-8 -*-
import urllib2
from paypal.standard.models import PayPalStandardBase
from paypal.standard.ipn.signals import *
from django.conf import settings
from django.db.models.signals import pre_save, post_save
from adjod import globals


class PayPalIPN(PayPalStandardBase):
    """Logs PayPal IPN interactions."""
    format = u"<IPN: %s %s>"

    class Meta:
        db_table = "paypal_ipn"
        verbose_name = "PayPal IPN"

    def _postback(self):
        """Perform PayPal Postback validation."""
        return urllib2.urlopen(self.get_endpoint(), "cmd=_notify-validate&%s" % self.query).read()
    
    def _verify_postback(self):
        if self.response != "VERIFIED":
            self.set_flag("Invalid postback. (%s)" % self.response)
            
    def send_signals(self):
        """Shout for the world to hear whether a txn was successful."""
        # Transaction signals:
        if self.is_transaction():
            if self.flag:
                payment_was_flagged.send(sender=self)
            else:
                payment_was_successful.send(sender=self)
        # Recurring payment signals:
        # XXX: Should these be merged with subscriptions?
        elif self.is_recurring():
            if self.is_recurring_create():
                recurring_create.send(sender=self)
            elif self.is_recurring_payment():
                recurring_payment.send(sender=self)
            elif self.is_recurring_cancel():
                recurring_cancel.send(sender=self)
        # Subscription signals:
        else:
            if self.is_subscription_cancellation():
                subscription_cancel.send(sender=self)
            elif self.is_subscription_signup():
                subscription_signup.send(sender=self)
            elif self.is_subscription_end_of_term():
                subscription_eot.send(sender=self)
            elif self.is_subscription_modified():
                subscription_modify.send(sender=self)       

def paypal_deposit_transaction(sender, instance, created, **kwargs):
    """
    Post Save Signal To Create Paypal Deposit Transaction & Signup Bonus Function
    """
    userprofile = instance.userprofile
    if not userprofile: return
    
    if created:
        # accountdetails = userprofile.account_set.latest('pk')
        deposit_amount = instance.mc_gross
        deposit_currency = instance.mc_currency
        
        if settings.PAYPAL_TEST:
            status_msg = 'Pending'
        else:
            status_msg = 'Completed'
        
        from advertisement.models import Transaction
        
        if instance.payment_status == status_msg:
            # signupbonus = actor.transaction_set.filter(transaction_type="deposit").count()
           
            # if signupbonus == 0 and settings.SIGNUP_BONUS_APPLICABLE:
               
            #     if deposit_amount <= 5000.00:
            #         signupbonus = deposit_amount
            #     else:
            #         signupbonus = 5000
        
            def paypal_signupbonus_reference():
                try:
                    return 'DS' + str(int(Transaction.objects.filter(
                            reference__startswith='DS'
                        ).order_by('-reference')[0].reference[2:]) + 1)
                except:
                    return 'DS20001001'
               
                transaction = Transaction()
                transaction.userprofile = userprofile
                transaction.reference = paypal_signupbonus_reference()
                transaction.amount = instance.amount
                transaction.currency = deposit_currency
                # transaction.transaction_flag = 'none'
                # transaction.transaction_type = 'signupbonus'
                # transaction.payment_method = 'signupbonus'
                transaction.payment_reference = instance.txn_id
                transaction.payment_message = 'OK'
                transaction.transaction_date = datetime.now()
                transaction.UserIp = globals.ip
                transaction.save()

            def paypal_deposit_reference():
                try:
                    return 'DB' + str(int(Transaction.objects.filter(
                            reference__startswith='DB'
                        ).order_by('-reference')[0].reference[2:]) + 1)
                except:
                    return 'DB20001001'
    
            transaction = Transaction()
            transaction.userprofile = userprofile
            transaction.reference = paypal_deposit_reference()
            transaction.amount = deposit_amount
            transaction.currency = deposit_currency
            # transaction.transaction_flag = 'paid'
            # transaction.transaction_type = 'deposit'
            # transaction.payment_method = 'Paypal'
            transaction.payment_reference = instance.txn_id
            transaction.payment_message = 'OK'
            transaction.transaction_date = datetime.now()
            transaction.UserIp = globals.ip
            transaction.save()           
           
            # currentamount = accountdetails.balance
            # accountdetails.balance = float(signupbonus) + float(currentamount) + float(deposit_amount)
            # accountdetails.save()

            email = userprofile.user.email
            # if settings.SITE_NAME == "fixido.com":
            #     site_name = "www.fixido.com"
            # else:
            #     site_name = "test.fixido.com"
           
            # mail_lang = actor.language if actor.language else 'en'
            # translation.activate(mail_lang)
            # try:
            #     send_templated_mail(
            #         template_name = 'depositemail',
            #         subject = 'Fixido Deposit Confirmation',
            #         from_email = settings.DEFAULT_FROM_EMAIL,
            #         recipient_list = [email],
            #         bcc = settings.INFO_EMAIL_BCC if settings.SITE_NAME == "fixido.com" else [],
            #         context = {
            #           'actor': actor,
            #           'fixido_reference': transaction.reference,
            #           'trans_recurring_payment_id': instance.txn_id,
            #           'amt': instance.mc_gross,
            #           'available_balance': accountdetails.balance,
            #           'current_site': site_name,
            #           'site_name': site_name,
            #           'sign_bonus': signupbonus,
            #           'version': settings.STATIC_VERSION,
            #         },
            #     )
            # except Exception, e:
            #     logging.error('Not sent deposit email (@PayPal) %s' % e)
           
        elif instance.payment_status == "Refunded":
            def paypal_refund_reference():
                try:
                    return 'RE' + str(int(Transaction.objects.filter(
                            reference__startswith='RE'
                        ).order_by('-reference')[0].reference[2:]) + 1)
                except:
                    return 'RE20001001'
    
            transaction = Transaction()

            transaction.userprofile = userprofile
            transaction.reference = paypal_refund_reference()
            transaction.amount = deposit_amount
            transaction.currency = deposit_currency
            # transaction.transaction_flag = 'paid'
            # transaction.transaction_type = 'refund'
            # transaction.payment_method = 'Paypal-Refunded'
            transaction.payment_reference = instance.txn_id
            transaction.payment_message = 'OK'
            transaction.transaction_date = datetime.now()
            transaction.UserIp = globals.ip
            transaction.save()

            # currentamount = accountdetails.balance
            # accountdetails.balance = float(currentamount) + float(deposit_amount)
            # accountdetails.save()

post_save.connect(paypal_deposit_transaction, sender=PayPalIPN)     