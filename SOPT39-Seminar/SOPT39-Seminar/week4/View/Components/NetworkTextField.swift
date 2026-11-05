//
//  NetworkTextField.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 11/4/26.
//

import SwiftUI

struct NetworkTextField: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    var errorMessage: String? = nil

    @FocusState private var isFocused: Bool

    private var isError: Bool {
        errorMessage != nil
    }

    private var borderColor: Color {
        if isError { return Color(.networkRed) }
        return isFocused ? Color(.networkGray5) : Color(.networkGray2)
    }

    private var textColor: Color {
        isError ? Color(.networkGray6) : Color(.networkGray5)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title)
                .typography(.sb16)
                .foregroundStyle(Color(.networkGray6))
                .padding(.leading, 8)

            TextField(
                "",
                text: $text,
                prompt: Text(placeholder).foregroundStyle(Color(.networkGray2))
            )
            .typography(.m18)
            .foregroundStyle(textColor)
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .focused($isFocused)
            .padding(16)
            .background(Color(.networkWhite), in: RoundedRectangle(cornerRadius: 12))
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(borderColor, lineWidth: 2)
            }

            if let errorMessage {
                Text(errorMessage)
                    .typography(.m14)
                    .foregroundStyle(Color(.networkRed))
                    .padding(.leading, 8)
            }
        }
    }
}

#Preview {
    @Previewable @State var email = ""
    @Previewable @State var wrongEmail = "abc.com"

    VStack(spacing: 20) {
        NetworkTextField(title: "이메일 주소", placeholder: "abc@email.com", text: $email)
        NetworkTextField(
            title: "이메일 주소",
            placeholder: "abc@email.com",
            text: $wrongEmail,
            errorMessage: "올바른 이메일을 입력해주세요."
        )
    }
    .padding(20)
}
