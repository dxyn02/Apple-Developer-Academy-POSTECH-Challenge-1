import SwiftUI

struct WeatherView: View {
    @Binding var remainingDarts: Int
    @StateObject var weatherManager = WeatherManager()
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Image(systemName: weatherManager.symbolName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70, height: 70)
                        .foregroundStyle(.defaultText)
                        
                    
                    Text(weatherManager.condition)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.secondary)
                        .offset(y: -10)
                }

                VStack (alignment: .leading) {
                    Text("기온")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.secondary)
                    
                    Text(weatherManager.temperature)
                        .font(.system(size: 48, weight: .bold))
                        .foregroundStyle(.defaultText)
                }
                .padding(.horizontal, 20)
                
                VStack (alignment: .leading) {
                    Text("습도")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.secondary)
                    
                    HStack (alignment: .bottom) {
                        Text(weatherManager.humidity)
                            .font(.system(size: 48, weight: .bold))
                            .foregroundStyle(.defaultText)
                        
                        Text("%")
                            .font(.system(size: 20, weight: .bold))
                            .offset(y: -10)
                            .padding(.leading, -5)
                            .foregroundStyle(.defaultText)
                    }
                }
            }
            
            Text(weatherManager.displayMessage)
                .font(.system(size: 16, weight: .medium))
                .minimumScaleFactor(0.3)
                .lineLimit(1)
                .foregroundStyle(LinearGradient(colors: [Color("AccentGradient1"), Color("AccentGradient2")], startPoint: .topLeading, endPoint: .bottomTrailing))
        }
        .padding()
        .frame(maxWidth: .infinity)
        .glassEffect()
        .padding(.horizontal, 20)
        .task {
            await weatherManager.fetchWeather()
        }
    }
}


#Preview {
    WeatherView(remainingDarts: .constant(1))
}
