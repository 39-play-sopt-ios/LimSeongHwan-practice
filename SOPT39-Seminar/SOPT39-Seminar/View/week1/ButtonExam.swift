//
//  Button.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 10/3/26.
//

import SwiftUI

struct ButtonExam: View {
    var body: some View {
        VStack(spacing: 20) {
            Button {
                print("인사하기 버튼")
            } label: {
                Label("인사하기", systemImage: "hand.wave.fill")
            }
            .buttonStyle(.borderedProminent)
            
            Button(action: signIn) {
                Text("Sign In")
            }
            .buttonStyle(.bordered)
            
            Button {
                print("프로필 열기")
            } label: {
                HStack(spacing: 8) {
                    Image(systemName: "person.fill")
                    Text("프로필 보기")
                }
            }
            
            Button("로그인") {
                print("로그인 완료")
            }
        }
    }
}

private func signIn() {
    print("회원가입 완료")
}

#Preview {
    ButtonExam()
}
