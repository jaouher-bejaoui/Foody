//
//  NewFoodView.swift
//  Foody
//
//  Created by Jaouher  on 17/06/2024.
//

import SwiftUI

struct NewFoodView: View {
    @Environment(\.managedObjectContext) var context
    @State var title: String = ""
    @State var desc: String = ""
    @State var calories: Calories = .medium
    @State var color: Color = .green
    @State var isBio: Bool = false
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 16) {
                Rectangle()
                    .fill(LinearGradient(colors: [color, .secondary], startPoint: .leading, endPoint: .trailing))
                    .frame(width: .infinity, height: 5)
                Divider()
                
                HStack {
                    Text("Calories")
                        .font(.title)
                    Picker("Calories", selection: $calories) {
                        ForEach(Calories.allCases, id: \.self) { priority in
                            let menuText = priority.stringValue()
                            Text("\(menuText)")
                                .tag(priority)
                        }
                    }
                    .pickerStyle(.menu)
                }
                
                Text("Title")
                    .font(.subheadline)
                TextField("Title", text: $title)
                Divider()
                
                Text("Description")
                    .font(.subheadline)
                TextEditor(text: $desc)
                    .lineLimit(5...10)
                Divider()
                
                ColorPicker("Color", selection: $color)
                Divider()
                
                Toggle(isOn: $isBio, label: {
                    Text("Bio")
                })
                
                Spacer()
                
                Button(action: {
                    let newFood = Food(context: context)
                    newFood.title = title
                    newFood.desc = desc
                    newFood.color = color.description
                    newFood.calories = calories.rawValue
                    newFood.isBio = isBio
                    try? context.save()
                    dismiss()
                }) {
                    Text("Save").frame(minWidth: 0, maxWidth: .infinity)
                        .shadow(
                            color: Color.primary.opacity(1), /// shadow color
                            radius: 3, /// shadow radius
                            x: 0, /// x offset
                            y: 0 /// y offset
                        )
                }
                .tint(color)
                .buttonStyle(.borderedProminent)
            }
            .font(.title)
            .padding(16)
        }
        .navigationBarTitle("Add your new food!")
        .navigationBarBackButtonHidden(false)
    }
}
