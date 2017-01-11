package {

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.getDefinitionByName;

	public class StgMain extends MovieClip {

		// レベル（ステージ）コントローラ
		var slc: StgLevelController;

		// キャラクタコントローラ
		var scc: StgCharacterController;
		
		// ゲームフェイズ管理
		var ph: String;

		// タッチ中フラグ
		var isTouching: Boolean;

		// コンストラクタ
		public function StgMain() {
			//
			ph = StgConst.PHASE_TITLE;
			//
			this.addEventListener(Event.ENTER_FRAME, OnEnterFrame);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, OnMouseDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, OnMouseUp);
		}

		// メインループ
		private function OnEnterFrame(e: Event) {
			switch (ph) {
				case StgConst.PHASE_TITLE:
					ChangePhase(StgConst.PHASE_LEVEL_START);
					break;
				case StgConst.PHASE_LEVEL_START:
					slc = new StgLevelController();
					scc = new StgCharacterController(gameLayer); // "gameLayer"はシーンに既に配置されている
					scc.AddPlayer(StgConst.SCREEN_CENTER_X, StgConst.SCREEN_CENTER_Y * 1.5); // 中央やや下
					ChangePhase(StgConst.PHASE_LEVEL_MAIN);
					break;
				case StgConst.PHASE_LEVEL_MAIN:
					// メインループ
					slc.ActAll(scc); // 敵機生成管理
					scc.ActAll(isTouching); //
					break;
				case StgConst.PHASE_LEVEL_END:
					break;
				case StgConst.PHASE_RESULT:
					break;
				default:
					trace("PHASE ERROR: " + ph);
			}
		}

		// マウスダウンイベントコールバック
		private function OnMouseDown(e: MouseEvent) {
			isTouching = true;
		}

		// マウスアップイベントコールバック
		private function OnMouseUp(e: MouseEvent) {
			isTouching = false;
		}

		// フェイズ変更する
		public function ChangePhase(_ph: String) {
			ph = _ph;
		}

	}

}