package {
	import flash.display.*;
	import flash.events.*;

	public class PongApp extends MovieClip {
		private var ball: Ball;
		private var ballList: Array;
		private var nBalls: int = 5;
		public var VX: int = 40;
		public var VY: int = 40;
		public var MX: int = 100;
		public var MY: int = 100;
		public var BW: int = 70;


		public function PongApp() {
			ballList = new Array();
			//TASK 1: CREATE A BALL AND ADD IT TO THE SCREEN
			for (var i: int = 0; i < nBalls; i++) {
				ball = new Ball(VX, VY, MX, MY,BW);
				VX -= 7;
				VY -= 7;
				MX += 100;
				MY += 100;
				BW += 10;
				ball.radius = ball.width / 2;
				addChild(ball);
				ballList.push(ball);
			//TASK 2: UPDATE THE BOUNDARIES OF THE BALL (mujst be inside loop so all balls are affected by the barrier)
			ball.setBoundaries(550, 400, ball.radius);
			}

			

			//TASK 3: CREATE THE GAME LOOP
			addEventListener(Event.ENTER_FRAME, updateStage);
		}
		public function updateStage(event: Event) {
			for (var i: int = 0; i < nBalls; i++) {
				trace("ball:", i);
				ballList[i].movePosition();
				ballList[i].x = ballList[i].mX;
				ballList[i].y = ballList[i].mY;
			}
		}
	}

}