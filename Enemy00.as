﻿package {

	import flash.display.MovieClip;

	public class Enemy00 extends StgEnemy {

		// オプションパラメータ
		var options: Object;
		var vy: Number;
		
		var numberOfBullets: int;

		public function Enemy00(_scc: StgCharacterController, _id: uint, _nums: uint, _options: Object) {
			var _x: Number = StgConst.SCREEN_CENTER_X;
			var _y: Number = StgConst.SCREEN_TOP;
			options = _options;
			vy = options.vy;
			numberOfBullets = 1;
			super(_scc, _x, _y, 0, -_id * 8);
		}

		protected override function Move() {
			if (age > 0) {
				this.x = StgConst.SCREEN_CENTER_X + StgConst.SCREEN_WIDTH * Math.sin(age / 12) * 0.4;
				this.y += vy;
				this.rotation += 12;

				if (scc.player && this.y > scc.player.y) {
					vy = -Math.abs(vy);
					if (numberOfBullets > 0) {
						var _r = scc.GetPlayerAngle(this.x, this.y)
						//scc.AddEnemyBullet(this.x, this.y, _r, _r);
						for (var i = 0; i < 12; i++){
							scc.AddCharacterByName("EnemyBulletNeedle", this.x, this.y, {r:_r*180/Math.PI, angle:_r});
							_r += Math.PI / 6;
						}
						numberOfBullets--;
					}
				}
			}
		}
	}

}