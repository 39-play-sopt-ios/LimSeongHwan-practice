//
//  NetworkPostModal.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 11/4/26.
//

import SwiftUI

struct NetworkPostModal: View {
    let onCancel: () -> Void
    let onDelete: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("게시글을 삭제할까요?")
                .typography(.m18)
                .foregroundStyle(Color(.networkGray6))
                .frame(maxWidth: .infinity)

            HStack(spacing: 12) {
                NetworkButton(title: "취소", style: .secondary, action: onCancel)
                NetworkButton(title: "삭제", style: .primary, action: onDelete)
            }
        }
        .padding(20)
        .frame(width: 288)
        .background(Color(.networkWhite), in: RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    ZStack {
        Color(.networkGray2)
            .ignoresSafeArea()

        NetworkPostModal(onCancel: {}, onDelete: {})
    }
}
