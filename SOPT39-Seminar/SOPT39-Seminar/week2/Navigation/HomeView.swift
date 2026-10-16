//
//  HomeView.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 10/10/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                DetailView()
            } label: {
                Text("상세화면으로 이동")
            }
            .navigationTitle("홈")
        }
    }
}

#Preview {
    HomeView()
}
