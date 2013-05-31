<!DOCTYPE html>
<html lang="{{ page.language_code }}">
<head>
{% include "SiteHeader" %}
{{blog.rss_link}}
</head>
<body>
<div id="wrap">
  <div id="header">
    {% include "Langmenu" %}
    <div class="hgroup clear">
      <h1 id="logo">{% editable site.header %}</h1>
      <h2>{% content name="slogan" %}</h2>
    </div>
    {% include "Mainmenu" %}
    {% include "Submenu" %}
  </div>
  <!-- //header -->
  <div id="content-wrap" class="clear">
    <div class="center-column">
      <h2>{% editable article.title %} <span class="date">{{article.created_at | format_date:"long"}}</span></h2>
      <p><span class="author">{{article.author.name}}</span> / <a href="{% case article.comments_count %}{% when 0 %}{{article.url}}#comment-form{% else %}{{article.url}}#comments{% endcase %}">{% case article.comments_count %}{% when 0 %}{{"write_first_comment" | lc}}{% else %}{{"comments" | lc}} (<span class="edy-site-blog-comments-count">{{article.comments_count}}</span>){% endcase %}</a></p>
      <div class="excerpt">{% editable article.excerpt %}</div>
      {% editable article.body %}
      
      
      {% if editmode %}
        <div class="cfx article-tags">
            <div class="article-tag-icon"></div>
            {% editable article.tags %}
        </div>
      {% else %}
        {% unless article.tags == empty %}
            <div class="cfx article-tags">
                <div class="article-tag-icon"></div>
                {% for tag in article.tags %}
                    <a href="{{ article.page.url }}/tagged/{{ tag.path }}">{{ tag.name }}</a>{% unless forloop.last %}, {% endunless %}
                {% endfor %}
            </div>
        {% endunless %}
    {% endif %}
      
      <div id="comments">
        <h2>{% case article.comments_count %}{% when 0 %}{{"no_comments"|lc}}{% else %}{{"comments_for_count"|lc}}: <span class="edy-site-blog-comments-count">
       {{article.comments_count}}</span>{% endcase %}</h2>
        <ul>
        {% for comment in article.comments %}
          <li class="edy-site-blog-comment">
            <p><span class="comment-author">{{comment.author}}</span> <span class="comment-date">{{comment.created_at | format_date:"short"}}</span>{% removebutton %}</p>
            {{comment.body_html}}
          </li>
          {% endfor %}
        </ul>
      </div>
      <!-- //comments -->
      
      
    <div id="comment-form">  
    <h2>{{"add_a_comment"|lc}}</h2>
    {% commentform %}
    {% unless comment.valid? %}<ul class="blog-errors">
    {% for error in comment.errors %}
    <li>{{ error | lc }}</li>
    {% endfor %}
    </ul>{% endunless %}
     <div class="form_field"><label for="commentform-name">{{"name"|lc}}</label>
       <input type="text" class="form_field_textfield" id="commentform-name" value="{{comment.author}}" name="comment[author]" /></div>
     
     <div class="form_field"><label for="commentform-email">{{"email"|lc}}</label>
       <input type="text" class="form_field_textfield" id="commentform-email" value="{{comment.author_email}}" name="comment[author_email]" /></div>
     
     <div class="form_field"><label for="commentform-body">{{"comment"|lc}}</label>
       <textarea class="form_field_textarea" rows="4" cols="5" name="comment[body]">{{comment.body}}</textarea></div>
     
     <div class="form_submit"><input type="submit" class="submit" value="{{"submit"|lc}}" /></div>
    {% endcommentform %}
    </div>
      
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