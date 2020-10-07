package  {
	import flash.display.*;
	import flash.events.*;
	
	
	public class Platform extends MovieClip {
		public var mX: Number;
		public var mY: Number;
		
		public function Platform() {
			//SETT START POSITION
			mX = 230;
			mY = 375;
		}
		public function movePos(targetX: Number){
			//COMPUTE DISTANCE TO TARGET [in both x and y]
			var dx: Number = (targetX - mX);
			
			//MOVE THE BALL
			mX += dx;
		}
	}
	
}
