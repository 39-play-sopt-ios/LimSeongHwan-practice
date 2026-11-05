//
//  KeychainManager.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 11/5/26.
//

import Foundation
import Security

enum KeychainKey: String {
    case authorizationCode
}

final class KeychainManager {
    static let shared = KeychainManager()

    private init() {}

    private var query: [String: Any] {
        [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: "com.sopt.keychain.practice",
            kSecAttrAccount as String: KeychainKey.authorizationCode.rawValue
        ]
    }

    func saveAuthorizationCode(_ code: String) {
        var addQuery = query
        addQuery[kSecValueData as String] = Data(code.utf8)

        let status = SecItemAdd(addQuery as CFDictionary, nil)

        if status == errSecDuplicateItem {
            updateAuthorizationCode(code)
        }
    }

    private func updateAuthorizationCode(_ code: String) {
        let newValue: [String: Any] = [
            kSecValueData as String: Data(code.utf8)
        ]

        SecItemUpdate(
            query as CFDictionary,
            newValue as CFDictionary
        )
    }
}
