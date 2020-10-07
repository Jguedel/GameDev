package {
	import flash.display.*;
	import flash.events.*;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;


	public class SimpleShooter extends MovieClip {
		//PLANE
		private var plane: Plane;
		private var planeList: Array;
		private var nPlanes: int = 10;

		//LAUNCHER
		private var bulletLauncher: BulletLauncher;

		//BULLET
		private var bullet: Bullet;
		private var bulletList: Array;
		private var nbullets: int = 1;


		public function SimpleShooter() {
			var scale: int = 1;
			var posX: int;
			var posY: int = 0;
			var V: int = 1;
			//CREATE PLANES (need to call function to move planes inside for loop)
			planeList = new Array();
			for (var i: int = 0; i < nPlanes; i++) {
				//MAKING PLANES ALTERNATE STARTING SIDES
				if (i % 2 == 0) {
					scale *= -1;
				}
				if (scale == 1) {
					posX = -100;
				} else {
					posX = 1100;
				}
				//MAKING PLANE
				plane = new Plane(posX, posY, scale, V);
				plane.x = plane.mX;
				plane.y = plane.mY;
				//FLIP PLANE TO MAKE IT FACE THE RIGHT DIRECTION
				if (plane.dir == 1) {
					plane.scaleX = -1
				}
				posY += 15;
				V += 1;
				addChild(plane);
				planeList.push(plane);
				addEventListener(Event.ENTER_FRAME, updatePlane);
			}

			//CREATE LAUNCHER
			bulletLauncher = new BulletLauncher();
			bulletLauncher.x = bulletLauncher.mX;
			bulletLauncher.y = bulletLauncher.mY;
			addChild(bulletLauncher);


			//CREATE BULLETS
			bulletList = new Array();
			for (var q: int = 0; q < nbullets; q++) {
				bullet = new Bullet(bulletLauncher.x);
				bullet.x = 100;
				bullet.y = 600;
				addChild(bullet);
				bulletList.push(bullet);
			}
			stage.addEventListener(KeyboardEvent.KEY_DOWN, controls);
		}


		public function updatePlane(event: Event) {
			var R: int = 1100;
			var L: int = -100;
			//SETTING THE VELOCITY
			for (var i: int = 0; i < nPlanes; i++) {
				if (planeList[i].dir == 1) {
					planeList[i].x += planeList[i].velocity;
				} else {
					planeList[i].x -= planeList[i].velocity;
				}
				//CHECK IF PLANE HAS MOVED OFF THE SCREEN
				if (planeList[i].x > 1200) {
					planeList[i].x = L;
				}
				if (planeList[i].x < -500) {
					planeList[i].x = R;
				}
			}
		}

		//LAUNCHER CONTROLS
		public function controls(event: KeyboardEvent): void {
			var step: int = 20;
			if (event.keyCode == Keyboard.SPACE) {
				for (var i: int = 0; i < nbullets; i++) {
					bulletList[i].x = bulletLauncher.x;
					bulletList[i].y = 449;
					addEventListener(Event.ENTER_FRAME, moveBullet);

				}
			}
			if (event.keyCode == Keyboard.LEFT) {
				bulletLauncher.x -= step;

			}
			if (event.keyCode == Keyboard.RIGHT) {
				bulletLauncher.x += step;

			}
		}



		public function moveBullet(event: Event) {
			var R: int = 1100;
			var L: int = -100;
			for (var z: int = 0; z < nbullets; z++) {
				bulletList[z].movePos();
				bulletList[z].y -= bullet.mY;
			}

			//RESET PLANE IF BULLET HITS
			for (var q: int = 0; q < nbullets; q++) {
				for (var i: int = 0; i < nPlanes; i++) {
					if ((planeList[i].x - 85) <= bulletList[q].x && (planeList[i].x + 85) >= bulletList[q].x && (planeList[i].y - 47) <= bulletList[q].y && (planeList[i].y + 47) >= bulletList[q].y) {
						if (planeList[i].dir == 1) {
							planeList[i].x = L;
							bulletList[q].x = -200;
						} else {
							planeList[i].x = R;
							bulletList[q].x = -200;
						}
					}
				}
			}

		}


	}
}