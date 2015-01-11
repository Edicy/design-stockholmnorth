<!DOCTYPE html>
<html lang="{{ page.language_code }}">
<head>
{% include "SiteHeader" %}
</head>
<body id="front">
<div id="wrap">
  <div id="header">
    {% include "Langmenu" %}
    <div class="hgroup clear">
      <h1 id="logo">{% editable site.header %}</h1>
      <h2>{% content name="slogan" %}</h2>
    </div>
    {% include "Mainmenu" %}
  </div>
  <!-- //header -->
  <div id="content-wrap" class="clear">
    <div class="left-column" data-search-indexing-allowed="true">{% content %}</div>
    <div class="column last yellow">
    {% if site.latest_articles.size > 0 %}{% include "News" %}{% else %}{% content name="sidebar" %}{% endif %}
    </div>
  </div>
  <!-- //content-wrap -->
  <div id="footer" class="clear">{% include "Footer" %}</div>
  <!-- //footer -->
</div>
<!-- //wrap -->
{% include "JS" %}
</body>
</html>