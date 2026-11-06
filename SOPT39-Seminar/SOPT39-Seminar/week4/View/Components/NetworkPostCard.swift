//
//  NetworkPostCard.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 11/4/26.
//

import SwiftUI

struct NetworkPostCard: View {
    let author: String
    let date: String
    let title: String
    let content: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            postInfo

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .typography(.m16)
                Text(content)
                    .typography(.m14)
            }
            .foregroundStyle(Color(.networkGray5))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background(Color(.networkGray1), in: RoundedRectangle(cornerRadius: 20))
    }

    private var postInfo: some View {
        HStack(spacing: 4) {
            Text(author)
            Rectangle()
                .frame(width: 1, height: 12)
            Text(date)
        }
        .typography(.m12)
        .foregroundStyle(Color(.networkGray3))
    }
}

#Preview {
    NetworkPostCard(author: "작성자", date: "YYYY.MM.DD", title: "제목", content: "본문입니다.")
        .padding(16)
}
