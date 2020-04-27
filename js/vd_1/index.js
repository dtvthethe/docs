function Mouse(name) {
	this.name = name;
	this.isAlive = true;
}

function Cat(name) {
	this.name = name;
	this.stomach = [];
}

Cat.prototype.eat = function(mouse){
	mouse.isAlive = false;
	this.stomach.push(mouse)

	return this;
}

let jerry = new Mouse('Jerry');
let micky = new Mouse('Micky');

let tom = new Cat('Tom');
tom.eat(jerry).eat(micky);

// console.log(jerry);
// console.log(micky);
console.log(tom);