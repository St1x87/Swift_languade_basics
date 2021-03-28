import Foundation

//Создадим перечисления

enum Action{
    case engineLaunch
    case engineMuffle
    case windowOpen
    case windowClose
    case goodsLoad(weight: Int)
    case goodsUnload(weight: Int)
}

struct sportCar {
    var brand: String = ""
    var year: Int = 0
    var sizeBody: Int = 0
    var engineRun: Bool = false
    var windowOpen: Bool = false
    var goods: Int = 0
    
    init(nameBrand: String, yearCar: Int, sizeBodyCar: Int){
        self.brand = nameBrand
        self.year = yearCar
        self.sizeBody = sizeBodyCar
    }
    
    mutating func performAction(newAction: Action) {
        switch newAction {
        case .engineLaunch:
            self.engineRun = true
        case .engineMuffle:
            self.engineRun = false
        case .windowOpen:
            self.windowOpen = true
        case .windowClose:
            self.windowOpen = false
        case .goodsLoad(let weight) where weight <= sizeBody:
            self.goods = weight
        case .goodsLoad(let weight) where weight >= sizeBody:
            print("Вес слишком большой")
        case .goodsUnload(let weight) where weight <= goods:
            self.goods = weight
        case .goodsUnload(let weight) where weight >= goods:
            print("Не хватает груза в машине для выгрузки")
        default:
            print("Действие не выполнено")
        }
    }
    
    func discription() {
        print(self)
    }
}

struct trunkCar {
    var brand: String = ""
    var year: Int = 0
    var sizeTrunk: Int = 0
    var engineRun: Bool = false
    var windowOpen: Bool = false
    var goods: Int = 0
    
    init(nameBrand: String, yearCar: Int, sizeBodyCar: Int){
        self.brand = nameBrand
        self.year = yearCar
        self.sizeTrunk = sizeBodyCar
    }
    
    mutating func performAction(newAction: Action) {
        switch newAction {
        case .engineLaunch:
            self.engineRun = true
        case .engineMuffle:
            self.engineRun = false
        case .windowOpen:
            self.windowOpen = true
        case .windowClose:
            self.windowOpen = false
        case .goodsLoad(let weight) where weight <= sizeTrunk:
            self.goods = weight
        case .goodsLoad(let weight) where weight >= sizeTrunk:
            print("Вес слишком большой")
        case .goodsUnload(let weight) where weight <= goods:
            self.goods = weight
        case .goodsUnload(let weight) where weight >= goods:
            print("Не хватает груза в машине для выгрузки")
        default:
            print("Действие не выполнено")
        }
    }
    
    func discription() {
        print(self)
    }
}

var sportCarHonda = sportCar(nameBrand: "Honda", yearCar: 1997, sizeBodyCar: 60)
sportCarHonda.performAction(newAction: Action.engineLaunch)
sportCarHonda.performAction(newAction: Action.goodsLoad(weight: 40))
sportCarHonda.discription()

var trunkCarDoodge = trunkCar(nameBrand: "Doodge", yearCar: 2005, sizeBodyCar: 1500)
trunkCarDoodge.performAction(newAction: Action.windowOpen)
trunkCarDoodge.performAction(newAction: Action.goodsLoad(weight: 1000))
trunkCarDoodge.discription()
trunkCarDoodge.performAction(newAction: Action.goodsUnload(weight: 1100))


