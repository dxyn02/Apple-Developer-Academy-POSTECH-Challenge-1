import SwiftUI

struct PanelView: View {
    @Binding var darts: Int
    @Binding var isSelected: Bool
    @State var startAnimation: Bool = false
    var animationDuration: Double = Double.random(in: 1.3...1.75)
    var animationDelay: Double = Double.random(in: 0.0...2.0)
    
    
    var body: some View {
        ZStack {
            Image("Ellipse")
                .frame(maxWidth: .infinity)
            
            // ForEach(data) { datum in
                
            
        }
    }
}

#Preview {
    PanelView(darts: .constant(3), isSelected: .constant(false), startAnimation: true, animationDuration: 1.5, animationDelay: 0.8)
}
