//
//  Frame.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 10/3/26.
//

import SwiftUI

struct Frame: View {
    var body: some View {
        VStack(spacing: 24) {
            Text("넓은 배경")
                .frame(maxWidth: .infinity)
                .background(.yellow)
            Text("글자 크기의 배경")
                .background(.yellow)
                .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    Frame()
}
