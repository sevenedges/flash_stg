package {

	import flash.display.MovieClip;

	public class EnemyBulletNeedle extends StgCharacter {

		var shotSpeed: Number = 8;
		var angle: Number;

		public function EnemyBulletNeedle(_scc: StgCharacterController, _x: Number, _y: Number, _obj: Object) {
			super(_scc, _x, _y, _obj.r);
			type = StgConst.TYPE_ENEMY_BULLET;
			angle = _obj.angle;
		}

		protected override function Move() {
			this.x += shotSpeed * Math.cos(angle);
			this.y += shotSpeed * Math.sin(angle);
		}
	}

}