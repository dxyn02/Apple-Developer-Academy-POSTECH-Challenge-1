import SwiftUI
import Observation

struct PanelItem: Identifiable {
    var id: String { text }
    let text: String
    let xOffset: CGFloat
    let yOffset: CGFloat
    let paddingSize: CGFloat
}

@Observable
class DartViewModel{
    var remainingTimes: Int = 3
    var isStarted: Bool = false
    var isShaked: Bool = false
    var showModal: Bool = false
    
    var selectedRegion: String = ""
    var selectedTheme: String = ""
    var finalSpot: Spot? = nil
    
    private let layout6: [(x: CGFloat, y: CGFloat, padding: CGFloat)] = [
        (-110, -60, 30), (-100, 115, 35), (-30, 20, 45),
        (60, 120, 50), (90, -10, 45), (40, -130, 40)
    ]
    private let layout4: [(x: CGFloat, y: CGFloat, padding: CGFloat)] = [
        (-100, -70, 50), (80, -90, 70), (-110, 100, 65), (70, 90, 55)
    ]
    
    let roundDescriptions: [String] = [
         "마지막으로 활동을 정해보아요~", "이번엔 테마를 정할게요", "지역을 정해볼까요?"
    ]
    
    var currentPanelItems: [PanelItem] {
        if isShaked {
            let resultText: String
            switch remainingTimes {
            case 2: resultText = selectedRegion
            case 1: resultText = selectedTheme
            case 0: resultText = finalSpot?.name ?? ""
            default: return []
            }
            return [PanelItem(text: resultText, xOffset: 0, yOffset: 0, paddingSize: 60)]
        }
        
        switch remainingTimes {
        case 3:
            let regions = Array(Set(allSpots.map { $0.region })).sorted()
            return regions.enumerated().map { index, text in
                PanelItem(text: text, xOffset: layout6[index].x, yOffset: layout6[index].y, paddingSize: layout6[index].padding)
            }
        
        case 2:
            let themes = Array(Set(allSpots.map { $0.theme })).sorted()
            return themes.enumerated().map { index, text in
                PanelItem(text: text, xOffset: layout4[index].x, yOffset: layout4[index].y, paddingSize: layout4[index].padding)
            }
            
        case 1:
            let filteredSpots = allSpots.filter { $0.region == selectedRegion && $0.theme == selectedTheme }
            let names = filteredSpots.map { $0.name }
            let safeNames = Array(names.prefix(4))
            return safeNames.enumerated().map { index, text in
                PanelItem(text: text, xOffset: layout4[index].x, yOffset: layout4[index].y, paddingSize: layout4[index].padding)
            }
            
        default:
            return []
        }
    }
    
    func process() {
        guard !currentPanelItems.isEmpty else { return }
        
        let selectedItem = currentPanelItems.randomElement()!.text
        
        if remainingTimes == 3 {
            selectedRegion = selectedItem
            print("1라운드 결과: \(selectedRegion)")
        } else if remainingTimes == 2 {
            selectedTheme = selectedItem
            print("2라운드 결과: \(selectedTheme)")
        } else if remainingTimes == 1 {
            finalSpot = allSpots.first { $0.region == selectedRegion && $0.theme == selectedTheme && $0.name == selectedItem }
            print("3라운드 결과: \(finalSpot?.name ?? "알 수 없음")")
        }
        
        remainingTimes -= 1
        isShaked = true
    }
    
    func nextRound() {
        isShaked = false
    }
    
    func resetGame() {
        remainingTimes = 3
        isShaked = false
        isStarted = false
        selectedRegion = ""
        selectedTheme = ""
        finalSpot = nil
    }
}
