import SwiftUI

struct FloatingItemView: View {
    let item: PanelItem
    
    @State private var startAnimation: Bool = false
    
    var body: some View {
        Text(item.text)
            .font(.system(size: 20))
            .multilineTextAlignment(.center)
            .padding(item.paddingSize)
            .glassEffect(in: .circle)
            .shadow(color: .black.opacity(0.25), radius: 20, x: 6, y: 4)
            .offset(x: item.xOffset, y: item.yOffset)
            .offset(x: startAnimation ? -5 : 5, y: startAnimation ? -5 : 5)
            .scaleEffect(startAnimation ? 1.0 : 0.95)
            .animation(
                .easeInOut(duration: Double.random(in: 1.3...1.75))
                .repeatForever(autoreverses: true)
                .delay(Double.random(in: 0.0...2.0)),
                value: startAnimation
            )
            .onAppear {
                startAnimation = true
            }
    }
}

struct PanelView: View {
    let items: [PanelItem]
    
    var body: some View {
        ZStack {
            Image("Ellipse")
                .frame(maxWidth: .infinity)
            
            ForEach(items) { item in
                FloatingItemView(item: item)
            }
        }
        .frame(maxWidth: .infinity)
    }
}
