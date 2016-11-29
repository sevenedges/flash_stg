package {

	//import flash.display.MovieClip;

	public class ExplosionNormal extends StgCharacter {

		public function ExplosionNormal(_scc: StgCharacterController, _x: Number, _y: Number, _r: Number) {
			super(_scc, _x, _y, _r, 0);
		}

		protected override function Move() {
			if (age > 10) {
				Kill();
			}
		}
	}

}