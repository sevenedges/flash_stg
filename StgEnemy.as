package {

	public class StgEnemy extends StgCharacter {

		public function StgEnemy(_scc: StgCharacterController, _x: Number, _y: Number, _r: Number, _age: int) {
			super(_scc, _x, _y, _r, _age);
			type = StgConst.TYPE_ENEMY;
		}

	}

}