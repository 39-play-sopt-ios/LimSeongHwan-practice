//
//  NetworkPostBottomSheet.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 11/4/26.
//

import SwiftUI

struct NetworkPostBottomSheet: View {
    @Binding var title: String
    @Binding var content: String
    let onComplete: () -> Void

    private let titleLimit = 20
    private let contentLimit = 1000

    private var isCompletable: Bool {
        !title.isEmpty && !content.isEmpty
    }

    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 12) {
                NetworkTextField(title: "제목", placeholder: "제목을 입력하세요.", text: $title)
                NetworkTextField(title: "본문", placeholder: "본문을 입력하세요.", text: $content)
            }

            NetworkButton(
                title: "완료",
                style: isCompletable ? .primary : .disabled,
                action: onComplete
            )
        }
        .padding(.horizontal, 16)
        .padding(.top, 36)
        .frame(maxHeight: .infinity, alignment: .top)
        .presentationDetents([.height(275)])
        .presentationDragIndicator(.visible)
        .presentationCornerRadius(24)
        .presentationBackground(Color(.networkWhite))
        .onChange(of: title) { _, newValue in
            if newValue.count > titleLimit {
                title = String(newValue.prefix(titleLimit))
            }
        }
        .onChange(of: content) { _, newValue in
            if newValue.count > contentLimit {
                content = String(newValue.prefix(contentLimit))
            }
        }
    }
}

#Preview {
    @Previewable @State var title = ""
    @Previewable @State var content = ""

    Color(.networkGray2)
        .ignoresSafeArea()
        .sheet(isPresented: .constant(true)) {
            NetworkPostBottomSheet(title: $title, content: $content) {}
        }
}
