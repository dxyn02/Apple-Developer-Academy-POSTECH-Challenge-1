import SwiftUI
import Combine
import WeatherKit
import CoreLocation

class WeatherManager: ObservableObject {
    @Published var temperature: String = "-"
    @Published var condition: String = "-"
    @Published var humidity: String = "-"
    @Published var symbolName: String = "moon.stars.fill"
    @Published var displayMessage: String = "오늘 밤에 딱 맞는 장소만 담았어요"
    
    private let rainyConditions: [WeatherCondition] = [.drizzle, .heavyRain, .isolatedThunderstorms, .rain, .sunShowers, .scatteredThunderstorms, .strongStorms, .thunderstorms]
    
    private let hazardousConditions: [WeatherCondition] = [.frigid, .hail, .hot]
    
    private let tropicalHazardConditions: [WeatherCondition] = [.hurricane, .tropicalStorm]
    
    private let windyConditions: [WeatherCondition] = [.breezy, .windy]
    
    private let snowyConditions: [WeatherCondition] = [.flurries, .sleet, .snow, .sunFlurries, .wintryMix, .blizzard, .blowingSnow, .freezingDrizzle, .freezingRain, .heavySnow]
    
    private let clearConditions: [WeatherCondition] = [.clear, .mostlyClear, .partlyCloudy]
    
    private let cloudyConditions: [WeatherCondition] = [.cloudy, .mostlyCloudy, .partlyCloudy]
    
    private let rainyDisplayMessages: [String] = [
        "오늘 밤, 비 예보가 있어요",
        "비 오는 날엔 파전!",
        "오늘은 집에서 책을 읽어볼까요?"
    ]
    
    private let hazardousDisplayMessages: [String] = [
        "집에서 휴식을 권장하는 날씨예요",
        "오늘 밤 외출은 위험해요"
    ]
    
    private let tropicalHazardDisplayMessages: [String] = [
        "태풍 및 허리케인 주의!",
        "외출 시 강풍에 주의하세요"
    ]
    
    private let windyDisplayMessages: [String] = [
        "오늘은 바람이 많이 불 수 있어요",
        "외출 시 따뜻한 외투를 챙기세요!"
    ]
    
    private let snowyDisplayMessages: [String] = [
        "하얀 눈이 내려올 때면~",
        "우산 꼭 챙기세요!",
        "눈사람 만들러 나가볼까요?"
    ]
    
    private let clearDisplayMessages: [String] = [
        "하늘 위의 별들을 바라보며 힐링 어때요?",
        "오늘은 맑은 하늘! 걷기 좋은 날씨예요",
        "오늘 밤에 딱 맞는 장소만 담았어요"
    ]
    
    private let cloudyDisplayMessages: [String] = [
        "센치해지는 날씨, 어디로 가볼까요?",
        "오늘 밤에 딱 맞는 장소만 담았어요"
    ]
    
    
    let location = CLLocation(latitude: 36.0, longitude: 129.3)
    let weatherService = WeatherService.shared
    
    func fetchWeather() async {
        do {
            let currentHour = Calendar.current.component(.hour, from: Date())
            
            if currentHour < 19 {
                let hourlyForecast = try await weatherService.weather(for: location, including: .hourly)
                print(hourlyForecast)
                
                let targetHour = 19
                
                if let targetWeather = hourlyForecast.first(where: {
                    Calendar.current.component(.hour, from: $0.date) == targetHour
                }) {
                    self.temperature = "\(Int(targetWeather.temperature.value))°"
                    print(self.temperature)
                    self.condition = "\(targetWeather.condition)"
                    print(self.condition)
                    self.humidity = "\(Int(targetWeather.humidity * 100))"
                    print(self.humidity)
                    self.symbolName = "\(targetWeather.symbolName)" + ".fill"
                    
                    if rainyConditions.contains(targetWeather.condition) {
                        displayMessage = rainyDisplayMessages.randomElement() ?? "오늘 밤에 딱 맞는 장소만 담았어요"
                    }
                    
                    if hazardousConditions.contains(targetWeather.condition) {
                        displayMessage = hazardousDisplayMessages.randomElement() ?? "오늘 밤에 딱 맞는 장소만 담았어요"
                    }
                    
                    if tropicalHazardConditions.contains(targetWeather.condition) {
                        displayMessage = tropicalHazardDisplayMessages.randomElement() ?? "오늘 밤에 딱 맞는 장소만 담았어요"
                    }
                    
                    if windyConditions.contains(targetWeather.condition) {
                        displayMessage = windyDisplayMessages.randomElement() ?? "오늘 밤에 딱 맞는 장소만 담았어요"
                    }
                    
                    if snowyConditions.contains(targetWeather.condition) {
                        displayMessage = snowyDisplayMessages.randomElement() ?? "오늘 밤에 딱 맞는 장소만 담았어요"
                    }
                    
                    if clearConditions.contains(targetWeather.condition) {
                        displayMessage = clearDisplayMessages.randomElement() ?? "오늘 밤에 딱 맞는 장소만 담았어요"
                    }
                    
                    if cloudyConditions.contains(targetWeather.condition) {
                        displayMessage = cloudyDisplayMessages.randomElement() ?? "오늘 밤에 딱 맞는 장소만 담았어요"
                    }
                    
                } else {
                    print("날씨 데이터를 찾을 수 없음")
                }
            } else {
                let forecast = try await weatherService.weather(for: location)
                let currentTemperature = forecast.currentWeather.temperature
                let currentCondition = forecast.currentWeather.condition
                let currentConditionImage = forecast.currentWeather.symbolName
                let currentHumidity = forecast.currentWeather.humidity
                
                self.temperature = "\(Int(currentTemperature.value))°"
                self.condition = "\(currentCondition)"
                self.symbolName = "\(currentConditionImage)" + ".fill"
                self.humidity = "\(Int(currentHumidity * 100))"
                
                if rainyConditions.contains(currentCondition) {
                    displayMessage = rainyDisplayMessages.randomElement() ?? "오늘 밤에 딱 맞는 장소만 담았어요"
                }
                
                if hazardousConditions.contains(currentCondition) {
                    displayMessage = hazardousDisplayMessages.randomElement() ?? "오늘 밤에 딱 맞는 장소만 담았어요"
                }
                
                if tropicalHazardConditions.contains(currentCondition) {
                    displayMessage = tropicalHazardDisplayMessages.randomElement() ?? "오늘 밤에 딱 맞는 장소만 담았어요"
                }
                
                if windyConditions.contains(currentCondition) {
                    displayMessage = windyDisplayMessages.randomElement() ?? "오늘 밤에 딱 맞는 장소만 담았어요"
                }
                
                if snowyConditions.contains(currentCondition) {
                    displayMessage = snowyDisplayMessages.randomElement() ?? "오늘 밤에 딱 맞는 장소만 담았어요"
                }
                
                if clearConditions.contains(currentCondition) {
                    displayMessage = clearDisplayMessages.randomElement() ?? "오늘 밤에 딱 맞는 장소만 담았어요"
                }
                
                if cloudyConditions.contains(currentCondition) {
                    displayMessage = cloudyDisplayMessages.randomElement() ?? "오늘 밤에 딱 맞는 장소만 담았어요"
                }
            }
            
            
            
        } catch {
            print("날씨 데이터 가져오기 실패: \(error)")
        }
    }
    
}
