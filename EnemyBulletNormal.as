package {

	import flash.display.MovieClip;

	public class EnemyBulletNormal extends StgCharacter {

		public function EnemyBulletNormal(_scc: StgCharacterController, _x: Number, _y: Number, _r: Number) {
			super(_scc, _x, _y, _r);
			type = StgConst.TYPE_ENEMY_BULLET;
		}
	}

}