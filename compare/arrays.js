// Javascript

const array = [1, 2, 3, 4, 188, 10, 55, 27, 33, 20]

array.map(n => ++n); // [2, 3, 4, 5, 189, 11, 56, 28, 34, 21]
array.reduce((acc, n) => acc + n) // 343
array.forEach(n => console.log(n))

Math.max(...array) // 188
Math.min(...array) // 1

array.filter(n => n % 2 == 0) // [2, 4, 188, 10, 20]
array.filter(n => n % 2 == 1) // [1, 3, 55, 27, 33]
array.sort((a, b) => a - b) // [1, 2, 3, 4, 10, 20, 27, 33, 55, 188]

["z", "w", "a", "b", "x"].sort()

[("a", "b", "c", "d", "e")].reverse()


Array(10).fill("A") // ["A","A","A","A","A","A", "A", "A", "A", "A"]

[...Array(10).keys()] // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
