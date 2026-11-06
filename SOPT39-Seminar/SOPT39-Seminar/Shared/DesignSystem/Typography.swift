//
//  Typography.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/12/26.
//

import SwiftUI

enum Typography {
    case b28
    case m18
    case m16
    case sb16
    case m14
    case sb14
    case m12

    var size: CGFloat {
        switch self {
        case .b28: 28
        case .m18: 18
        case .m16: 16
        case .sb16: 16
        case .m14: 14
        case .sb14: 14
        case .m12: 12
        }
    }

    var weight: Font.Weight {
        switch self {
        case .b28: .bold
        case .m18: .medium
        case .m16: .medium
        case .sb16: .semibold
        case .m14: .medium
        case .sb14: .semibold
        case .m12: .medium
        }
    }

    var lineHeightPercent: CGFloat {
        switch self {
        case .b28: 120
        case .m18: 120
        case .m16: 120
        case .sb16: 120
        case .m14: 120
        case .sb14: 120
        case .m12: 120
        }
    }

    var letterSpacingPercent: CGFloat {
        switch self {
        case .b28: -1
        case .m18: -1
        case .m16: -1
        case .sb16: -1
        case .m14: -1
        case .sb14: -1
        case .m12: -1
        }
    }

    var lineHeight: CGFloat {
        size * lineHeightPercent / 100
    }

    var letterSpacing: CGFloat {
        size * letterSpacingPercent / 100
    }
}

private struct TypographyModifier: ViewModifier {
    let style: Typography

    func body(content: Content) -> some View {
        let extraSpacing = style.lineHeight - Pretendard.uiFont(size: style.size, weight: style.weight).lineHeight
        content
            .font(.pretendard(size: style.size, weight: style.weight))
            .tracking(style.letterSpacing)
            .lineSpacing(extraSpacing)
            .padding(.vertical, extraSpacing / 2)
    }
}

extension View {
    func typography(_ style: Typography) -> some View {
        modifier(TypographyModifier(style: style))
    }
}
