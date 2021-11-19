let divider = () => console.log('  ------');
let dividerEnd = () => console.log('-------------------');

interface IVerhicle {
	id:string;
	name:string;

	run():void;
}

interface IAir {
	height:number;

	fly():void;
}

interface ISwim {
	swim():void;
}

interface IAlpha {
	now:boolean;
	alphaJump():void;
}

abstract class Verhicle implements Verhicle {
	id:string;
	name:string;
	brand:string;

	constructor(id:string, name:string, brand:string) {
		this.id = id;
		this.name = name;
		this.brand = brand;
	}

	run():void {
		console.log(`${this.id}:${this.name}[${this.brand}] is running.`);
	}

	abstract stop():void;
}

class Car extends Verhicle {
	numOfWheel:number;

	constructor(id:string, name:string, brand:string, numOfWheel:number) {
		super(id, name, brand);

		this.numOfWheel = numOfWheel;
	}

	public run():void {
		super.run();
		console.log(`with ${this.numOfWheel} !`);
	};

	public stop():void {
		console.log('Car stopppp');
	}
}

class Drone extends Verhicle implements IAir {
	height: number;

	constructor(id:string, name:string, brand:string, height:number) {
		super(id, name, brand);

		this.height = height;
	}

	fly(): void {
		console.log(`this drone can fly height = ${this.height}`);
	}

	stop(): void {
		console.log('Drone stopppp');
	}
}

class Ufo extends Verhicle implements IAir, ISwim, IAlpha {
	now: boolean;
	height: number;

	constructor(id:string, name:string, brand:string, height:number, now:boolean) {
		super(id, name, brand);

		this.height = height;
		this.now = now;
	}

	stop(): void {
		console.log('UFO stopppp');
	}
	alphaJump(): void {
		console.log('UFO Alpha jumppppp');
	}
	swim(): void {
		console.log('UFO can swim');
	}
	fly(): void {
		console.log('UFO flyyyy');
	}
}


let c = new Car('CAR01', 'Audi RV-08', 'Audi', 4);
c.run();
c.stop();
dividerEnd();

let d = new Drone('DR01', 'DJI Air 2S', 'DJI', 10);
d.run();
d.fly();
d.stop();
dividerEnd();

let uf = new Ufo('NA01', 'UFO 01 Circle', 'N/A', 1000, true);
uf.run();
uf.fly();
uf.alphaJump();
uf.swim();
uf.stop();
dividerEnd();
