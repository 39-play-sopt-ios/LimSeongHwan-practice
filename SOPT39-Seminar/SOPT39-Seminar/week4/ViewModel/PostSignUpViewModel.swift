//
//  PostSignUpViewModel.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 11/6/26.
//

import Foundation
import Observation

@Observable
final class PostSignUpViewModel {
    var part = ""
    var name = ""
    private(set) var isLoading = false
    private(set) var authorizationCode = ""
    private(set) var errorMessage = ""
    
    func signup() async {
        guard !isLoading else { return }
        
        isLoading = true
        authorizationCode = ""
        errorMessage = ""
        defer { isLoading = false }
        
        do {
            let response = try await SignupService.shared.postSignup(part: part)
            try Task.checkCancellation()
            
            guard let code = response.data?.authorizationCode else {
                throw NetworkError.responseError
            }
            authorizationCode = code
            KeychainManager.shared.save(code, for: .authorizationCode)
            KeychainManager.shared.save(name, for: .nickname)
        } catch is CancellationError {
            // 취소 에렁
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
