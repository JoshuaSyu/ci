{include file='header.tpl'}

{if $eat}
	<table class="table table-hover eat-edit">
		<thead>
			<tr>
				<th class="index">#</th>
				<th class="name">店名</th>
				<th class="phone">電話</th>
				<th class="address">地址</th>
				<th class="weight">權重</th>
			</tr>
		</thead>
		<tbody>
			{foreach $eat as $data}
				<tr>
					<td class="index">{$data@index + 1}</td>
					<td class="name"><input type="text" class="form-control" name="name[{$data@index}]" value="{$data.eat_name}" placeholder="健生中醫診所"></td>
					<td class="phone"><input type="text" class="form-control" name="phone[{$data@index}]" value="{$data.eat_phone}" placeholder="0800-092-000"></td>
					<td class="address"><input type="text" class="form-control" name="address[{$data@index}]" value="{$data.eat_address}" placeholder="台北市承德路三段 151 號"></td>
					<td class="weight"><input type="text" class="form-control" name="weight[{$data@index}]" value="{$data.eat_weight}" placeholder="數字越大越容易選到"></td>
				</tr>
			{/foreach}
		</tbody>
	</table>
{/if}

{include file='footer.tpl'}