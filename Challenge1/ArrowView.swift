import SwiftUI

struct ArrowView: View {
    @Binding var remainingDarts: Int
    @Binding var isOnPanel: Bool
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                if (remainingDarts != 0 && isOnPanel == false) {
                    Image("dart arrow")
                        .resizable()
                        .frame(width: 39, height: 217)
                        .rotationEffect(Angle(degrees: 180))
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.75)
                }
                
                
            }
        }
    }
}

#Preview {
    ArrowView(remainingDarts: .constant(3), isOnPanel: .constant(true))
}
