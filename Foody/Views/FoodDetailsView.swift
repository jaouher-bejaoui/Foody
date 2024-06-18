//
//  FoodDetailsView.swift
//  Foody
//
//  Created by Jaouher  on 17/06/2024.
//

import SwiftUI

struct FoodDetailsView: View {
    @State private var scale: CGFloat = 1.0

    var food: Food
    
    init(food: Food) {
        self.food = food
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Bio :")
                    .font(.subheadline)
                Image(systemName: "leaf.fill")
                    .resizable()
                    .foregroundColor(food.isBio ? .green : .gray)
                    .frame(width: 30, height: 30)
            }
            Divider()
            
            HStack {
                Text("Title :")
                    .font(.subheadline)
                    .transition(.scale)
                Text(food.title ?? "")
            }
            Divider()
            
            Text("Description :")
                .font(.subheadline)
            Text(food.desc ?? "")
            Divider()
            
            HStack {
                Text("Callories :")
                    .font(.subheadline)
                Text(food.calories ?? "medium")
            }
            
            Spacer()
        }
        .onAppear {
            withAnimation(.linear(duration: 2)) {
                
            }
        }
        .padding(.horizontal, 16)
    }
}

