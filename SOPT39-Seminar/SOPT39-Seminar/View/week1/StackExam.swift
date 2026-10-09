//
//  StackExam.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 10/3/26.
//

import SwiftUI

struct StackExam: View {
    var body: some View {
        ZStack(alignment: .bottom){
            Image(.images)
                .resizable()
            HStack{
                VStack(alignment: .leading){
                    Text("임성환")
                        .font(.title)
                    Text("어 나야 레전드 와비.")
                        .font(.headline)
                }
                Spacer()
            }
            .padding()
            .background(.white.opacity(0.45))
        }.frame(width: 300, height: 400)
    }
}

#Preview {
    StackExam()
}
