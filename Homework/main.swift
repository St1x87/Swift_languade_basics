import Foundation

//Задание 1 и 2.
//Четное число - это целое число, которое делится на 2 без остатка
//Результатом первых двух заданий является проверка деления числа на 2 или 3 без остатка
//Объединим две функции в одну, которая будет возвращать остаток от деления
func getBalance(_ number: Int, _ denominator: Int) -> Int {
    return number%denominator
}

//Задание 3
func getArray(_ limit: Int) -> [Int] {
    var array: [Int] = []
    
    for i in 1...limit {
        array.append(i)
    }
    
    return array
}

var array = getArray(100)
print(array)

//Задание 4
var i = array.count - 1
while i >= 0 {
    if getBalance(array[i], 2) == 0 {
        array.remove(at: i)
    }else if getBalance(array[i], 3) != 0 {
        array.remove(at: i)
    }
    i -= 1
}
print(array)

//Задание 5
//Напишем функцию добавления числа Фибоначчи в массив при условии инициализации первух двух элементов 0 и 1 в массиве
func addNumberFibonachi(_ array: inout [Int]) {
    let firstElement: Int? = array[array.count - 2]
    let secondElement: Int? = array.last
    let newElement = firstElement! + secondElement!
    array.append(newElement)
}

var arrayFibonachi: [Int] = [0, 1]

repeat {
    addNumberFibonachi(&arrayFibonachi)
} while arrayFibonachi.count < 50
print(arrayFibonachi)

//Задание 6
func addPrimeNumber(_ array: inout [Int], _ number: Int) {
    var isPrimeNumber: Bool = true
    if array.count == 0 {
        array.append(number)
    }else {
        for element in array {
            if number%element == 0 {
                isPrimeNumber = false
                break
            }
        }
        if isPrimeNumber != false {
            array.append(number)
        }
    }
}

var arrayPrimeNumber: [Int] = []
var newNumber: Int = 2
repeat {
    addPrimeNumber(&arrayPrimeNumber, newNumber)
    newNumber += 1
} while arrayPrimeNumber.count < 100
print(arrayPrimeNumber)

