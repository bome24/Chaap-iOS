import SwiftUI

struct PeopleCircle: View {
    let name: String
    let iconName: String
    
    var body: some View {
        VStack(spacing: 8) {
            /// 원형 아이콘 컨테이너
            Image(iconName)
                .resizable()
                .frame(width: 40, height: 40)
                .frame(
                    maxWidth: .infinity,
                    minHeight: 96,
                    maxHeight: 96,
                    alignment: .center
                )
                .background(.white)
                .clipShape(Circle())
        
            /// 이름 텍스트
            Text(name)
                .font(.chPrimaryCaptionMedium)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
        }
    }
}

// MARK: - Private Computed Properties

//extension PeopleCircle {
//    /// 선택된 아이콘 이름
//    private var selectedIconName: String {
//        iconName ?? randomIcons.randomElement() ?? "person.fill"
//    }
//}
