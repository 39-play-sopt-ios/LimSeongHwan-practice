//
//  InputView.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 10/10/26.
//

import SwiftUI

struct InputView2: View {
    // 상태 프로퍼티는 body 바깥에서 선언합니다.
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 16) {
            TextField("이메일", text: $email)
            SecureField("비밀번호", text: $password)
            
            Text("입력한 이메일: \(email)")
            
            Button("예시 이메일 넣기") {
                email = "sopt@example.com"
            }
        }
        .textFieldStyle(.roundedBorder)
        .padding()
    }
}

#Preview {
    InputView2()
}
