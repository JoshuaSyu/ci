{include file='header.tpl'}

<div class="panel panel-info">
	<div class="panel-heading">
		<h3 class="panel-title">{$news.title}</h3>
	</div>
	<div class="panel-body">{$news.text|nl2br}</div>
</div>

<a href="{$u_news_list}" class="btn btn-primary" role="button">反回新聞列表</a>

{include file='footer.tpl'}