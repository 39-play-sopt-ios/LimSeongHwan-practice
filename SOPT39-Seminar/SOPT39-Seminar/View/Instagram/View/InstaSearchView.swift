//
//  InstaSearchView.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 10/17/26.
//

import SwiftUI

struct InstaSearchView: View {
    @State private var searchText: String = ""
    
    private let columnCount = 3
    private let rowCount = 6
    var body: some View {
        VStack(spacing: 23) {
            searchBar
            
            ScrollView {
                Grid(horizontalSpacing: 1, verticalSpacing: 1) {
                    ForEach(0..<6, id: \.self) { row in
                        GridRow {
                            ForEach(0..<3, id: \.self) { column in
                                let index = row * 3 + column + 1
                                
                                Color.clear
                                    .aspectRatio(1, contentMode: .fit)
                                    .overlay {
                                        Image("gridImage\(index)")
                                            .resizable()
                                            .scaledToFill()
                                    }
                                    .clipped()
                            }
                        }
                    }
                }
            }
        }
    }
    
    private var searchBar: some View {
        HStack {
            TextField("Search", text: $searchText)
                .padding(.leading, 15)
                .frame(width: 319, height: 36)
                .border(.gray200)
            Image(systemName: "bookmark")
        }
    }
}

#Preview {
    InstaSearchView()
}
