//
//  BaseResponseDTO.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 11/4/26.
//

import Foundation

struct BaseResponseDTO<T: Decodable>: Decodable {
    let isSuccess: Bool
    let code: String
    let message: String
    let data: T
}
