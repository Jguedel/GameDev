package {
	import flash.display.*;
	import flash.events.*;
	import flash.text.TextField;


	public class brickBreaker extends MovieClip {
		private var txt: TextField = new TextField();
		//BALL
		private var ball: Ball;

		//BRICK
		private var brick: Brick;
		private var brickList: Array;
		private var nBricks: Number = 0;
		public var X: Number = 125;
		public var Y: Number = 30;

		//PLATFROM
		private var platform: Platform

		//START GAME ON CLICK
		public function brickBreaker() {
			txt.text = "click screen to begin ";
			txt.x = 225;
			txt.y = 200;
			addChild(txt);
			brickList = new Array();
			stage.addEventListener(MouseEvent.CLICK, create);
		}

		//CREATE OBJECTS
		public function create(event: MouseEvent) {
			for (var v: Number = 0; v < numChildren; v++) {
				this.removeChildAt(v);
			}
			//ADD BRICKS
			var vert: Number = 30;
			var horz: Number = 150;;
			//FIRST LOOP IS HORZ ADDING
			for (var i: Number = 0; i <= 2; i++) {
				Y = 20;
				//SECOND LOOP IS VERT ADDING
				for (var q: Number = 0; q <= 4; q++) {
					brick = new Brick(X, Y);
					brick.x = brick.mX;
					brick.y = brick.mY;
					nBricks += 1;
					addChild(brick);
					brickList.push(brick);
					Y += vert;
				}
				X += horz;
			}
			X = 80;
			Y = 30;

			//ADD BALL
			ball = new Ball();
			ball.x = ball.mX;
			ball.y = ball.mY;
			addChild(ball);
			addEventListener(Event.ENTER_FRAME, moveBall);

			//ADD platform
			platform = new Platform();
			platform.x = platform.mX;
			platform.y = platform.mY;
			addChild(platform);
			addEventListener(Event.ENTER_FRAME, moveplatform);
		}
		//MOVING platform (with mouse)
		public function moveplatform(event: Event) {
			platform.movePos(mouseX)
			platform.x = platform.mX;
			platform.y = platform.mY;
		}

		//MOVING BALL
		public function moveBall(event: Event) {
			//RUNS THROUGH brickList TO DELETE PLATFORMS
			for (var i: Number = 0; i < nBricks; i++) {
				ball.movePosition(platform.x, platform.y, brickList[i]);
				ball.x = ball.mX;
				ball.y = ball.mY;
			}

		}

	}

}