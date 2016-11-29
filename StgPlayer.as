package {

	public class StgPlayer extends StgCharacter {

		private var moveSpeed: Number = 0.8;

		private var shotRepeatCounter: int = 0;
		private var shotRepeatCounterMax: int = 4;

		private var isTouching: Boolean = false;
		private var touchX: Number = 0;
		private var touchY: Number = 0;

		public function StgPlayer(_scc: StgCharacterController, _x: Number, _y: Number) {
			super(_scc, _x, _y);
			type = StgConst.TYPE_PLAYER;
			hitWidth = 24;
			hitHeight = 32;
		}

		public function Touch(_isTouching: Boolean) {
			if (_isTouching) {
				if (!isTouching) {
					isTouching = true;
					touchX = this.mouseX;
					touchY = this.mouseY;
				}
			} else {
				isTouching = false;
			}
		}

		protected override function Move() {
			if (isTouching) {
				this.x += (this.mouseX - touchX) * moveSpeed;
				this.y += (this.mouseY - touchY) * moveSpeed;
				if (this.x < StgConst.SCREEN_LEFT_INSIDE) {
					this.x = StgConst.SCREEN_LEFT_INSIDE;
					touchX = this.mouseX;
				}
				if (this.x > StgConst.SCREEN_RIGHT_INSIDE) {
					this.x = StgConst.SCREEN_RIGHT_INSIDE;
					touchX = this.mouseX;
				}
				if (this.y < StgConst.SCREEN_TOP_INSIDE) {
					this.y = StgConst.SCREEN_TOP_INSIDE;
					touchY = this.mouseY;
				}
				if (this.y > StgConst.SCREEN_BOTTOM_INSIDE) {
					this.y = StgConst.SCREEN_BOTTOM_INSIDE;
					touchY = this.mouseY;
				}
				// Auto Shot
				if (++shotRepeatCounter > shotRepeatCounterMax) {
					scc.AddPlayerBullet(this.x, this.y, 0);
					shotRepeatCounter = 0;
				}
			}
		}
	}

}