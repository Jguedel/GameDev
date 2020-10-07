package {

	import flash.display.*;
	import flash.events.*;


	public class Ball extends MovieClip {
		//DATA ATTRIBUTES
		public var radius: Number;
		public var vx: int;
		public var vy: int;
		public var mX: int;
		public var mY: int;

		//CONSTANTS
		private const REVERSE: int = -1;
		private var BOTTOM: Number;
		private var TOP: Number;
		private var LEFT: Number;
		private var RIGHT: Number;


		public function Ball(VX: int, VY: int, MX: int, MY: int, BW: int) {
			this.mX = MX;
			this.mY = MY;
			this.vx = VX;
			this.vy = VY;
			this.width = BW;
			this.height = this.width;
		}

		//FUNCTION TO SET THE BOUNDARIES 
		//h = hieght, r = radius, w = width
		public function setBoundaries(w: Number, h: Number, r: Number): void {
			BOTTOM = h - r;
			TOP = r;
			LEFT = r;
			RIGHT = w - r;
		}

		//FUNCTION TO MOVE THE POSITION OF THE BALL
		public function movePosition(): void {
			//TASK 1: MOVE THE BALL
			trace("VY: ",vy, "VX: ", vx ,"x: ", mX,"y: ", mY);
			mX += vx;
			mY += vy;

			//TASK 2 CHECK FOR COLLISIONS
			
			//Y A-XIS COLLISIONS
			if (mY < TOP) {
				vy *= REVERSE;
				mY = TOP;
			}
			else if(mY > BOTTOM){
				vy *= REVERSE;
				mY = BOTTOM;
			}
			
			//X-AXIS COLLISIONS
			if(mX < LEFT){
				vx *= REVERSE;
				mX = LEFT;
			}
			else if(mX > RIGHT){
				vx *= REVERSE;
				mX = RIGHT;
			}
		}
	}

}