package {

	import flash.display.MovieClip;

	public class EnemyBulletNormal extends StgCharacter {

		var shotSpeed: Number = 8;
		var angle: Number;

		public function EnemyBulletNormal(_scc: StgCharacterController, _x: Number, _y: Number, _r: Number, _angle: Number) {
			super(_scc, _x, _y, _r);
			type = StgConst.TYPE_ENEMY_BULLET;
			angle = _angle;
		}

		protected override function Move() {
			this.x += shotSpeed * Math.cos(angle);
			this.y += shotSpeed * Math.sin(angle);
		}
	}

}