//
//  PostCardView.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 10/10/26.
//

import SwiftUI

struct PostCardView: View {
    @Binding var isLiked: Bool
    let profileImage: Image
    let username: String
    let location: String
    let postImage: Image
    let likesText: String
    let caption: String
    let timeText: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            PostProfileHeaderView(username: username, location: location, profileImage: profileImage)
            
            feedImage
            actionIcons
            postInformation
        }
        .background(.white)
        .foregroundStyle(.black)
    }
    
    private var feedImage: some View {
        postImage
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
            Button {
                isLiked.toggle()
            } label: {
                Image(isLiked ? "like-fill" : "like")
            }
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
                profileImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20, height: 20)
                    .clipShape(Circle())
                
                Text("\(likesText)")
                    .font(.system(size: 14))
            }
            
            HStack(spacing: 6) {
                Text("\(username)")
                    .font(.system(size: 14, weight: .semibold))
                Text("\(caption)")
                    .font(.system(size: 14))
                    .fixedSize(horizontal: false, vertical: true)
            }
            
            Text("\(timeText)")
                .font(.system(size: 12))
                .foregroundStyle(.secondary)
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 12)
    }
}

//#Preview {
//    @Previewable @State var isLiked: Bool = false
//    PostCardView(isLiked: $isLiked)
//}
