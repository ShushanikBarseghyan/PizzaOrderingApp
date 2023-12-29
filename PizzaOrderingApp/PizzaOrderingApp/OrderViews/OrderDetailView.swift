
import SwiftUI

struct OrderDetailView: View {
  @Binding var orderItem: OrderItem
  @Binding var presentSheet: Bool
  @Binding var newOrder: Bool
  @State private var quantity: Int
  @State private var pizzaCrust: PizzaCrust
  @State private var showAlert: Bool = false
  @EnvironmentObject var orders: OrderModel
  
  init(orderItem:Binding<OrderItem>, presentSheet:Binding<Bool>,
       newOrder:Binding<Bool>){
    self._orderItem = orderItem
    self.pizzaCrust = orderItem.preferredCrust.wrappedValue
    self.quantity = Int(orderItem.quantity.wrappedValue)
    self._presentSheet = presentSheet
    self._newOrder = newOrder
  }
  
  func updateOrder(){
    orderItem.quantity = quantity
    orderItem.preferredCrust = pizzaCrust
  }
  
  var body: some View {
    VStack{
      Spacer()

      HStack {
        if let image = UIImage(named: "\(orderItem.item.id)_lg"){
          Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .cornerRadius(15)
          
        } else {
          Image("pizza_bw")
            .resizable()
            .scaledToFit()
          
        }
        Text(orderItem.item.name)
          .font(.title)
          .fontWeight(.semibold)
          .foregroundColor(.primary)
          .padding(.trailing)
      }
      .background(.linearGradient(colors: [Color.white,Color("KetchupMayo")], startPoint: .leading, endPoint: .trailing), in:Capsule())
      
      VStack{
        HStack {
          Text("Pick the crust")
          Spacer()
        }
        Picker(selection: $pizzaCrust) {
          ForEach(PizzaCrust.allCases,id:\.self){crust in
            Text(crust.rawValue).tag(crust)
          }
        } label: {}
        .pickerStyle(SegmentedPickerStyle())
        .foregroundColor(.black)
        .background(.ultraThickMaterial)
        
        Stepper(value: $quantity, in: 1...10 ){
          Text("\(quantity) " + (quantity == 1 ? "pizza" : "pizzas"))
        }
      }
      .padding(5)
      .background(.regularMaterial)
      .cornerRadius(3)
      Spacer()
      Spacer()
      HStack {
        Button("Cancel"){
          presentSheet = false
        }
        .padding()
        .padding([.leading,.trailing])
        .foregroundColor(.white)
        .background(Color("Burgundy"),in: Capsule())
        .font(.title)
        .shadow(radius:7,x:2,y:2)
        
        Button("Order"){
          updateOrder()
          if newOrder {
            orders.addOrder(orderItem: orderItem)
            showAlert = true
          } else {
            orders.replaceOrder(id: orderItem.id, with: orderItem)
          }
        }
        
        .padding()
        .padding([.leading,.trailing])
        .foregroundColor(Color("Burgundy"))
        .background(.white,in: Capsule())
        .font(.title)
        .padding(.trailing,20)
        .shadow(radius:7,x:2,y:2)
        .alert(isPresented: $showAlert) {
          Alert(
            title: Text(""),
            message: Text("Your order has been registered!"),
            dismissButton: .default(Text("OK")) {
              presentSheet = false
            }
          )
        }
      }
    }
    .padding()
    .background(Color("KetchupMayo").opacity(0.1))
    
  }
}

#Preview {
  OrderDetailView(orderItem:  .constant(testOrderItem), presentSheet: .constant(true), newOrder: .constant(false)).environmentObject(OrderModel())
}


let noOrderItem = OrderItem(id: -1, item:noMenuItem)

extension OrderModel{
  func replaceOrder(id:Int,with item:OrderItem){
    if let index = self.orderItems.firstIndex(where: {$0.id == id}){
      self.orderItems.remove(at: index)
      self.orderItems.insert(item, at: index)
    }
  }
}
