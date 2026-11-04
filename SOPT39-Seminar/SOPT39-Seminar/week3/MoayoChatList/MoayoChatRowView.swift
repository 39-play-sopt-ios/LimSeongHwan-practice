//
//  MoayoChatRowView.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 10/17/26.
//

import SwiftUI

struct MoayoChatRowView: View {
    let data: MoayoChatModel
    
    var body: some View {
        HStack {
            Image(data.profileImage)
                .resizable()
                .scaledToFill()
                .frame(width: 56, height: 56)
                .clipShape(Circle())
                .padding(.trailing, 12)
            VStack(alignment: .leading) {
                Text(data.name)
                    .font(.system(size: 13))
                HStack {
                    Text(data.message)
                        .font(.system(size: 13))
                        .foregroundStyle(.gray300)
                    Spacer()
                    Text(data.time)
                        .font(.system(size: 13))
                        .foregroundStyle(.gray300)
                }
            }
            .padding(.trailing, 32)
            Image(systemName: "camera")
                .frame(width: 23, height: 22)
                .foregroundStyle(.gray300)
        }
    }
}

#Preview {
    let data = MoayoChatModel(profileImage: "images", name: "juju", message: "안녕하세요 주주예용", time: "지금")
    MoayoChatRowView(data: data)
}
