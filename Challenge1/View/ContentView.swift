import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("다트 던지기", systemImage: "flag.fill") {
                DartView()
            }
            
            Tab("동행 구하기", systemImage: "car.fill") {
                CompanyView()
            }
        }
        .tabBarMinimizeBehavior(.automatic)
    }
}


#Preview {
    ContentView()
}
