import Foundation

enum Action{
    case goodsLoad(weight: Int)
    case goodsUnload(weight: Int)
    case landing(people: Int)
    case uploading(people: Int)
}

protocol Car {
    var brand: String {get}
    var year: Int {get}
    var engineRun: Bool {get set}
    var windowOpen: Bool {get set}
    
    func performAction(action: Action)
}

extension Car {
    mutating func RunStopEngine() {
        engineRun = !engineRun
        print("Двигатель \(engineRun ? "запущен":"заглушен")")
    }
    
    mutating func OpenCloseWindows() {
        windowOpen = !windowOpen
        print("Окна \(windowOpen ? "открыты":"закрыты")")
    }
}

class sportCar: Car {
    var brand: String = ""
    var year: Int = 0
    var engineRun: Bool = false
    var windowOpen: Bool = false
    var seats: Int = 0
    var freePlaces: Int = 0
    
    init(brand: String, year: Int, seats: Int) {
        self.brand = brand
        self.year = year
        self.seats = seats
    }
    
    func performAction(action: Action) {
        switch action {
        case .landing(let people) where people <= freePlaces:
            self.freePlaces = freePlaces - people
            print("В машину сели \(people) людей. Свободных мест: \(freePlaces)")
        case .landing(let people) where people > freePlaces:
            print("Свободных мест в машине не хватает!")
        case .uploading(let people) where people <= (seats - freePlaces):
            self.freePlaces = freePlaces + people
            print("Из машины вышло \(people) человек")
        case .uploading(let people) where people > (seats - freePlaces):
            print("В машине сидит меньше человек, чем пытается выйти!")
        default:
            print("Действие не выполнено")
        }
    }
}

class trunkCar: Car {
    var brand: String = ""
    var year: Int = 0
    var engineRun: Bool = false
    var windowOpen: Bool = false
    var sizeTrunk: Int = 0
    var freeGoods: Int = 0
    
    init(brand: String, year: Int, sizeTrunk: Int) {
        self.brand = brand
        self.year = year
        self.sizeTrunk = sizeTrunk
    }
    
    func performAction(action: Action) {
        switch action {
        case .goodsLoad(let weight) where weight <= freeGoods:
            self.freeGoods = freeGoods - weight
            print("В машину загрузили груз весом \(weight). Осталось свободно: \(freeGoods)")
        case .goodsLoad(let weight) where weight >= freeGoods:
            print("Вес не помещается!")
        case .goodsUnload(let weight) where weight <= (sizeTrunk - freeGoods):
            self.freeGoods = freeGoods + weight
            print("Выгрузили из машины груз весом \(weight)")
        case .goodsUnload(let weight) where weight > (sizeTrunk - freeGoods):
            print("Не хватает груза в машине для выгрузки")
        default:
            print("Действие не выполнено")
        }
    }
}

extension sportCar: CustomStringConvertible {
    var description: String {
        return String("Бренд: \(brand), год выпуска \(year), мест в машине \(seats)")
    }
}

extension trunkCar: CustomStringConvertible {
    var description: String {
        return String("Бренд: \(brand), год выпуска \(year). Объем перевозимого груза: \(sizeTrunk)")
    }
}

var Honda = sportCar(brand: "Honda", year: 2005, seats: 2)
print(Honda.description)
Honda.RunStopEngine()

var Man = trunkCar(brand: "Man", year: 2015, sizeTrunk: 1500)
print(Man.description)
Man.OpenCloseWindows()
