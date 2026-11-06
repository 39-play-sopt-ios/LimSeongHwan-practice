//
//  PostListResponseDTO.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 11/6/26.
//

import Foundation

struct PostListResponseDTO: Decodable {
    let posts: [PostDTO]
    let nextCursor: Int?
    let hasNext: Bool
}

struct PostDTO: Decodable, Identifiable {
    let id: Int
    let title: String
    let content: String
    let author: String
    let createdAt: String
    let updatedAt: String
}

extension PostDTO {
    var displayDate: String {
        String(createdAt.prefix(10)).replacingOccurrences(of: "-", with: ".")
    }
}

extension PostListResponseDTO {
    static let dummy = PostListResponseDTO(
        posts: [
            PostDTO(
                id: 4,
                title: "글쓰기 테스트입니다 하하하하",
                content: "본문입니다. 본문입니다. 본문입니다. 본문입니다. 본문입니다. 본문입니다. 본문입니다. 본문입니다. 본문입니다. 본문입니다. 본문입니다. 본문입니다.",
                author: "응아니야",
                createdAt: "2026-10-24T12:10:00",
                updatedAt: "2026-10-24T12:10:00"
            ),
            PostDTO(
                id: 3,
                title: "웹토리들아",
                content: "세미나 열심히 듣고 있나요? 파이띵!ㅋㅋ",
                author: "민나",
                createdAt: "2026-10-19T09:30:00",
                updatedAt: "2026-10-19T09:30:00"
            ),
            PostDTO(
                id: 2,
                title: "안드들아",
                content: "지각하면 가만안드 👊",
                author: "힘멜도연",
                createdAt: "2026-10-06T18:00:00",
                updatedAt: "2026-10-06T18:00:00"
            ),
            PostDTO(
                id: 1,
                title: "모아요들아",
                content: "사과 잊지 말고 항상 가지고 다녀라",
                author: "상엽",
                createdAt: "2026-10-06T12:00:00",
                updatedAt: "2026-10-06T12:00:00"
            )
        ],
        nextCursor: 1,
        hasNext: false
    )
}
