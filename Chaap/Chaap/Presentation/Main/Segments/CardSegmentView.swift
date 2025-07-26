//
//  CardSegmentView.swift
//  Chaap
//
//  Created by BoMin Lee on 7/17/25.
//

import SwiftUI

struct CardSegmentView: View {
    @State private var currentIndex: Int = 0
    @GestureState private var dragOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .background(.black.opacity(0.05))
                .background(
                    EllipticalGradient(
                        colors: [Color.chPrimary, Color.chSecondary],
                        center: .topLeading,
                        startRadiusFraction: 0.2,
                        endRadiusFraction: 1.0
                    )
                    .scaleEffect(x: 1.6, y: 1.0, anchor: .topLeading)
                )
                .ignoresSafeArea(.all)
            
            GeometryReader { proxy in
                ZStack {
                    ForEach(Array(dummyData.enumerated()), id: \.offset) { index, model in
                        if abs(index - currentIndex) <= 1 {
                            CHCardShow(viewModel: dummyData[index])
                                .frame(width: 319, height: 389)
                                .offset(y: cardOffset(for: index))
                                .scaleEffect(scale(for: index))
                                .opacity(scale(for: index))
                                .zIndex(zIndex(for: index))
                                .animation(.spring(), value: currentIndex)
                                .gesture(
                                    DragGesture()
                                        .updating($dragOffset) { value, state, _ in
                                            if index == currentIndex {
                                                let direction = value.translation.height
                                                if (currentIndex > 0 && direction > 0) || (currentIndex < dummyData.count - 1 && direction < 0) {
                                                    state = value.translation.height
                                                }
                                            }
                                        }
                                        .onEnded { value in
                                            if value.translation.height < -10 && currentIndex < dummyData.count - 1 {
                                                currentIndex += 1
                                            } else if value.translation.height > 10 && currentIndex > 0 {
                                                currentIndex -= 1
                                            }
                                        }
                                )
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .safeAreaPadding(.horizontal, 37)
                .safeAreaPadding(.top, 203)
                .safeAreaPadding(.bottom, 176)
            }
        }
    }
    
    func cardOffset(for index: Int) -> CGFloat {
        if index == currentIndex {
            return dragOffset
        } else if index < currentIndex {
            return -45
        } else {
            return 45
        }
    }
    
    func scale(for index: Int) -> CGFloat {
        index == currentIndex ? 1.0 : 0.9
    }
    
    func opacity(for index: Int) -> Double {
        index == currentIndex ? 1.0 : 0.9
    }
    
    func zIndex(for index: Int) -> Double {
        index == currentIndex ? 2 : 1
    }
    
    // MARK: - 더미 Chaap 4개
    private let dummyData: [CHCardShowViewModel] = {
        let titles = ["카페에서 수다", "산책", "스터디", "전시회"]
        let memos = ["오랜만에 친구와 만남", "강아지랑 한강 걷기", "팀 프로젝트 준비", "MMCA 전시 관람"]
        let places = ["망원동", "여의도", "성수동", "삼청동"]
        
        return zip(titles, zip(memos, places)).map { title, memoPlace in
            let (memo, place) = memoPlace
            let chaap = Chaap(
                createdAt: Date(),
                place: place,
                latitude: nil,
                longitude: nil,
                title: title,
                memo: memo,
                photoData: nil,
                peers: [] // Peer 없이 테스트
            )
            return CHCardShowViewModel(chaap: chaap)
        }
    }()
}

#Preview {
    CardSegmentView()
}
