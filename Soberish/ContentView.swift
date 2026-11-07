import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context

    var body: some View {
        NavigationStack {
            VStack {
                DrinkListView()
            }
            .navigationTitle("Drinks")
            // Apply the toolbar to the inner view, NOT the NavigationStack
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {
                        let drink = Drink.preview
                        context.insert(drink)
                        do {
                            try context.save()
                        } catch {
                        }
                    }) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
