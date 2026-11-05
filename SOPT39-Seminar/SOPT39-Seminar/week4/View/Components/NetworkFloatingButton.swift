//
//  NetworkFloatingButton.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 11/4/26.
//

import SwiftUI

struct NetworkFloatingButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(.plus)
                .resizable()
                .frame(width: 28, height: 28)
                .padding(16)
                .background(Color(.networkRed), in: Circle())
                .shadow(color: .black.opacity(0.15), radius: 3, x: 0, y: 4)
        }
    }
}

#Preview {
    NetworkFloatingButton {}
}
