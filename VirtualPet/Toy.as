package {

	import flash.display.MovieClip;
	import flash.events.*;


	public class Toy extends MovieClip {
		public var mX: int; // X POS
		public var mY: int; // Y POS
		public var moveX: Number;
		public var moveY: Number;

		public function Toy() {
			mX = 400;
			mY = 50;
		}
		public function move(MouseX:Number, MouseY:Number) {
			if(MouseX >= 100 && MouseY >= 90){
			moveX = MouseX;
			moveY = MouseY;
			}
			else{
				moveX = 200;
				moveY = 200;
			}

		}
	}

}