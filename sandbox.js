// const console.log = require('console.log')('projet:sandbox');

const obj = {
  a: 'oi',
  b: 'nonn',
  c: true,
  d: 45,
};

console.log(obj);
(Object.keys(obj).forEach((key, index) => {
  console.log('key =>', key);
  console.log('index =>', index);
  console.log('value =>', obj[key]);
}));
