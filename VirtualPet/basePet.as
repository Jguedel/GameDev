package {
	import flash.display.*;
	import flash.events.*;

	public class basePet extends MovieClip {
		// STATES
		public const isHUNGRY: int = 1;
		public const isPLAYING: int = 2;
		public const isEATING: int = 3;
		public const isRunning: int = 4;

		//ATTRIBUTES
		public var myState: int; //PET'S CURRENT STATE
		public var mX: int; // X POS
		public var mY: int; // Y POS
		public var velocity: int; // VELOCITY
		public var stomachMax: int; // STOM MAX
		public var stomachLevel: int; // STOM LEVEL
		public var degree: Number; //ANGLE
		public var arrX: Number;
		public var arrY: Number;
		public var radians: Number;
		public var remove: String = "false";



		public function basePet() {
			myState = isPLAYING;
			mX = 5;
			mY = 5;
			stomachMax = 200;
			stomachLevel = stomachMax;
			velocity = 20;
		}

		//FUNCTION THAT TRANSITIONS STATES
		public function action(foodX: int, foodY: int, toyX: int, toyY: int, fheight: Number): void {
			//EXPLORE EACH OF THE STATES
			switch (myState) {

				//STATE: isPLAYING
				case isPLAYING:
					//TASK 1: SEEK OUT THE TOY
					mX += (toyX - mX) / velocity;
					mY += (toyY - mY) / velocity;
					arrX = (mX - toyX);
					arrY = (mY - toyY);
					radians = Math.atan2(arrY, arrX);
					degree = radians * (180 / Math.PI) - 90;
					//TASK 2: DECREASE THE HUNGER LEVEL BY BURNING A CALORIE
					stomachLevel--;
					//TASK 3: CHECK IF TRANSITION OCCURS TO SWITCH STATES
					if (stomachLevel <= 50) {
						myState = isHUNGRY;
					}
					break;

					//STATE: isHUNGRY
				case isHUNGRY:
					//TASK 1: SEEK OUT THE FOOD
					mX += (foodX - mX) / velocity;
					mY += (foodY - mY) / velocity;
					arrX = (mX - foodX);
					arrY = (mY - foodY);
					radians = Math.atan2(arrY, arrX);
					degree = radians * (180 / Math.PI) - 90;
					//TASK 2: DECREASE THE HUNGER LEVEL BY BURNING A CALORIE
					stomachLevel--;
					//TASK 3: CHECK IF TRANSITION OCCURS TO SWITCH STATES
					if (Math.abs(foodX - mX) <= 25 && Math.abs(foodY - mY) <= 25) {
						myState = isEATING;
					}
					break;

					//STATE: isEATING
				case isEATING:
					//TASK 1: CONSUME CALORIES
					stomachLevel += 10;
					//TASK 2: CHECK IF TRANSITION OCCURS TO CHANGE STATE
					if (stomachLevel >= stomachMax) {
						myState = isPLAYING;
					} else if (fheight == 0) {
						
						myState = isRunning;
					}
					break;

				case isRunning:
					mX += 2000; //RUN AWAY
				mY += 2000; //RUN AWAY
					break;

			}
		}
	}

}