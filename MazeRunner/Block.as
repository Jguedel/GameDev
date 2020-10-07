package  {
	import flash.display.*;
	import flash.events.*;
	import flash.geom.ColorTransform;
	
	
	public class Block extends MovieClip {
		public var mX1: int;
		public var mY1: int;
		
		public function Block() {
			mY1 = 25;
			mX1 = 25;
		}
		public function setColor(redColor: Number, greenColor: Number, blueColor: Number): void {
			//TASK 1: CREATE A VARIABLE TO HOLD A PAINT COLOR
			var color: ColorTransform = new ColorTransform;

			//TASK 2:SET COLOR PROPERTIES
			color.redMultiplier = redColor;
			color.blueMultiplier = blueColor;
			color.greenMultiplier = greenColor;
			this.transform.colorTransform = color;
		}
	}
	
}
