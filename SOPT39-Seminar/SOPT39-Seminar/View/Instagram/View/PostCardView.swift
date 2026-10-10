//
//  PostCardView.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 10/10/26.
//

import SwiftUI

struct PostCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            PostProfileHeaderView()
            
            postImage
            actionIcons
            postInformation
        }
        .background(.white)
        .foregroundStyle(.black)
    }
    
    private var postImage: some View {
        Image(.instapost)
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity)
            .aspectRatio(1, contentMode: .fit)
            .clipped()
            .overlay(alignment: .topTrailing) {
                Text("1/3")
                    .font(.system(size:12))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(.black.opacity(0.7), in: Capsule())
                    .padding(16)
            }
    }
    
    private var actionIcons: some View {
        HStack(spacing: 18) {
            Image(.like)
            Image(.comment)
            Image(.messanger)
            
            Spacer()
            
            Image(.save)
        }
        .font(.system(size: 24, weight: .light))
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
    }
    
    private var postInformation: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 6) {
                Image(.takho)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .clipShape(Circle())
                
                Text("모아요님 외 7,777명이 좋아합니다")
                    .font(.system(size: 14))
            }
            
            HStack(spacing: 6) {
                Text("이상엽")
                    .font(.system(size: 14, weight: .semibold))
                Text("벌써 2차 세미나라니 정말 힘들어여")
                    .font(.system(size: 14))
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Text("1시간전")
                .font(.system(size: 12))
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 12)
    }
}

#Preview {
    PostCardView()
}
