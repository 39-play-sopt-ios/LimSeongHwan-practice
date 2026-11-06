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
    case nickname
}

final class KeychainManager {
    static let shared = KeychainManager()

    private init() {}

    private func query(for key: KeychainKey) -> [String: Any] {
        [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: "com.sopt.keychain.practice",
            kSecAttrAccount as String: key.rawValue
        ]
    }

    func save(_ value: String, for key: KeychainKey) {
        var addQuery = query(for: key)
        addQuery[kSecValueData as String] = Data(value.utf8)

        let status = SecItemAdd(addQuery as CFDictionary, nil)

        if status == errSecDuplicateItem {
            update(value, for: key)
        }
    }

    func read(for key: KeychainKey) -> String? {
        var readQuery = query(for: key)
        readQuery[kSecReturnData as String] = true
        readQuery[kSecMatchLimit as String] = kSecMatchLimitOne

        var result: CFTypeRef?
        let status = SecItemCopyMatching(readQuery as CFDictionary, &result)

        guard status == errSecSuccess, let data = result as? Data else {
            return nil
        }
        return String(decoding: data, as: UTF8.self)
    }

    private func update(_ value: String, for key: KeychainKey) {
        let newValue: [String: Any] = [
            kSecValueData as String: Data(value.utf8)
        ]

        SecItemUpdate(
            query(for: key) as CFDictionary,
            newValue as CFDictionary
        )
    }
}
