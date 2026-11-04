//
//  MoayoChatModel.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 10/17/26.
//

import Foundation

struct MoayoChatModel: Identifiable {
    let id = UUID()
    let profileImage: String
    let name: String
    let message: String
    let time: String
}

let chatData: [MoayoChatModel] = [
    MoayoChatModel(profileImage: "images", name: "juju", message: "안녕하세요 주주예용", time: "지금"),
    MoayoChatModel(profileImage: "takho", name: "huihui", message: "반가워용 희희예용", time: "지금"),
    MoayoChatModel(profileImage: "instapost", name: "yupyup", message: "3차 세미나 렛쮸고", time: "15m"),
    MoayoChatModel(profileImage: "takho", name: "tacos", message: "아~ 즐겁다~..", time: "20m"),
    MoayoChatModel(profileImage: "images", name: "kk_kk", message: "나의 노래를 들어보실분 나는 케케", time: "1m"),
    MoayoChatModel(profileImage: "feed2", name: "hello_moa", message: "모아요에 오신 걸 환영", time: "2h"),
    MoayoChatModel(profileImage: "takho", name: "goTosleep", message: "Zzz..", time: "4h"),
    MoayoChatModel(profileImage: "instapost", name: "hungryMan", message: "저랑 떵개하실래요?", time: "5h"),
    MoayoChatModel(profileImage: "instapost", name: "moamoayo", message: "모아요에서 사과 한 입! 앙~", time: "10h"),
]
