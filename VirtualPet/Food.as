package {
	import flash.display.*;
	import flash.events.*;


	public class Food extends MovieClip {
		public var mX: int; // X POS
		public var mY: int; // Y POS
		public var dec: Number;

		public function Food() {
			mX = 400;
			mY = 300;
		}
		public function check(petX: int, petY: int, fheight: Number) {
			if (Math.abs(petX - mX) <= 27.5 && Math.abs(petY - mY) <= 27.5) {
				dec = 1;
			} else {
				dec = 0;
			}
		}
	}

}