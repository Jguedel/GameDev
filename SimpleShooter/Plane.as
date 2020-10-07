package  {
	import flash.display.*;
	import flash.events.*;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	
	public class Plane extends MovieClip {
		public var mX: int;
		public var mY: int;
		public var velocity: int;
		public var dir: int;
		
		public function Plane(posX: int, posY: int, scale: int, V: int) {
			this.mX = posX;
			this.mY = posY;
			this.velocity = V;
			this.dir = scale;
		}
	}
	
}
