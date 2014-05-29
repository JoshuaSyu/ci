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
	<div class="form-group eat-form">
		<div class="row">
			<label for="name" class="col-sm-1 control-label">店名</label>
			<div class="col-sm-11">
				<input type="text" class="form-control" id="name" name="name" value="{$eat.eat_name|default:''}" placeholder="健生中醫診所">
			</div>
		</div>
		<div class="row">
			<label for="phone" class="col-sm-1 control-label">電話</label>
			<div class="col-sm-11">
				<input type="text" class="form-control" id="phone" name="phone" value="{$eat.eat_phone|default:''}" placeholder="0800-092-000">
			</div>
		</div>
		<div class="row">
			<label for="address" class="col-sm-1 control-label">地址</label>
			<div class="col-sm-11">
				<input type="text" class="form-control" id="address" name="address" value="{$eat.eat_address|default:''}" placeholder="台北市承德路三段 151 號">
			</div>
		</div>
		<div class="row">
			<label for="weight" class="col-sm-1 control-label">權重</label>
			<div class="col-sm-11">
				<input type="text" class="form-control" id="weight" name="weight" value="{$eat.eat_weight|default:''}" placeholder="數字越大越容易選到">
			</div>
		</div>
		<div class="row">
			<label for="note" class="col-sm-1 control-label">備註</label>
			<div class="col-sm-11">
				<textarea name="note" id="note" rows="5" placeholder="主治：骨刺、坐骨神經痛" class="form-control">{$eat.eat_note|default:''}</textarea>
			</div>
		</div>
		{if 0}
		菜單
		公休日
		分類
		{/if}
	</div>

	{$form_hidden|default:''}

	<a href="{$u_eat}" class="btn btn-danger" role="button">取消{$button_text}</a>

	<button type="submit" class="btn btn-success">{$button_text}中午吃什麼</button>
</form>

{include file='footer.tpl'}