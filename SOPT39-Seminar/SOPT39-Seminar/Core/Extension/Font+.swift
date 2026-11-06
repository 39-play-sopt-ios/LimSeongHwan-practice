//
//  Font+.swift
//  SOPT39-Starbucks
//
//  Created by 성환 on 10/12/26.
//

import SwiftUI
import UIKit

enum Pretendard {
    static func fontName(for weight: Font.Weight) -> String {
        let weightMap: [(Font.Weight, String)] = [
            (.black, "Black"),
            (.bold, "Bold"),
            (.heavy, "ExtraBold"),
            (.ultraLight, "ExtraLight"),
            (.light, "Light"),
            (.medium, "Medium"),
            (.regular, "Regular"),
            (.semibold, "SemiBold"),
            (.thin, "Thin")
        ]
        let weightString = weightMap.first { $0.0 == weight }?.1 ?? "Regular"
        return "Pretendard-\(weightString)"
    }
    
    static func uiFont(size: CGFloat, weight: Font.Weight) -> UIFont {
        UIFont(name: fontName(for: weight), size: size) ?? .systemFont(ofSize: size)
    }
}

extension Font {
    static func pretendard(size fontSize: CGFloat, weight: Font.Weight) -> Font {
        return Font.custom(Pretendard.fontName(for: weight), size: fontSize)
    }
}
