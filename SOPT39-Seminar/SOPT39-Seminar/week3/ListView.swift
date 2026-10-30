//
//  ListView.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 10/17/26.
//

import SwiftUI

struct ListView: View {
    private var moas: [MoaMoaModel] = [
        MoaMoaModel(name: "성환"),
        MoaMoaModel(name: "세령"),
        MoaMoaModel(name: "서영"),
        MoaMoaModel(name: "주희")
    ]
    
    @State private var multiSelection = Set<UUID>()
    
    var body: some View {
        NavigationStack {
            List(moas, selection: $multiSelection) {
                moayo in Text(moayo.name)
            }
            .navigationTitle("Moas")
            .toolbar { EditButton() }
        }
        
        Text("\(multiSelection.count) selection")
    }
}

#Preview {
    ListView()
}
