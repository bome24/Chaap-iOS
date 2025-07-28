//
//  PeopleSegmentView.swift
//  Chaap
//
//  Created by BoMin Lee on 7/17/25.
//

import SwiftUI
import SwiftData

struct PeopleSegmentView: View {
    @Query(sort: [SortDescriptor(\Chaap.createdAt, order: .reverse)])
    var allChaaps: [Chaap]

    // Chaap에서 모든 Peer를 추출
    var allPeers: [Peer] {
        allChaaps.flatMap { $0.peers }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                /// People grid
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                ], spacing: 32) {
                    ForEach(allPeers, id: \.tokenString) { peer in
                        VStack(spacing: 8) {
                            NavigationLink(destination: PeopleDetailView(peer: peer)) {
                                PeopleCircle(name: peer.displayName, iconName: peer.iconName)
                            }
                            
                            Text(peer.displayName)
                                .font(.chBodyBold)
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding(.horizontal, 22)
            }
            .padding(.top, 155)
        }
        
    }
}

#Preview {
    PeopleSegmentView()
}
