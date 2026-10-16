//
//  PostModel.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 10/10/26.
//

import Foundation

struct PostModel: Identifiable {
    let id = UUID()
    let username: String
    let location: String
    let postImageName: String
    let likesText: String
    let caption: String
    let timeText: String
    var isLiked = false
}

let examplePopsts: [PostModel] = [
    PostModel(username: "성환", location: "인천 대한민국", postImageName: "feed2", likesText: "모아요 님 외 7,777명이 좋아합니다", caption: "피곤해여", timeText: "10분 전"),
    PostModel(username: "이상엽", location: "서울 대한민국", postImageName: "instapost", likesText: "모아요 님 외 7,777명이 좋아합니다", caption: "벌써 2차 세미나라니 정말 즐거워요", timeText: "1시간 전"),
    PostModel(username: "모아요", location: "솝트 대한민국", postImageName: "feed3", likesText: "모아요 님 외 7,777명이 좋아합니다", caption: "같은 카드에 다른 데이터를 전달해보기", timeText: "2시간 전")
]
