import Foundation

struct queue<Element> {
    var items = [Element]()
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    func filter(_ predicate: (Element) -> Bool) -> [Element] {
        var tempArray = [Element]()
        for element in items {
            if predicate(element){
                tempArray.append(element)
            }
        }
        
        return tempArray
    }
    
    subscript(indices: Int) -> Element? {
        if indices <= items.count - 1 {
            return items[indices]
        }else {
            return nil
        }
    }
}

var arrayInt = queue<Int>()
arrayInt.push(1)
arrayInt.push(2)
arrayInt.push(3)
arrayInt.push(4)
print(arrayInt.filter({(element: Int) -> Bool in return element % 2 == 0}))
print(arrayInt[2] as Any)


