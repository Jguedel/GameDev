package {

	import flash.display.*;
	import flash.events.*;


	public class Ball extends MovieClip {
		public var mX: Number;
		public var mY: Number;
		public var vx: Number = 1.5;
		public var vy: Number = -1;
		public var LeftStop: Number;
		public var RightStop: Number;
		public var TopStop: Number;
		public var BottomStop: Number;
		public var radius: Number;

		public function Ball() {
			this.mX = 50;
			this.mY = 300;
			this.RightStop = 550;
			this.LeftStop = 10;
			this.TopStop = 0;
			this.BottomStop = 400;
		}
		public function movePosition(paddleX, paddleY, brickList) {
			mY += vy;
			mX += vx;
			//IF COLLID WITH WALL THEN CHANGE X OR Y VELOCITY * -1
			if (mY <= this.TopStop) {
				vy *= -1;
			} else if ((mX) >= RightStop) {
				vx *= -1;
				mX = RightStop;
			} else if ((mX) <= LeftStop) {
				vx *= -1;
				mX = LeftStop;
			}
			//BOUNCE OFF PADDLE
			else if (mY >= (paddleY - 33.5) && (mX >= (paddleX - 80) && mX <= (paddleX + 80))) {
				trace('paddle');
				vy *= -1;
				vx = (mX - paddleX) * .02;
				mY = paddleY - 35;
			}
			//IF COLLID WITH BRICKS
			else if (((brickList.x - 77) <= (mX + 17) || (brickList.x - 77) <= (mX - 17)) && ((brickList.x + 77) >= (mX + 17) || (brickList.x + 77) >= (mX - 17)) && ((brickList.y - 17) <= (mY + 17) || (brickList.y - 17) <= (mY - 17)) && ((brickList.y + 17) >= (mY + 17) || (brickList.y + 17) >= (mY - 17))) {
				brickList.x = -200;
				mY = brickList.y + 30;
				trace('brick');
				vy *= -1
				trace(vy);

			}

		}
	}

}