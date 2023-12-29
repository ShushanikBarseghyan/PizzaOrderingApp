
import Foundation

enum OrderType: String, CaseIterable{
    case takeout = "Takeout"
    case dineIn = "Dining In"
    case delivery = "Delivery"
}

class OrderModel: ObservableObject{
    @Published var orderItems: [OrderItem] = []
    var customerName = "Customer Name"
    var orderType:OrderType = .takeout
    private var lastID: Int = 0
  
    var orderCount:Int{
        orderItems.count
    }
    var orderTotal:Double{
        var total:Double = 0.0
        for item in orderItems{
            total += item.extPrice
        }
        return total
    }
    func addOrder(_ item:MenuItem, quantity:Int){
        lastID += 1
        let newOrder = OrderItem(id: (lastID) , item:item, quantity:quantity)
        orderItems.append(newOrder)
    }
    func addOrder(orderItem:OrderItem){
        var  newOrder = orderItem
        lastID += 1
        newOrder.id = lastID
        orderItems.append(newOrder)
    }
    
    func removeOrder(id:Int){
        if let index = orderItems.firstIndex(where: {$0.id == id}){
            orderItems.remove(at: index)
        }
    }
    func removeLast(){
        orderItems.removeLast()
    }
}



