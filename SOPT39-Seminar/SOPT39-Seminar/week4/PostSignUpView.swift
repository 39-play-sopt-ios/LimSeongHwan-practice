//
//  PostSignUpView.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 10/31/26.
//

import SwiftUI

struct PostSignUpView: View {
    @State private var part = ""
    @State private var name = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Group {
                TextField("web / ios / android", text: $part)
                
                TextField("이름을 입력해주세요", text: $name)
            }
            .font(.custom("Pretendard-Medium", size: 18))
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .padding(.horizontal, 16)
            .frame(height: 54)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(Color(white: 0.83), lineWidth: 2)
            }
            
            Button {
            } label: {
                Text("코드 발급")
                    .font(.custom("Pretendard-SemiBold", size: 14))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 49)
                    .background(Color(.black), in: RoundedRectangle(cornerRadius: 12))
                
            }
            .padding(.top, 8)
            
            Spacer()
        }
        .padding(.horizontal, 24)
        .padding(.top, 88)
        .background(.white)
        .preferredColorScheme(.light)
    }
}

#Preview {
    PostSignUpView()
}
