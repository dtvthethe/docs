let Mouse = require('./Mouse');
let Cat = require('./Cat');

// import { Cat } from './Cat';
// import { Mouse } from './Mouse';

let jerry = new Mouse('Jerry');
let micky = new Mouse('Micky');

let tom = new Cat('Tom');
tom.eat(jerry).eat(micky);

// console.log(jerry);
// console.log(micky);
console.log(tom);
