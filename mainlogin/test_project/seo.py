from rollyourown import seo

class MyMetadata(seo.Metadata):
    title = seo.Tag(head=True, max_length=68)
    description = seo.MetaTag(max_length=155)
    keywords = seo.KeywordTag()
    heading = seo.Tag(name="h1")

    class HelpText:
        title  = "This will appear in the window/tab name, as well as in search results."
        keywords = "A comma separated list of words or phrases that describe the content"
        heading = "This will appear in the <h1> element"

    class Meta:
        use_sites = True
        use_cache = True
        use_i18n = True
        groups = {'optional': ('heading',)}
        seo_models = ('advertisement', 'advertisement.Product')
        seo_views = ('post_ad', )
        backends = ('path', 'modelinstance','model', 'view')
        verbose_name = "My basic example"
        verbose_name_plural = "My basic examples"