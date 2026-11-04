//
//  InstaFeedViewModel.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 10/17/26.
//

import Foundation
import Observation

@Observable
final class InstaFeedViewModel {
    private(set) var examplePosts: [PostModel] = [
        PostModel(username: "성환", location: "인천 대한민국", postImageName: "feed2", likesText: "모아요 님 외 7,777명이 좋아합니다", caption: "피곤해여", timeText: "10분 전"),
        PostModel(username: "이상엽", location: "서울 대한민국", postImageName: "instapost", likesText: "모아요 님 외 7,777명이 좋아합니다", caption: "벌써 2차 세미나라니 정말 즐거워요", timeText: "1시간 전"),
        PostModel(username: "모아요", location: "솝트 대한민국", postImageName: "feed3", likesText: "모아요 님 외 7,777명이 좋아합니다", caption: "같은 카드에 다른 데이터를 전달해보기", timeText: "2시간 전")
    ]
    var likeCount: Int {
        examplePosts.filter { $0.isLiked }.count
    }
    
    func toggleLike(id: PostModel.ID) {
        guard let index = examplePosts.firstIndex(where: {$0.id == id}) else {
            return
        }
        
        examplePosts[index].isLiked.toggle()
    }
    
    func delete(ids: [PostModel.ID]) {
        examplePosts.removeAll { ids.contains($0.id)}
    }
}
