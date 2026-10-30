//
//  GroupListView.swift
//  SOPT39-Seminar
//
//  Created by 성환 on 10/17/26.
//

import SwiftUI

struct GroupListView: View {
    struct MoaGroup: Identifiable {
        let id = UUID()
        let name: String
        let members: [MoaMoaModel]
    }
    
    private let moaGroups = [
        MoaGroup(name: "1조", members: [MoaMoaModel(name: "성환"), MoaMoaModel(name: "세령")]),
        MoaGroup(name: "2조", members: [MoaMoaModel(name: "서영"), MoaMoaModel(name: "주희")]),
        MoaGroup(name: "3조", members: [MoaMoaModel(name: "보민"), MoaMoaModel(name: "보민")]),
        MoaGroup(name: "4조", members: [MoaMoaModel(name: "시언"), MoaMoaModel(name: "다연")]),
    ]
    
    @State private var singleSelection: UUID?
    var body: some View {
        NavigationStack {
            List(selection: $singleSelection) {
                ForEach(moaGroups) { group in
                    Section(group.name) {
                        ForEach(group.members) { moayo in
                            Text(moayo.name)
                                .tag(moayo.id)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    GroupListView()
}
