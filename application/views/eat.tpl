{include file='header.tpl'}

{if $eat}
	<div class="list-group eat-list">
		{foreach $eat as $data}
			<a href="{$u_eat_edit}/{$data.eat_id}" class="list-group-item eat-item" data-weight="{$data.eat_weight}">{$data.eat_name}</a>
		{/foreach}
	</div>

	<button type="button" class="btn btn-primary btn-lg" id="lunchEatWhat">今天中午吃什麼？</button>

	<script>
		var lunchEatWhat = {
			getWeight: function () {
				var _self = lunchEatWhat;
				var weightArray = [];
				var weightTotal = 0

				_self.$el.each(function () {
					var weight = parseInt($(this).attr('data-weight'));

					weightArray.push(weight);
					weightTotal += weight;
				});

				return {
					'weightArray': weightArray,
					'weightTotal': weightTotal,
				};
			},
			randByWeight: function () {
				var _self = lunchEatWhat;
				var weight = _self.getWeight(_self.$el);
				var weightArray = weight.weightArray;
				var weightTotal = weight.weightTotal;
				var rand = Math.random() * weightTotal;
				var weightCount = 0;

				for(var i = 0; i < weightArray.length; i++) {
					weightCount += weightArray[i];

					if(rand < weightCount) {
						return i;
					}
				}

				return weightArray.length - 1;
			},
			setActive: function () {
				var _self = lunchEatWhat;

				_self.$el.removeClass('active');
				_self.$el.eq(_self.flag).addClass('active');
			},
			timeoutFunction: function () {
				var _self = lunchEatWhat;

				_self.setActive.call(this, _self.flag);

				if (_self.count++ < _self.rand) {
					_self.scrolling = setTimeout(function () {
						_self.timeoutFunction.call(this);
					}, _self.interval);

					if (_self.count > _self.atLeast - _self.startSlow) {
						_self.interval += Math.floor(Math.sqrt(_self.count) * 5);
					}

					_self.flag = (_self.flag + 1) % _self.eatLength;
				} else {
					_self.blinking = setInterval(function () {
						_self.$el.eq(_self.flag).removeClass('active');

						setTimeout(function () {
							_self.$el.eq(_self.flag).addClass('active');
						}, 250);
					}, 500);
				}
			},
			doRandom: function () {
				var _self = lunchEatWhat;

				_self.stopRandom.call(this);

				// _self.rand = Math.floor(Math.random() * _self.eatLength) + _self.atLeast;
				_self.rand = _self.randByWeight(_self.$el) + _self.atLeast;
				_self.flag = 0;
				_self.count = 0;
				_self.interval = 50;

				_self.timeoutFunction.call(this);
			},
			stopRandom: function (showFlag) {
				var _self = lunchEatWhat;

				showFlag = !!showFlag;

				clearTimeout(_self.scrolling);
				clearInterval(_self.blinking);

				_self.$el.removeClass('active');

				if (showFlag) {
					_self.$el.eq(_self.flag).addClass('active');
				}
			},
			init: function () {
				var _self = lunchEatWhat;

				_self.$el = $('.eat-list .eat-item');
				_self.eatLength = _self.$el.length;
				_self.atLeast = _self.eatLength * 2;
				_self.startSlow = 10;

				$('#lunchEatWhat').click(function () {
					_self.doRandom.call(this);
				});
			}
		}

		lunchEatWhat.init();
	</script>
{/if}

<a href="{$u_eat_create}" class="btn btn-success btn-lg" role="button">新增中午吃什麼</a>

{include file='footer.tpl'}