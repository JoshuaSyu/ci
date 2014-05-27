{include file='header.tpl'}

{if $validation_errors}
	<div class="alert alert-danger">
		{$validation_errors}
	</div>
{/if}

{if $s_eat_edit}
	{$button_text = '修改'}
{else}
	{$button_text = '新增'}
{/if}

{$form_open}
	<div class="form-group">
		<label for="name" class="col-sm-1 control-label">店家名稱</label>
		<div class="col-sm-11">
			<input type="text" class="form-control" id="name" name="name" value="{$eat.eat_name|default:''}" placeholder="這裡要打入店家名稱唷">
		</div>
	</div>

	{$form_hidden|default:''}

	<a href="{$u_eat}" class="btn btn-danger" role="button">取消{$button_text}</a>

	<button type="submit" class="btn btn-success">{$button_text}中午吃什麼</button>
</form>

{include file='footer.tpl'}