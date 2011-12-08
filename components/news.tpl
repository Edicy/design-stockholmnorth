{% for a in site.latest_1_articles %}
    <h2>{{"latest_news"|lc}}</h2>
    <ul id="latest-news">
    {% for article in site.latest_3_articles %}
    <li>
        <span class="date">{{article.created_at | format_date:"short"}}</span>
        <h3><a href="{{article.url}}">{{article.title}}</a></h3>
        {% if forloop.first %}{{article.excerpt | strip_html | truncate : 90}}{% endif %}
    </li>
    {% endfor %}
    </ul>
    <a class="more" href="{{bloglink}}">{{ "older_news" | lc }}</a>
{% endfor %}
