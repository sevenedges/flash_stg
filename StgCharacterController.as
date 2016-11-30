package {

	import flash.display.MovieClip;
	import flash.utils.getDefinitionByName;

	public class StgCharacterController {

		// キャラクタ表示レイヤ
		var gameLayer: MovieClip;

		// キャラクター管理用配列
		var player: StgPlayer; // 自機
		var playerBulletList: Array; // 自弾
		var enemyList: Array; // 敵機
		var enemyBulletList: Array; // 敵弾

		// コンストラクタ
		public function StgCharacterController(_gameLayer: MovieClip) {
			// 初期化
			gameLayer = _gameLayer;
			player = null;
			playerBulletList = new Array();
			enemyList = new Array();
			enemyBulletList = new Array();
		}

		// 自機を生成する
		// _x, _y: 座標
		public function AddPlayer(_x: Number, _y: Number) {
			if (!player) {
				var player = new StgPlayer(this, _x, _y);
				AddStgCharacter(player);
			}
		}

		// ノーマルな自弾を生成する
		// _x, _y: 座標
		// _r: 表示角度(=0)
		public function AddPlayerBullet(_x: Number, _y: Number, _r: Number = 0) {
			var playerBullet = new PlayerBulletNormal(this, _x, _y, _r);
			AddStgCharacter(playerBullet);
		}
		
		// ノーマルな敵弾を生成する
		// _x, _y: 座標
		// _r: 表示角度(=0)
		// _angle: 発射角度(=PI*3/2)
		public function AddEnemyBullet(_x: Number, _y: Number, _r: Number = 0, _angle:Number = Math.PI*3/2) {
			var enemyBullet = new EnemyBulletNormal(this, _x, _y, _r, _angle);
			AddStgCharacter(enemyBullet);
		}

		// キャラクタを生成する
		// _characterClassName: クラス名
		// _x, _y: 座標
		// _obj: 任意のパラメータオブジェクト
		public function AddCharacterByName(_characterClassName: String, _x: Number, _y: Number, _obj: Object){
			var characterClass: Class = getDefinitionByName(_characterClassName) as Class;
			var character = new characterClass(this, _x, _y, _obj) as StgCharacter;
			AddStgCharacter(character);
		}

		// 敵(編隊)を生成する
		// _enemyClassName: 敵クラス名
		// _nums: 編成数
		// _options: オプション連想配列（キャラクタ依存）
		function AddEnemies(_enemyClassName: String, _nums: uint, _options: Object) {
			for (var i = 0; i < _nums; i++) {
				var enemyClass: Class = getDefinitionByName(_enemyClassName) as Class;
				var enemy = new enemyClass(this, i, _nums, _options) as StgEnemy;
				AddStgCharacter(enemy);
			}
		}

		// 爆発エフェクトを生成する
		// _x, _y: 座標
		// _r: 表示角度(=0)
		function AddExplosion(_x: Number, _y: Number, _r: Number = 0) {
			var explosion = new ExplosionNormal(this, _x, _y, _r);
			AddStgCharacter(explosion);
		}
		
		// プレイヤーへの参照
		public function GetPlayer(): StgPlayer {
			return player;
		}
				
		// 指定座標からプレイヤーへの方向
		// _x, _y: 座標
		public function GetPlayerAngle(_x: Number, _y: Number): Number {
			var dx = GetPlayer().x - _x;
			var dy = GetPlayer().y - _y;
			return Math.atan2(dy, dx);
		}

		// 毎フレーム処理
		public function ActAll(_isTouching: Boolean) {
			// 自機にタッチ情報を渡す
			if (player) player.Touch(_isTouching);
			// ヒットチェック
			// 自弾（vs敵機）
			for (var i in playerBulletList) {
				for (var j in enemyList) {
					if (playerBulletList[i].HitCheck(enemyList[j])) {
						playerBulletList[i].Hit(enemyList[j]);
						enemyList[j].Hit(playerBulletList[i]);
					}
				}
			}
			// 敵機(vs自機）
			for (var k in enemyList) {
				if (player && player.HitCheck(enemyList[k])) {
					player.Hit(enemyList[k]);
					enemyList[k].Hit(player);
				}
			}
			// 敵弾(vs自機）
			for (var l in enemyBulletList) {
				if (player && player.HitCheck(enemyBulletList[l])) {
					player.Hit(enemyBulletList[l]);
					enemyBulletList[l].Hit(player);
				}
			}
		}

		// キャラクタの登録
		public function AddStgCharacter(sc: StgCharacter) {
			gameLayer.addChild(sc);
			switch (sc.type) {
				case StgConst.TYPE_PLAYER:
					player = sc as StgPlayer;
					break;
				case StgConst.TYPE_PLAYER_BULLET:
					playerBulletList.push(sc);
					break;
				case StgConst.TYPE_ENEMY:
					enemyList.push(sc);
					break;
				case StgConst.TYPE_ENEMY_BULLET:
					enemyBulletList.push(sc);
					break;
				case StgConst.TYPE_OTHER:
					// NOP
					break;
				default:
					trace("CHARACTER TYPE ERROR(ADD): " + sc.type);
					break;
			}
		}

		// キャラクタの削除
		public function RemoveStgCharacter(sc: StgCharacter) {
			gameLayer.removeChild(sc);
			switch (sc.type) {
				case StgConst.TYPE_PLAYER:
					player = null;
					break;
				case StgConst.TYPE_PLAYER_BULLET:
					if (playerBulletList.indexOf(sc) >= 0)
						playerBulletList.slice(playerBulletList.indexOf(sc), 1);
					break;
				case StgConst.TYPE_ENEMY:
					if (enemyList.indexOf(sc) >= 0)
						enemyList.slice(enemyList.indexOf(sc), 1);
					break;
				case StgConst.TYPE_ENEMY_BULLET:
					if (enemyBulletList.indexOf(sc) >= 0)
						enemyBulletList.slice(enemyBulletList.indexOf(sc), 1);
					break;
				case StgConst.TYPE_OTHER:
					// NOP
					break;
				default:
					trace("CHARACTER TYPE ERROR(REMOVE): " + sc.type);
					break;
			}
		}

	}

}