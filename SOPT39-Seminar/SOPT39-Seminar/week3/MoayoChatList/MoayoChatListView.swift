//
//  MoayoChatListView.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 10/17/26.
//

import SwiftUI

struct MoayoChatListView: View {
    let data: [MoayoChatModel] = chatData
    var body: some View {
        List(data) { data in
            MoayoChatRowView(data: data)
                .listRowSeparator(.hidden)
                .listRowInsets(
                    EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16)
                )
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(.white)
    }
}

#Preview {
    MoayoChatListView()
}
