import SwiftUI

struct RemainingDartsView: View {
    @Binding var remainingDarts: Int
    
    var body: some View {
        HStack {
            ForEach(0..<3-remainingDarts, id: \.self) {
                dart in
                Circle()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.gray)
            }
            
            ForEach(0..<remainingDarts, id: \.self) { dart in
                Circle()
                    .frame(width: 24, height: 24)
                    .foregroundStyle(.defaultBlack)
            }
        }
    }
}

#Preview {
    RemainingDartsView(remainingDarts: .constant(3))
}
