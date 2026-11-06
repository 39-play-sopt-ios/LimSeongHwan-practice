//
//  PostDeleteService.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 11/6/26.
//

import Foundation

final class PostDeleteService {
    static let shared = PostDeleteService()
    
    private init() {}
    
    private func makeRequest(postId: Int) throws -> URLRequest {
        guard let baseURL = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String, let url = URL(string: baseURL) else {
            throw NetworkError.urlError
        }
        
        guard let authorizationCode = KeychainManager.shared.read(for: .authorizationCode) else {
            throw NetworkError.unauthorized
        }
        
        var request = URLRequest(url: url.appending(path: "/api/v1/posts/\(postId)"))
        request.httpMethod = "DELETE"
        request.setValue(authorizationCode, forHTTPHeaderField: "Authorization")
        
        return request
    }
    
    func deletePost(postId: Int) async throws {
        let request = try makeRequest(postId: postId)
        
        let (_, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        guard (200..<300).contains(httpResponse.statusCode) else {
            throw NetworkError(statusCode: httpResponse.statusCode)
        }
    }
}
