import SwiftUI

struct AILoginPracticeView: View {
    @State private var username: String = "asad_khasanov"
    @State private var password: String = ""

    var body: some View {
        VStack(spacing: 0) {
            Image(.logo)
                .padding(.top, 126)

            VStack(spacing: 12) {
                TextField("아이디", text: $username)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .font(.system(size: 14))
                    .foregroundStyle(.instaBlack)
                    .padding(.horizontal, 15)
                    .frame(height: 44)
                    .background(.gray100, in: RoundedRectangle(cornerRadius: 5))
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.gray200, lineWidth: 0.5)
                    }

                SecureField("비밀번호", text: $password)
                    .font(.system(size: 14))
                    .foregroundStyle(.instaBlack)
                    .padding(.horizontal, 15)
                    .frame(height: 44)
                    .background(.gray100, in: RoundedRectangle(cornerRadius: 5))
                    .overlay {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(.gray200, lineWidth: 0.5)
                    }
            }
            .padding(.top, 44)

            Button {
                // 비밀번호는 콘솔에 남기지 않도록 글자 수만 출력합니다.
                print("로그인 버튼 탭 - 아이디: \(username), 비밀번호 길이: \(password.count)")
            } label: {
                Text("로그인하기")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .background(.primaryBlue, in: RoundedRectangle(cornerRadius: 5))
            }
            .padding(.top, 63)

            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    AILoginPracticeView()
}
