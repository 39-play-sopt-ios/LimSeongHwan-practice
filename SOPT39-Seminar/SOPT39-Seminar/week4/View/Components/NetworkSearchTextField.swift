//
//  NetworkSearchTextField.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 11/4/26.
//

import SwiftUI

struct NetworkSearchTextField: View {
    var placeholder: String = "검색어를 입력하세요"
    @Binding var text: String

    @FocusState private var isFocused: Bool

    var body: some View {
        HStack(spacing: 10) {
            TextField(
                "",
                text: $text,
                prompt: Text(placeholder).foregroundStyle(Color(.networkGray2))
            )
            .typography(.m18)
            .foregroundStyle(Color(.networkGray5))
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled()
            .focused($isFocused)
            
            Button {
                
            } label: {
                Image(.search)
                    .resizable()
                    .frame(width: 24, height: 24)
            }
        }
        .padding(16)
        .background(Color(.networkWhite), in: RoundedRectangle(cornerRadius: 12))
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(isFocused ? Color(.networkGray5) : Color(.networkGray2), lineWidth: 2)
        }
    }
}

#Preview {
    @Previewable @State var keyword = ""

    NetworkSearchTextField(text: $keyword)
        .padding(20)
}
