import SwiftUI
import SwiftData

@Model
class FavoriteSpot {
    var spotName: String
    var spotRegion: String
    var spotTheme: String
    var spotImageName: String
    var spotDescription: String
    var temperature: String?
    var dateAdded = Date()
    var isFavorite: Bool
    
    init(spot: Spot, weatherManager: WeatherManager, isFavorite: Bool = true) {
        self.spotName = spot.name
        self.spotDescription = spot.description
        self.spotRegion = spot.region
        self.spotTheme = spot.theme
        self.spotImageName = spot.imageName.first!
        self.temperature = weatherManager.temperature // 이러면 계속 바뀌는 거 아닌가?.. 흠...
        self.isFavorite = isFavorite
    }
}
