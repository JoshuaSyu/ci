{include file='header.tpl'}


<button type="button" class="btn btn-primary btn-lg">今天中午吃什麼？</button>
<a href="{$u_eat_create}" class="btn btn-success btn-lg" role="button">新增中午吃什麼</a>

{if $eat}
	<ul class="list-group">
		{foreach $eat as $data}
			<li class="list-group-item">{$data.eat_name}</li>
		{/foreach}
	</ul>
{/if}

{if 0}
<div class="panel panel-info">
	<div class="panel-heading">新聞列表</div>
	{if 0}<div class="panel-body"></div>{/if}
	<div class="list-group">
	{foreach $news as $data}
		<a href="news/{$data.slug}" class="list-group-item"><p class="list-group-item-text">{$data.title}</p></a>
	{/foreach}
	</div>
</div>
{/if}




{include file='footer.tpl'}