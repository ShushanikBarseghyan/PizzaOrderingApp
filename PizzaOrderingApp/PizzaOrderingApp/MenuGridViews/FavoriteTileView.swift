
import SwiftUI

struct FavoriteTileView: View {
  var menuItem: MenuItem
  var body: some View{
    VStack(alignment: .center){
      Group{
        if let image = UIImage(named:"\(menuItem.id)_sm"){
          Image(uiImage: image)
            .resizable()
            .scaledToFit()
        } else {
          Image("pizza_bw")
            .resizable()
            .scaledToFit()
        }
      }
      .clipShape(Capsule())
      .shadow(radius: 3,x: 2,y: 2)
      Text(menuItem.name)
        .font(.caption2)
    }
    .background(Color("KetchupMayo").opacity(0.5))
    .cornerRadius(5)
    .padding(5)
  }
}

#Preview {
  FavoriteTileView(menuItem: testMenuItem)
}
