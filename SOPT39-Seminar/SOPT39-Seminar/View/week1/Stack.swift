//
//  Stack.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 10/3/26.
//

import SwiftUI

struct Stack: View {
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Image(systemName: "person.crop.circle.fill")
                .font(.largeTitle)
            Text("iOS 개발자")
            Spacer()
            Text("39기")
                .foregroundStyle(.secondary)
        }
        .padding()
        
        ZStack(alignment: .center) {
            Rectangle()
                .fill(.green)
            RoundedRectangle(cornerRadius: 20)
                .fill(.yellow)
                .frame(height: 100)
            Capsule()
                .foregroundStyle(.red)
                .frame(height: 80)
            Circle()
                .fill(.cyan)
                .frame(width: 60, height: 60)
        }
        .frame(width: 160, height: 140)
        
        HStack {
            Spacer()
            Image(systemName: "checkmark")
//            Spacer()
            Text("모아요")
            Spacer()
        }
        .border(.blue)
    }
}

#Preview {
    Stack()
}
