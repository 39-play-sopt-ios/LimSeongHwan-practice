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
