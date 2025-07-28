import SwiftUI

struct PeopleCircle: View {
    let name: String
    let iconName: String?
    
    /// 배경색과 아이콘 색상 쌍
    private let colorThemes = [
        (
            backgroundColor: Color(
                red: 0/255,
                green: 0/255,
                blue: 0/255,
                opacity: 0.4
            ),
            iconColor: Color(
                red: 255/255,
                green: 255/255,
                blue: 255/255,
                opacity: 1
            )
        ),
        (
            backgroundColor: Color(
                red: 255/255,
                green: 255/255,
                blue: 255/255,
                opacity: 1
            ),
            iconColor: Color(
                red: 0/255,
                green: 0/255,
                blue: 0/255,
                opacity: 0.5
            )
        ),
    ]
    
    /// 랜덤 아이콘 6가지
    private let randomIcons = [
        "star.fill",
        "heart.fill",
        "bolt.fill",
        "leaf.fill",
        "moon.fill",
        "sun.max.fill",
    ]
    
    /// 선택된 색상 테마 (한 번만 선택되도록 저장)
    private let selectedColorTheme: (backgroundColor: Color, iconColor: Color)
    
    init(name: String, iconName: String? = nil) {
        self.name = name
        self.iconName = iconName
        
        // 테마를 한 번만 선택하여 고정
        let defaultTheme = (
            backgroundColor: Color.black.opacity(0.4),
            iconColor: Color.white
        )
        self.selectedColorTheme = colorThemes.randomElement() ?? defaultTheme
    }
    
    var body: some View {
        VStack(spacing: 8) {
            /// 원형 아이콘 컨테이너
            HStack(alignment: .center, spacing: 4) {
                Image(systemName: selectedIconName)
                    .font(.system(size: 32, weight: .medium))
                    .foregroundColor(selectedIconColor)
            }
            .padding(4)
            .frame(
                maxWidth: .infinity,
                minHeight: 96,
                maxHeight: 96,
                alignment: .center
            )
            .background(selectedBackgroundColor)
            .clipShape(Circle())
            
            /// 이름 텍스트
            Text(name)
                .font(.chPrimaryCaptionMedium)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .top)
        }
    }
}

// MARK: - Private Computed Properties

extension PeopleCircle {
    /// 선택된 아이콘 이름
    private var selectedIconName: String {
        iconName ?? randomIcons.randomElement() ?? "person.fill"
    }
    
    /// 선택된 아이콘 색상
    private var selectedIconColor: Color {
        selectedColorTheme.iconColor
    }
    
    /// 선택된 배경 색상
    private var selectedBackgroundColor: Color {
        selectedColorTheme.backgroundColor
    }
}

// MARK: - Preview

#Preview {
    VStack {
        HStack {
            PeopleCircle(name: "Enoch")
            PeopleCircle(name: "Mumin")
            PeopleCircle(name: "Minbol")
        }
        .padding()
        
        HStack {
            PeopleCircle(name: "Peppr")
            PeopleCircle(name: "Jacob")
            PeopleCircle(name: "Hari")
        }
        .padding()
    }
    .background(Color.gray)
} 