//
//  NetworkButton.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 11/4/26.
//

import SwiftUI

enum NetworkButtonStyle {
    case disabled
    case primary
    case secondary

    var backgroundColor: Color {
        switch self {
        case .disabled: Color(.networkGray1)
        case .primary: Color(.networkBlack)
        case .secondary: Color(.networkGray1)
        }
    }

    var textColor: Color {
        switch self {
        case .disabled: Color(.networkGray3)
        case .primary: Color(.networkGray1)
        case .secondary: Color(.networkGray5)
        }
    }
}

struct NetworkButton: View {
    let title: String
    var style: NetworkButtonStyle = .primary
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .typography(.sb14)
                .foregroundStyle(style.textColor)
                .frame(maxWidth: .infinity)
                .padding(16)
                .background(style.backgroundColor, in: Capsule())
        }
        .disabled(style == .disabled)
    }
}

#Preview {
    VStack(spacing: 20) {
        NetworkButton(title: "로그인", style: .disabled) {}
        NetworkButton(title: "로그인", style: .primary) {}
        NetworkButton(title: "로그인", style: .secondary) {}
    }
    .padding(20)
}
