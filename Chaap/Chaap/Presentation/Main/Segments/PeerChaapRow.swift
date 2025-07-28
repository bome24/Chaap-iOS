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
                        .font(.chPrimaryCaptionMedium)
                        .foregroundStyle(Color.chLabelWhiteSecondary)
                }
                if let title = chaap.title {
                    Text(title)
                        .font(.chBodyMedium)
                        .foregroundStyle(Color.chLabelWhitePrimary)
                }
            }
            VStack {
                Text(chaap.createdAt.formatted())
                if let place = chaap.place {
                    Text(place)
                }
            }
            .font(.chPrimaryCaptionMedium)
            .foregroundStyle(Color.chLabelWhiteSecondary)
        }
    }
}
