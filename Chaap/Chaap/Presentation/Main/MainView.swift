//
//  MainView.swift
//  Chaap
//
//  Created by BoMin Lee on 7/17/25.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @StateObject private var viewModel = SegmentsViewModel()
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        NavigationStack {
            ZStack {
                selectedSegmentView
                
                VStack(alignment: .center, spacing: 15) {
                    CHNavBar()
                    SegmentControlPicker(selected: $viewModel.selectedSegement)
                    Spacer()
                }
                .safeAreaPadding(.top, 14)
                .safeAreaPadding(.horizontal, 16)
                VStack {
                    Spacer()
                    CHFloatingBtn()
                }
            }
        }
    }
    
    // MARK: - Selected Segment View
    @ViewBuilder
    var selectedSegmentView: some View {
        switch viewModel.selectedSegement {
        case .cardSegment:
            CardSegmentView()
        case .peopleSegment:
            PeopleSegmentView()
        case .calendarSegment:
            CalendarSegmentView(modelContext: modelContext)
        case .mapSegment:
            MapSegmentView()
        }
    }
}

#Preview {
    MainView()
}
