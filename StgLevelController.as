package {

	public class StgLevelController {

		var age: int; // 仮
		
		// とりあえず実装（変更するかも）
		var enemyCreateCounter: int;	// 次の敵出現までのカウンタ
		var testStageDataID: int;		// 敵出現管理ID
		var testStageData = [			// 敵出現データ（仮）
			[ 90, "Enemy00", 4, {vy: 6}],
			[ 30, "Enemy00", 2, {vy: 6}],
			[ 30, "Enemy00", 2, {vy: 6}]
		];
	
		public function StgLevelController() {
			age = 0;
			enemyCreateCounter = 0;
			testStageDataID = 0;
		}

		public function ActAll(_scc: StgCharacterController) {
			// テスト
			//if (++age % 90 == 0) {
			//	_scc.AddEnemies("Enemy00", 4, {vy: 6});
			//}
			var enemyData = testStageData[testStageDataID];
			if (++enemyCreateCounter >= enemyData[0]){
				_scc.AddEnemies(enemyData[1], enemyData[2], enemyData[3]);
				enemyCreateCounter = 0;
				testStageDataID++;
				if (testStageDataID >= testStageData.length){
					testStageDataID = 0;
				}
			}
		}

	}

}