//
//  ContentView.swift
//  Foody
//
//  Created by Jaouher  on 17/06/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(sortDescriptors: []) var foodItems: FetchedResults<Food>
    
    @State private var selectedItem: Food?

    var body: some View {
        NavigationView {
            List {
                ForEach(foodItems) { item in
                    NavigationLink(destination: FoodDetailsView(food: item)) {
                        listItem(item: item)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem {
                    NavigationLink(destination: NewFoodView()) {
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
            }
        }
    }
}

extension ContentView {
    @ViewBuilder
    func listItem(item: Food) -> some View {
        HStack {
            Image(systemName: "leaf.fill")
                .foregroundColor(item.isBio ? .green : .gray)
            Divider()
            
            VStack(alignment: .leading) {
                Text(item.title ?? "")
                    .bold()
                Text(item.desc ?? "")
                    .italic()
            }
            
            Spacer()
            Image(systemName: "flame")
                .foregroundColor(.orange)
            Image(systemName: (Calories(rawValue: item.calories ?? "medium") ?? .medium).icon)
        }
    }
}

extension ContentView {
    private func addItem() {
        withAnimation {
            let newItem = Food(context: context)
            newItem.title = "Food"
            
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { foodItems[$0] }.forEach(context.delete)

            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
