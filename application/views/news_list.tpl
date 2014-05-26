{include file='header.tpl'}


<div class="panel panel-info">
	<div class="panel-heading">新聞列表</div>
	{if 0}<div class="panel-body"></div>{/if}
	<div class="list-group">
	{foreach $news as $data}
		<a href="news/{$data.slug}" class="list-group-item"><p class="list-group-item-text">{$data.title}</p></a>
	{/foreach}
	</div>
</div>

<a href="{$u_news_create}" class="btn btn-success" role="button">新增新聞</a>

{if 0}
<ol>
	{foreach $news as $data}
		<li><a href="news/{$data.slug}">{$data.title}</a></li>
	{/foreach}
</ol>

<dl class="dl-horizontal">
	{foreach $news as $data}
		<dt>{$data@index + 1}</dt>
		<dd><a href="news/{$data.slug}"><p>{$data.title}</p></a></dd>
	{/foreach}
</dl>

<div class="row">
	<div class="col-md-1">#</div>
	<div class="col-md-11">標題</div>
	{foreach $news as $data}
		<div class="col-md-1">{$data@index + 1}</div>
		<div class="col-md-11"><a href="news/{$data.slug}"><p>{$data.title}</p></a></div>
	{/foreach}
</div>

<p><a href="{$u_news_create}">新增新聞</a></p>
{foreach $news as $data}
	<a ><p>{$data.title}</p></a>
{foreachelse}
	<p>沒有新聞</p>
{/foreach}
{/if}

{include file='footer.tpl'}