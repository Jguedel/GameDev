package {
	import flash.display.*;
	import flash.events.*;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;


	public class Bullet extends MovieClip {
		public var SmX: int;
		public var mY: int;
		public var vy: int = 10;

		public function Bullet(posX) {
			this.SmX = posX;
		}

		public function movePos() {
			mY = vy;
		}

	}


}