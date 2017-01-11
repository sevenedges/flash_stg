package  {
	
	public class StgSoundPlayer {
		
		var SE_Shot: SeShot;
		var SE_Explosion: SeExplosion;

		public function StgSoundPlayer() {
			// constructor code
			SE_Shot = new SeShot();
			SE_Explosion = new SeExplosion();
		}
		
		public function PlayShotSE() {
			SE_Shot.play();
		}
		
		public function PlayExplosionSE() {
			SE_Explosion.play();
		}

	}
	
}
