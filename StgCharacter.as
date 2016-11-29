package {

	import flash.display.MovieClip;
	import flash.events.Event;

	public class StgCharacter extends MovieClip {

		// キャラクタコントローラへの参照
		protected var scc: StgCharacterController;

		// キャラクタ基本パラメータ
		public var type: String; // キャラクタのタイプ
		public var power: int; // キャラクタの攻撃力
		public var life: int; // キャラクタの耐久力
		public var age: int; // 活動時間（フレーム数）
		public var isAlive: Boolean; // 生存判定
		public var hitWidth: Number; // 判定領域（x）
		public var hitHeight: Number; // 判定領域（y）

		// コンストラクタ
		public function StgCharacter(_scc: StgCharacterController, _x: Number, _y: Number, _r: Number = 0, _age: int = 0) {
			// 
			scc = _scc;
			Locate(_x, _y, _r);
			// パラメータ初期値（デフォルト値）
			type = StgConst.TYPE_OTHER;
			power = 10;
			life = 10;
			age = _age; // マイナス値のうちは各種判定対象にならない
			isAlive = true;
			hitWidth = StgConst.UNIT_WIDTH;
			hitHeight = StgConst.UNIT_HEIGHT;

			this.addEventListener(Event.ENTER_FRAME, Act);
		}

		// 毎フレーム処理
		private function Act(e: Event) {
			if (isAlive) {
				++age;
				// 座標更新
				Move();
				// 画面外判定
				if (age > 0) {
					OutOfScreenCheck();
				}
			} else {
				Kill();
			}
		}

		// 移動（キャラクタごとにoverrideする）
		protected function Move() {}

		// 画面外判定（必要に応じてoverrideしてよい）
		protected function OutOfScreenCheck() {
			var isOut = false;
			if (this.x < StgConst.SCREEN_LEFT) isOut = true;
			if (this.x > StgConst.SCREEN_RIGHT) isOut = true;
			if (this.y < StgConst.SCREEN_TOP) isOut = true;
			if (this.y > StgConst.SCREEN_BOTTOM) isOut = true;
			if (isOut) {
				isAlive = false;
			}
		}

		// ヒットチェック
		public function HitCheck(_target: StgCharacter): Boolean {
			if (!isAlive || age < 0) return false;
			if (!_target.isAlive || _target.age < 0) return false;
			var dx = Math.abs(this.x - _target.x);
			var dy = Math.abs(this.y - _target.y);
			if (dx < (hitWidth + _target.hitWidth) / 2 && dy < (hitHeight + _target.hitHeight) / 2) {
				return true;
			}
			return false;
		}

		// ヒット処理
		public function Hit(_target: StgCharacter) {
			life -= _target.power;
			if (life <= 0) {
				isAlive = false;
			}
			scc.AddExplosion(this.x, this.y, 0);
		}

		// 座標と角度を設定する
		public function Locate(_x: Number, _y: Number, _r: Number = 0) {
			this.x = _x;
			this.y = _y;
			this.rotation = _r;
		}

		// 削除
		protected function Kill() {
			this.removeEventListener(Event.ENTER_FRAME, Act);
			scc.RemoveStgCharacter(this);
		}

	}

}