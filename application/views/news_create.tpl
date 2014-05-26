{include file='header.tpl'}

{$validation_errors}
{$form_open}
	<div class="panel panel-info">
		<div class="panel-heading">
			<h3 class="panel-title">新增新聞</h3>
		</div>
		<div class="panel-body">
			<div class="form-group">
				<label for="title" class="col-sm-1 control-label">我是標題</label>
				<div class="col-sm-11">
					<input type="text" class="form-control" id="title" name="title" placeholder="我是標題">
				</div>
			</div>
			<div class="form-group">
				<label for="text" class="col-sm-1 control-label">我是內文</label>
				<div class="col-sm-11">
					<textarea class="form-control" id="text" name="text" rows="5" placeholder="我是內文"></textarea>
				</div>
			</div>
		</div>
	</div>

	<a href="{$u_news_list}" class="btn btn-primary" role="button">反回新聞列表</a>

	<button type="submit" class="btn btn-success">新增新聞</button>
</form>

{include file='footer.tpl'}