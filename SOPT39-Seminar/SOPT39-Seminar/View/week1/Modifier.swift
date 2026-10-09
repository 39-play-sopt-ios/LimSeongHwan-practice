//
//  Modifier.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 10/3/26.
//

import SwiftUI

struct Modifier: View {
    var body: some View {
        VStack(spacing: 24) {
            Text("여백까지 파란색")
                .padding(16)
                .background(.blue)
            Text("글자 영역만 파란색")
                .background(.blue)
                .padding(16)
        }
        
        VStack {
            Text("안녕하세요")
            Text("반갑습니다")
                .foregroundStyle(.red)
            Text("모아모아모아요")
                .font(.caption)
        }
        .foregroundStyle(.blue)
        .font(.title)
    }
}

#Preview {
    Modifier()
}
