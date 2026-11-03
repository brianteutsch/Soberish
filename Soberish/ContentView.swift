import SwiftUI

struct ContentView: View {
    var body: some View {
        let drink = Drink.preview
        DrinkView(drink: drink)
    }
}

#Preview {
    ContentView()
}
