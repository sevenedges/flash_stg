package {

	public class StgLevelController {

		var age: int; // 仮
		
		
	
		public function StgLevelController() {
			age = 0;
		}

		public function ActAll(_scc: StgCharacterController) {
			// テスト
			if (++age % 90 == 0) {
				_scc.AddEnemies("Enemy00", 4, {vy: 6});
			}
		}

	}

}