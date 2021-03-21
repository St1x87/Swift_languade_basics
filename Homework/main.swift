import Foundation

// Задание 1. Решить квадратное уравнение
// ax^2+bx+c=0

var a: Int = 3
var b: Int = 9
var c: Int = -1
var x1: Double?
var x2: Double?

// Найдем дискриминант
var D = pow(Float(b), 2)-Float(4*a*c)

//Если дискриминант больше нуля, нам надо найти 2 корня
if D > 0{
    x1 = (Double(-b)+sqrt(Double(D)))/Double(2*a)
    x2 = (Double(-b)-sqrt(Double(D)))/Double(2*a)
    print("Первый корень: "+"\(x1!)")
    print("Второй корень: "+"\(x2!)")
//Если дискриминант равен нулю, нам надо найти 1 корень
}else if D == 0 {
    x1 = (Double(-b)+sqrt(Double(D)))/Double(2*a)
    print("Корень равен: "+"\(x1!)")
//Если дискриминант меньше нуля, корней нет
}else {
    print("Корней нет")
}

//Задание 2. Найти площадь, периметр и гипотенузу прямоугольного треугольника

var x: Int = 3
var z: Int = 4

//Площадь прямоугольного треугольника
var S = 0.5*Double(a*b)
print("Площадь треугольника равно "+"\(S)")

//Гипотенуза прямоугольного треугольника
var G = sqrt(Double(pow(Float(x), 2)+pow(Float(z), 2)))
print("Гипотенуза треугольника равна "+"\(G)")

//Периметр прямоугольного треугольника
var P = Double(x+z)+G
print("Периметр треугольника равен "+"\(P)")

//Задание 3. Найти сумму вклада через 5 лет
var proc: Double = 9.1
var deposit: Double = 250000
var year: Int = 5

while year > 0 {
    deposit = deposit + deposit*(proc/100)
    year-=1
}
print("Сумма вклада: "+"\(deposit)")
