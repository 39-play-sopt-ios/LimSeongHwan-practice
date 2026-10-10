//
//  PostProfileHeaderView.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 10/10/26.
//

import SwiftUI

struct PostProfileHeaderView: View {
    var body: some View {
        HStack(spacing: 10) {
            Image(.takho)
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 2) {
                Text("이상엽")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("서울 대한민국")
                    .font(.system(size: 12))
            }
            
            Spacer()
            
            Image(.more)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 12)
    }
}

#Preview {
    PostProfileHeaderView()
}
