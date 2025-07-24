//
//  PeopleSegmentView.swift
//  Chaap
//
//  Created by BoMin Lee on 7/17/25.
//

import SwiftUI

// TODO: 실제 데이터로 변경해야 함
struct Person: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let totalCards: Int
    let currentCard: Int
}

struct PeopleSegmentView: View {
    // TODO: 실제 데이터로 변경 후 삭제
    private let people = [
        Person(name: "Enoch", imageName: "person.fill", totalCards: 13, currentCard: 1),
        Person(name: "Mumin", imageName: "person.fill", totalCards: 8, currentCard: 1),
        Person(name: "Minbol", imageName: "person.fill", totalCards: 5, currentCard: 1),
        Person(name: "Peppr", imageName: "person.fill", totalCards: 13, currentCard: 1),
        Person(name: "Jacob", imageName: "person.fill", totalCards: 7, currentCard: 1),
        Person(name: "Hari", imageName: "person.fill", totalCards: 12, currentCard: 1),
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                /// People grid
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                ], spacing: 32) {
                    ForEach(people) { person in
                        VStack(spacing: 8) {
                            // TODO: 네비게이션 어떻게 다룰지 의논 필요
                            NavigationLink(
                                destination: PeopleDetailView(person: person)
                            ) {
                                ZStack {
                                    /// Circle background
                                    Circle()
                                        .fill(Color.black.opacity(0.4))
                                        .frame(width: 96, height: 96)
                                    
                                    /// Person icon
                                    Image(systemName: person.imageName)
                                        .font(.system(size: 30))
                                        .foregroundColor(.white)
                                }
                            }
                            
                            Text(person.name)
                                .font(.chBodyBold)
                                .foregroundColor(.white)
                        }
                    }
                }
                .padding(.horizontal, 25)
                
                Spacer()
            }
            // TODO: Custom Background에 얹을 거라서 삭제
            .background(Color.blue)
        }
        
    }
}

#Preview {
    PeopleSegmentView()
}
