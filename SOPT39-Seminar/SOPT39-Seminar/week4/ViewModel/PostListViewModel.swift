//
//  PostListViewModel.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 11/6/26.
//

import Foundation
import Observation

@Observable
final class PostListViewModel {
    var keyword = ""
    var newTitle = ""
    var newContent = ""
    private(set) var posts: [PostDTO] = []
    
    func fetchPostList() async {
        do {
            let response = try await PostListService.shared.getPostList()
            posts = response.posts
        } catch {
            print("게시글 목록 조회 실패:", error.localizedDescription)
        }
    }
    
    func createPost() async {
        guard let author = KeychainManager.shared.read(for: .nickname), !author.isEmpty else {
            print("게시글 생성 실패: 저장된 닉네임이 없어요.")
            return
        }
        
        do {
            _ = try await PostCreateService.shared.postCreatePost(
                title: newTitle,
                content: newContent,
                author: author
            )
            
            newTitle = ""
            newContent = ""
            
            await fetchPostList()
        } catch {
            print("게시글 생성 실패:", error.localizedDescription)
        }
    }
    
    func deletePost(_ post: PostDTO) async {
        do {
            try await PostDeleteService.shared.deletePost(postId: post.id)
            await fetchPostList()
        } catch {
            print("게시글 삭제 실패:", error.localizedDescription)
        }
    }
}
