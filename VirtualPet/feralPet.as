package {
	import flash.display.*;
	import flash.events.*;

	public class feralPet extends MovieClip {
		private var pet: Pet;
		public var petList: Array;
		public var nPet: int;
		private var food: Food;
		private var toy: Toy;
		private var fbtn: Fbtn;
		private var pbtn: Pbtn;



		public function feralPet() {
			food = new Food();
			food.x = food.mX;
			food.y = food.mY;
			addChild(food);
			fbtn = new Fbtn();
			fbtn.x = fbtn.mX;
			fbtn.y = fbtn.mY;
			addChild(fbtn);
			fbtn.addEventListener(MouseEvent.CLICK, addFood);
			pbtn = new Pbtn();
			pbtn.x = pbtn.mX;
			pbtn.y = pbtn.mY;
			addChild(pbtn);
			petList = new Array;
			nPet = 0;
			pbtn.addEventListener(MouseEvent.CLICK, addPet);
			toy = new Toy();
			toy.x = toy.mX;
			toy.y = toy.mY;
			addChild(toy);

		}
		public function addFood(event: MouseEvent): void {
			removeChild(food);
			food = new Food();
			food.x = food.mX;
			food.y = food.mY;
			addChild(food);
			addEventListener(Event.ENTER_FRAME, updateGame);
		}
		public function addPet(event: MouseEvent): void {
			//creates array of pets
			//create individual pet
			pet = new Pet();
			pet.x = pet.mX;
			pet.y = pet.mY;
			//add pet
			nPet++
			addChild(pet);
			//number of pet counter
			//add pet to array of pets
			petList.push(pet);

		}
		public function updateGame(event: Event) {
			//for now assume food is at (400,400) and toy is at (-1,-1)
			//PET
			
			for (var i: int = 0; i <= nPet - 1; i++) {
				trace(petList.length);
				//petList[i].action() creates movement betwwen toy and food aswell as 
				//controls stomach level when playing vs eatting
				petList[i].action(food.x, food.y, toy.x, toy.y, food.height);
				//move pet
				petList[i].x = petList[i].mX;
				petList[i].y = petList[i].mY;
				petList[i].rotation = petList[i].degree;

				//FOOD
				food.check(petList[i].x, petList[i].y, food.height);

				//shrink food
				food.height -= food.dec;
				food.width -= food.dec;
				
				toy.move(mouseX, mouseY)
				toy.x = toy.moveX;
				toy.y = toy.moveY;
			}
		}
	}

}

//FPET
//fpet.action(food.x, food.y, toy.x, toy.y, food.height);
//fpet.x = fpet.mX;
//fpet.y = fpet.mY;
//fpet.rotation = fpet.degree;

//TOY