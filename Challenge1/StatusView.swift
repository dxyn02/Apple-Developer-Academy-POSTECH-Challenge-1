import SwiftUI

struct StatusView: View {
    @Binding var remainingDarts: Int
    
    var body: some View {
            HStack {
                VStack(spacing: 0) {
                    HStack {
                        HStack {
                            Image(systemName: "moon.stars.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 70, height: 70)
                                .foregroundStyle(Color("Default Text"))
                            
                            Text("19℃")
                                .foregroundStyle(Color("Default Text"))
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .offset(x: 0, y: 17)
                        }
                        
                        HStack {
                            switch remainingDarts {
                            case 2:
                                Text("\(remainingDarts)")
                                    .font(.system(size: 64, weight: .bold))
                                    .offset(x: 7, y: 0)
                                    .foregroundStyle(Color("Remaining Darts"))
                            case 1, 0:
                                Text("\(remainingDarts)")
                                    .font(.system(size: 64, weight: .bold))
                                    .offset(x: 7, y: 0)
                                    .foregroundStyle(Color("Text Gradient 2"))
                            default:
                                Text("\(remainingDarts)")
                                    .font(.system(size: 64, weight: .bold))
                                    .offset(x: 7, y: 0)
                                    .foregroundStyle(Color("Default White"))
                            }
                            
                            Text("/3")
                                .font(.system(size: 64, weight: .bold))
                                .foregroundStyle(Color("Default White"))
                            
                            
                        }.padding(.leading, 30)
                            .offset(x: 0, y: -5)
                    }.frame(maxWidth: .infinity)
                    
                    HStack {
                        Text("오늘 밤에 딱 맞는 장소만 담았어요")
                            .foregroundStyle(LinearGradient(colors: [Color("Text Gradient 1"), Color("Text Gradient 2")], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .padding(.trailing, 20)
                        
                        HStack {
                            if (remainingDarts >= 0) {
                                ForEach(Array(0..<remainingDarts), id: \.self) { _ in
                                    Image("dart arrow")
                                        .resizable()
                                        .frame(width: 7, height: 39)
                                        .rotationEffect(Angle(degrees: 180))
                                }
                            }
                        }.frame(width: 25, height: 39)
                    }
                }
                
                
                
            }.padding()
                .cornerRadius(30)
                .frame(maxWidth: .infinity)
                .glassEffect(.regular.tint(Color("Background Gradient 1").opacity(0.5)).interactive(), in: .rect(cornerRadius: 30))
                .padding(.horizontal)
        
            
        
    }
}


#Preview {
    StatusView(remainingDarts: .constant(1))
}
