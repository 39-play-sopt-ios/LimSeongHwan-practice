//
//  PostListService.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 11/6/26.
//

import Foundation

final class PostListService {
    static let shared = PostListService()
    
    private init() {}
    
    private func makeRequest(keyword: String, cursor: Int?, size: Int?) throws -> URLRequest {
        guard let baseURL = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String, let url = URL(string: baseURL) else {
            throw NetworkError.urlError
        }
        
        var queryItems: [URLQueryItem] = []
        if !keyword.isEmpty {
            queryItems.append(URLQueryItem(name: "keyword", value: keyword))
        }
        if let cursor {
            queryItems.append(URLQueryItem(name: "cursor", value: String(cursor)))
        }
        if let size {
            queryItems.append(URLQueryItem(name: "size", value: String(size)))
        }
        
        var request = URLRequest(url: url.appending(path: "/api/v1/posts").appending(queryItems: queryItems))
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        return request
    }
    
    func getPostList(keyword: String = "", cursor: Int? = nil, size: Int? = nil) async throws -> PostListResponseDTO {
        let request = try makeRequest(keyword: keyword, cursor: cursor, size: size)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        guard (200..<300).contains(httpResponse.statusCode) else {
            throw NetworkError(statusCode: httpResponse.statusCode)
        }
        
        do {
            let baseResponse = try JSONDecoder().decode(
                BaseResponseDTO<PostListResponseDTO>.self,
                from: data
            )
            return baseResponse.data
        } catch {
            throw NetworkError.responseDecodingError
        }
    }
}
