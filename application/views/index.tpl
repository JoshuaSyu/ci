{include file='header.tpl'}

<p>{$string}</p>
<p>{$str1} {$str2}{$str3}</p>

{if 0}

{foreach $timesTable as $row}
<p>
	{foreach $row as $value}
	<span>{$value|string_format:"%02d"}</span>
	{/foreach}
</p>
{/foreach}

{foreach $colorTable as $value}
	<p style="margin: 0; padding: 0; width: 100px; height: 1px; background-color: hsl({$value}, 100%, 50%);">&nbsp;</p>
{/foreach}

{/if}

{include file='footer.tpl'}