//
//  PeerChaapRow.swift
//  Chaap
//
//  Created by BoMin Lee on 7/28/25.
//

import SwiftUI

struct PeerChaapRow: View {
    var chaap: Chaap
    
    var body: some View {
        HStack {
            Circle()
                .background(Color.white)
            VStack {
                if !chaap.peers.isEmpty {
                    Text("[\(chaap.peers.map { $0.displayName }.joined(separator: ", "))]")
                }
                if let title = chaap.title {
                    Text(title)
                }
            }
            VStack {
                Text(chaap.createdAt.formatted())
                if let place = chaap.place {
                    Text(place)
                }
            }
        }
    }
}
