//
//  InstaProfileView.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 10/3/26.
//

import SwiftUI

struct InstaProfileView: View {
    let instaEmail: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Image(.logo)
                .accessibilityLabel("Instagram")
                .padding(.top, 193)
            VStack(spacing: 13) {
                Image(.takho)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 85, height: 85)
                    .clipShape(Circle())
                    .padding(.top, 65)
                Text("\(instaEmail)")
                    .foregroundStyle(.instaBlack)
            }
            Button {
                // login
            } label: {
                Text("로그인하기")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(.primaryBlue)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 5)
                    )
            }
            .padding(.horizontal, 34)
            .padding(.top, 12)
            
            Button("계정 전환") {}
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.primaryBlue)
                .padding(.top, 30)
            
            Spacer()
            
            HStack(alignment: .center, spacing: 11) {
                Text("계정이 없으신가요?")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(.black.opacity(0.4))
                
                Button {
                    // Sign in
                } label: {
                    Text("회원가입하기.")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(.black)
                }
            }
            .padding(.bottom, 18)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
