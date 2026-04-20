import SwiftUI

struct HeaderView: View {
    var body: some View {
        Text("다트 결과")
            .font(.headline)
        
        
    }
}

struct ResultView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentPageIndex = 0
    
    let photosOfYoungIlBridge: [String] = ["영일교", "영일교", "영일교"]
    
    var body: some View {
        VStack {
            HeaderView()
                .padding(.top, 30)
                .padding(.bottom, 10)
            
            VStack(alignment: .leading) {
                TabView(selection: $currentPageIndex) {
                    ForEach(photosOfYoungIlBridge.enumerated(), id: \.offset) { photo in
                        Image("\(photo.element)")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: .infinity)
                            .cornerRadius(20)
                            .padding(.horizontal)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .frame(height: 300)
                .padding(.top, -40)
                
                
                
                HStack(alignment: .bottom) {
                    Text("영일교")
                        .font(.largeTitle)
                        .fontWeight(.black)
                    Text("영일대 -> 멍때리기")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .offset(y: -5)
                    
                    Spacer()
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 5)
                
                Text("영일대 난간에 기대어 파도 소리 듣기")
                    .padding(.horizontal, 25)
            }
            
            Spacer()
            
            HStack {
                Button("길찾기") {
                    
                }
                .buttonStyle(.glass)
                .controlSize(.large)
                
                Button("동행 구하기") {
                    CompanyView()
                }
                .buttonStyle(.glassProminent)
                .controlSize(.large)
            }
            .frame(maxWidth: UIView.layoutFittingExpandedSize.width)
            
        }
        
    }
}

#Preview {
    ResultView()
}
