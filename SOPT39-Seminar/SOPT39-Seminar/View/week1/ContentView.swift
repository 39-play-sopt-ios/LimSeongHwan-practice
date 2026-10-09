//
//  ContentView.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 10/3/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("아요의 숲에서 사과 한입 앙")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(.black)
                .border(.blue)
                .padding()
                .border(.red)
            Text("모아요의 꿈은 이루어진다")
                .font(.title)
                .fontWeight(.light)
                .foregroundStyle(.red)
                .padding(.leading, 30)
                .border(.green)
            Text("로그인")
                .border(.red)
                .frame(width: 240, height: 60, alignment: .leading)
                .border(.blue)
            
            VStack(spacing: 16) {
                Text("고정너비")
                    .frame(width: 200, height: 44)
                    .background(.blue.opacity(0.15))
                Text("가능한 너비 사용")
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(.orange.opacity(0.15))
            }
            .padding(.horizontal, 16)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
