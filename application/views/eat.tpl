{include file='header.tpl'}

{if $eat}
	<ul class="list-group eat-list">
		{foreach $eat as $data}
			<li class="list-group-item">{$data.eat_name}</li>
		{/foreach}
	</ul>

	<button type="button" class="btn btn-primary btn-lg" id="lunchEatWhat">今天中午吃什麼？</button>

	<script>
		function lunchEatWhat() {
			var $el = $('.eat-list li');
			var eatLength = $el.length;
			var atLeast = 25;
			var startSlow = 10;
			var rand = Math.floor(Math.random() * eatLength) + atLeast;
			var flag = 0;
			var count = 0;
			var interval = 50;
			var setActive = function (target) {
				$el.removeClass('active');
				$el.eq(target).addClass('active');
			};
			var timeoutFunction = function () {
				setActive.call(this, flag);

				if (count++ < rand) {
					setTimeout(function () {
						timeoutFunction.call(this);
					}, interval);

					if (count > atLeast - startSlow) {
						interval += Math.floor(Math.sqrt(count) * 5);
					}

					flag = (flag + 1) % eatLength;
				} else {
					setInterval(function () {
						$el.eq(flag).removeClass('active');

						setTimeout(function () {
							$el.eq(flag).addClass('active');
						}, 500);
					}, 1000);
				}
			}

			timeoutFunction.call(this);
		}

		$('#lunchEatWhat').click(function () {
			lunchEatWhat();
		});
	</script>
{/if}

<a href="{$u_eat_create}" class="btn btn-success btn-lg" role="button">新增中午吃什麼</a>

{include file='footer.tpl'}