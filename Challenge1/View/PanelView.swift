import SwiftUI

struct PanelView: View {
    let items: [PanelItem]
    
    @State var startAnimation: Bool = false
    
    var body: some View {
        ZStack {
            Image("Ellipse")
                .frame(maxWidth: .infinity)
            
            ForEach(items) { item in
                Text(item.text)
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                    .padding(item.paddingSize)
                    .glassEffect(in: .circle)
                    .shadow(color: .black.opacity(0.25), radius: 20, x: 6, y: 4)
                    .offset(x: item.xOffset, y: item.yOffset)
                    .offset(x: startAnimation ? -5 : 5, y: startAnimation ? -5 : 5)
                    .animation(
                        .easeInOut(duration: Double.random(in: 1.3...1.75))
                        .repeatForever(autoreverses: true)
                        .delay(Double.random(in: 0.0...2.0)), value: startAnimation
                    )
            }
        }
        .frame(maxWidth: .infinity)
        .onAppear {
            startAnimation = true
        }
    }
}

//#Preview {
//    PanelView(items: [
//            PanelItem(text: "효자/지곡", xOffset: 40, yOffset: -130, paddingSize: 40),
//            PanelItem(text: "송도", xOffset: -110, yOffset: -60, paddingSize: 30),
//            PanelItem(text: "영일대", xOffset: -110, yOffset: 100, paddingSize: 35),
//            PanelItem(text: "환호/여남", xOffset: 90, yOffset: -10, paddingSize: 45),
//            PanelItem(text: "죽도/동빈내항", xOffset: 110, yOffset: 120, paddingSize: 30),
//            PanelItem(text: "이동/대잠", xOffset: -30, yOffset: 20, paddingSize: 40)
//        ])
//}
