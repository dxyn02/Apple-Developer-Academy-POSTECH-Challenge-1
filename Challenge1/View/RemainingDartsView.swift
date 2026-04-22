import SwiftUI

struct RemainingDartsView: View {
    @Binding var remainingDarts: Int
    var dartViewModel: DartViewModel
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0..<3-remainingDarts, id: \.self) {
                    dart in
                    Circle()
                        .frame(width: 18, height: 18)
                        .foregroundStyle(.gray)
                }
                
                ForEach(0..<remainingDarts, id: \.self) { dart in
                    Circle()
                        .frame(width: 18, height: 18)
                        .foregroundStyle(.remainingDarts)
                }
            }
            .padding(.bottom, 10)
            
            if remainingDarts > 0 {
                Text(dartViewModel.roundDescriptions[remainingDarts - 1])
                    .font(.subheadline)
                    .foregroundStyle(Color(.defaultBlack))
            }
            
            if remainingDarts == 0 {
                Text("\(dartViewModel.finalSpot!.name)(이)가 나왔어요!")
                    .font(.subheadline)
                    .foregroundStyle(Color(.defaultBlack))
            }
        }
    }
}

#Preview {
    RemainingDartsView(remainingDarts: .constant(3), dartViewModel: DartViewModel())
}
