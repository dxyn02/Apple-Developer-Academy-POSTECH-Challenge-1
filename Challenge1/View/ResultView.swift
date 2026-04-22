import SwiftUI
import SwiftData

struct HeaderView: View {
    var body: some View {
        Text("다트 결과")
            .font(.headline)
    }
}

struct ResultView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentPageIndex = 0
    var dartViewModel: DartViewModel
    
    @Environment(\.modelContext) var context
    @Query var favorites: [FavoriteSpot]
    
    private var isFavorite: Bool {
        guard let spot = dartViewModel.finalSpot else { return false }
        return favorites.contains { $0.spotName == spot.name && $0.spotRegion == spot.region}
    }
    
    var body: some View {
        VStack {
            HeaderView()
                .padding(.top, 30)
                .padding(.bottom, 10)
            
            VStack(alignment: .leading) {
                TabView(selection: $currentPageIndex) {
                    Image(dartViewModel.finalSpot!.imageName.first ?? "")
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(20)
                        .padding(20)
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .frame(height: 300)
                .padding(.top, -40)
                
                
                
                HStack(alignment: .bottom) {
                    Text(dartViewModel.finalSpot!.imageName.first ?? "")
                        .font(.largeTitle)
                        .fontWeight(.black)
                    Text("\(dartViewModel.finalSpot!.region) → \(dartViewModel.finalSpot!.theme)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .offset(y: -5)
                    
                    Spacer()
                    
                    Button {
                        toggleFavorite(for: dartViewModel.finalSpot!)
                    } label: {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(isFavorite ? .red : .gray)
                    }
                    .padding(.horizontal, 5)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 5)
                
                Text(dartViewModel.finalSpot!.description)
                    .padding(.horizontal, 25)
            }
            
            Spacer()
            
            HStack {
                Button("길찾기") {
                    
                }
                .buttonStyle(.glass)
                .controlSize(.large)
                
                Button("동행 구하기") {
                    
                }
                .buttonStyle(.glassProminent)
                .controlSize(.large)
            }
            .frame(maxWidth: UIView.layoutFittingExpandedSize.width)
        }
    }
    
    func toggleFavorite(for spot: Spot) {
        if isFavorite {
            if let existingFavorite = favorites.first(where: {
                $0.spotName == spot.name && $0.spotRegion == spot.region
            }) {
                context.delete(existingFavorite)
            }
        } else {
            let newFavorite = FavoriteSpot(spot: spot, weatherManager: WeatherManager())
            context.insert(newFavorite)
        }
    }
}

#Preview {
    let dummyDartViewModel = DartViewModel()
    
    dummyDartViewModel.finalSpot = Spot(
        region: "영일대",
        theme: "멍때리기",
        name: "영일교",
        imageName: ["영일교"],
        description: "영일대 난간에 기대어 파도 소리 듣기"
    )
    
    return ResultView(dartViewModel: dummyDartViewModel)
        .modelContainer(for: FavoriteSpot.self, inMemory: true)
}
