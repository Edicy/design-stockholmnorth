<div class="footer-inner">{% xcontent name="footer" %}</div>

{% if site.search.enabled %}
<form action="#" method="post" id="search" class="clear">
    <p class="left"><input type="text" name="" id="onpage_search" /></p>
    <p class="right"><input type="submit" name="" value="" class="search-submit" /></p>
</form>
{% endif %}

<div id="edicy">{% loginblock %}<img src="{{ images_path }}/edicy-north.png" alt="Edicy" />{% endloginblock %}</div>

