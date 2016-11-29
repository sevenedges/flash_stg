package {

	public class PlayerBulletNormal extends StgCharacter {

		var shotSpeed: Number = 18;

		public function PlayerBulletNormal(_scc: StgCharacterController, _x: Number, _y: Number, _r: Number) {
			super(_scc, _x, _y, _r);
			type = StgConst.TYPE_PLAYER_BULLET;
		}

		protected override function Move() {
			this.y -= shotSpeed;
		}
	}

}