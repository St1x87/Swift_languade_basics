import Foundation

enum Action{
    case engineLaunch
    case engineMuffle
    case windowOpen
    case windowClose
    case goodsLoad(weight: Int)
    case goodsUnload(weight: Int)
    case landing(people: Int)
    case uploading(people: Int)
}

class Car {
    var brand: String = ""
    var year: Int = 0
    var engineRun: Bool = false
    var windowOpen: Bool = false
    
    init(brand: String, year: Int) {
        self.brand = brand
        self.year = year
    }
    
    func performAction(action: Action) {
        
    }
    
}

class sportCar: Car {
    var seats: Int = 0
    var freePlaces: Int = 0
    
    init(brand: String, year: Int, seats: Int) {
        self.seats = seats
        self.freePlaces = seats
        super.init(brand: brand, year: year)
    }
    
    override func performAction(action: Action) {
        switch action {
        case .engineLaunch:
            self.engineRun = true
            print("Двигатель запущен")
        case .engineMuffle:
            self.engineRun = false
            print("Двигатель заглушен")
        case .windowOpen:
            self.windowOpen = true
            print("Окна открыты")
        case .windowClose:
            self.windowOpen = false
            print("Окна закрыты")
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
    
    func discription() {
        print("Марка машины: '\(brand)', \(year) года выпуска. Мест в машине: \(seats)")
    }
    
}

class trunkCar: Car {
    var sizeTrunk: Int = 0
    var freeGoods: Int = 0
    
    init(brand: String, year: Int, sizeTrunk: Int) {
        self.sizeTrunk = sizeTrunk
        self.freeGoods = sizeTrunk
        super.init(brand: brand, year: year)
    }
    
    override func performAction(action: Action) {
        switch action {
        case .engineLaunch:
            self.engineRun = true
            print("Двигатель запущен")
        case .engineMuffle:
            self.engineRun = false
            print("Двигатель заглушен")
        case .windowOpen:
            self.windowOpen = true
            print("Окна открыты")
        case .windowClose:
            self.windowOpen = false
            print("Окна закрыты")
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
    
    func discription() {
        print("Марка машины: '\(brand)', \(year) года выпуска. Общий объем перевозимого груза: \(sizeTrunk)")
    }
    
}

var Honda = sportCar(brand: "Honda", year: 2009, seats: 5)
Honda.discription()
Honda.performAction(action: .landing(people: 3))

var Man = trunkCar(brand: "Man", year: 2015, sizeTrunk: 1500)
Man.discription()
Man.performAction(action: .engineLaunch)
Man.performAction(action: .goodsLoad(weight: 1200))
