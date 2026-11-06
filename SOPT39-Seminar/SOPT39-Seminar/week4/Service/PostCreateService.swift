//
//  PostCreateService.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 11/6/26.
//

import Foundation

final class PostCreateService {
    static let shared = PostCreateService()
    
    private init() {}
    
    private func makeRequestBody(title: String, content: String, author: String) throws -> Data {
        do {
            return try JSONEncoder().encode(PostCreateRequestDTO(title: title, content: content, author: author))
        } catch {
            throw NetworkError.requestEncodingError
        }
    }
    
    private func makeRequest(body: Data) throws -> URLRequest {
        guard let baseURL = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String, let url = URL(string: baseURL) else {
            throw NetworkError.urlError
        }
        
        guard let authorizationCode = KeychainManager.shared.read(for: .authorizationCode) else {
            throw NetworkError.unauthorized
        }
        
        var request = URLRequest(url: url.appending(path: "/api/v1/posts"))
        request.httpMethod = "POST"
        request.setValue(authorizationCode, forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = body
        
        return request
    }
    
    func postCreatePost(title: String, content: String, author: String) async throws -> PostDTO {
        let body = try makeRequestBody(title: title, content: content, author: author)
        let request = try makeRequest(body: body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        guard (200..<300).contains(httpResponse.statusCode) else {
            throw NetworkError(statusCode: httpResponse.statusCode)
        }
        
        do {
            let baseResponse = try JSONDecoder().decode(
                BaseResponseDTO<PostDTO>.self,
                from: data
            )
            guard let post = baseResponse.data else {
                throw NetworkError.responseDecodingError
            }
            return post
        } catch {
            throw NetworkError.responseDecodingError
        }
    }
}
