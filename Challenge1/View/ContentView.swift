import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            DartView()
                .tabItem {
                    Label("오늘 밤 뭐햐지?", systemImage: "flag.fill")
                }
                .tag(0)
            
            FavoritesView(selectedTab: $selectedTab)
                .tabItem {
                    Label("저장된 활동", systemImage: "heart.fill")
                }
                .tag(1)
        }
        .tabBarMinimizeBehavior(.automatic)
    }
}


#Preview {
    ContentView()
}
