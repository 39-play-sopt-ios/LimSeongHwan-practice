//
//  PostSignUpView.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 10/31/26.
//

import SwiftUI

struct PostSignUpView: View {
    @State private var viewModel = PostSignUpViewModel()
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Group {
                TextField("web / ios / android", text: $viewModel.part)
                
                TextField("이름을 입력해주세요", text: $viewModel.name)
            }
            .typography(.m18)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .padding(.horizontal, 16)
            .frame(height: 54)
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(Color(white: 0.83), lineWidth: 2)
            }
            
            Button {
                Task {
                    await viewModel.signup()
                }
            } label: {
                Text(viewModel.isLoading ? "인증 코드 발급중" : "코드발급")
                    .typography(.sb14)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 49)
                    .background(Color(.black), in: RoundedRectangle(cornerRadius: 12))
                
            }
            .disabled(viewModel.isLoading)
            .padding(.top, 8)
            
            NavigationLink {
                PostListView()
            } label: {
                Text("게시글 이동")
                    .typography(.sb14)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 49)
                    .background(Color(.black), in: RoundedRectangle(cornerRadius: 12))
                
            }
            .disabled(viewModel.isLoading)
            .padding(.top, 8)
            
            Spacer()
            
            if !viewModel.authorizationCode.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    Text("발급받은 인증 코드")
                        .typography(.sb14)
                    Text(viewModel.authorizationCode)
                        .typography(.b28)
                        .textSelection(.enabled)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 24)
            }
            
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundStyle(.red)
                    .padding(.bottom, 24)
            }
        }
        .padding(.horizontal, 24)
        .padding(.top, 88)
        .background(.white)
        .preferredColorScheme(.light)
    }
}

#Preview {
    NavigationStack {
        PostSignUpView()
    }
}
