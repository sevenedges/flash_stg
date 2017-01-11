package  {
	
	public class MesStage01 extends StgEnemy {
		
		//var phase_0: int = 24;
		//var phase_1: int = 36;
		//var phase_2: int = 60;
		
		var time_half: int = 30;	// 中央にとどまるタイミング

		var _x:Number;
		var _y:Number;
		
		public function MesStage01(_scc: StgCharacterController, _id: uint, _nums: uint, _options: Object) {
			_x = StgConst.SCREEN_CENTER_X;	// 中央
			_y = StgConst.SCREEN_BOTTOM;	// 画面下部より出現
			super(_scc, _x, _y, 0, 0);
			type = StgConst.TYPE_OTHER;	// StgEnemyを継承するがその他のキャラとして登録される（あたり判定の対象外）
		}

		protected override function Move() {
			/*
			// 場合分けして三角関数を利用
			var r: Number;
			if (age < phase_0){
				r = 1 - Math.sin(Math.PI / 2 * age / phase_0) * 0.5; // 1 ~ 0.5
			}else if (age < phase_1){
				r = 0.5;
			}else if (age < phase_2){
				r = Math.cos(Math.PI / 2 * (age - phase_1) / (phase_2 - phase_1)) * 0.5; // 0.5 ~ 0
			}else{
				r = -1;
			}
			this.y = _y = StgConst.SCREEN_BOTTOM * r + StgConst.SCREEN_TOP * (1 - r);
			*/
			// 三次関数を利用
			var r: Number = (1 - Math.pow(age - time_half, 3) / Math.pow(time_half, 3)) / 2;	// 1 ~ 0
			this.y = _y = StgConst.SCREEN_BOTTOM * r + StgConst.SCREEN_TOP * (1 - r);
		}
		
	}
	
}
