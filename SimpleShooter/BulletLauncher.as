package  {
	import flash.display.*;
	import flash.events.*;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	public class BulletLauncher extends MovieClip {
		public var mX: int;
		public var mY: int;
		
		public function BulletLauncher() {
			//SET POSITION BOTTOM CENTER OF THE SCREEN (changed BulletLauncher image so the pointer is at the bottom middle of launcher)
			mX = 475;
			mY = 449;
		}
	}
	
}
