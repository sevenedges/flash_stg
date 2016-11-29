package {

	// 定数列挙クラス

	public final
	class StgConst {

		// フレームレート
		public static const FLAME_RATE: Number = 30;

		// 画面サイズ
		public static const SCREEN_WIDTH: Number = 480;
		public static const SCREEN_HEIGHT: Number = 720;

		// 規準ユニットサイズ
		public static const UNIT_WIDTH: Number = 32;
		public static const UNIT_HEIGHT: Number = 32;

		// 規準座標
		public static const SCREEN_TOP: Number = 0 - UNIT_HEIGHT;
		public static const SCREEN_BOTTOM: Number = SCREEN_HEIGHT + UNIT_HEIGHT;
		public static const SCREEN_LEFT: Number = 0 - UNIT_WIDTH;
		public static const SCREEN_RIGHT: Number = SCREEN_WIDTH + UNIT_WIDTH;
		public static const SCREEN_CENTER_X: Number = SCREEN_WIDTH / 2;
		public static const SCREEN_CENTER_Y: Number = SCREEN_HEIGHT / 2;
		public static const SCREEN_TOP_INSIDE: Number = 0 + UNIT_HEIGHT / 2;
		public static const SCREEN_BOTTOM_INSIDE: Number = SCREEN_HEIGHT - UNIT_HEIGHT / 2;
		public static const SCREEN_LEFT_INSIDE: Number = 0 + UNIT_WIDTH / 2;
		public static const SCREEN_RIGHT_INSIDE: Number = SCREEN_WIDTH - UNIT_WIDTH / 2;

		// キャラクタタイプ
		public static const TYPE_PLAYER: String = "TypePlayer";
		public static const TYPE_PLAYER_BULLET: String = "TypePlayerBullet";
		public static const TYPE_ENEMY: String = "TypeEnemy";
		public static const TYPE_ENEMY_BULLET: String = "TypeEnemyBullet";
		public static const TYPE_OTHER: String = "TypeOther"; // 爆発エフェクトなど

		// フェイズ
		public static const PHASE_TITLE: String = "PhaseTitle";
		public static const PHASE_LEVEL_START: String = "PhaseLevelStart";
		public static const PHASE_LEVEL_MAIN: String = "PhaseLevelMain";
		public static const PHASE_LEVEL_END: String = "PhaseLevelEnd";
		public static const PHASE_RESULT: String = "PhaseResult";

	}

}