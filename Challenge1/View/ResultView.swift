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
    @State private var isSelecting = false
    
    @Environment(\.modelContext) var context
    @Query var favorites: [FavoriteSpot]
    
    private var isFavorite: Bool {
        guard let spot = dartViewModel.finalSpot else { return false }
        return favorites.contains { $0.spotName == spot.name && $0.spotRegion == spot.region}
    }
    
    var body: some View {
        VStack {
            //HeaderView()
            
            VStack(alignment: .leading) {
                TabView(selection: $currentPageIndex) {
                    Image(dartViewModel.finalSpot!.imageName.first ?? "")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, maxHeight: 220)
                        .cornerRadius(20)
                        .padding(.horizontal, 20)
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                .frame(height: 300)
                
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
                    isSelecting = true
                }
                .buttonStyle(.glass)
                .controlSize(.large)
//                .confirmationDialog(
//                    "어떤 앱으로 길을 찾을까요?",
//                    isPresented: $isSelecting) { <#T##() -> View#>, message: {
//                        Text("선택하신 앱으로 목적지까지 가는 방법을 알아볼게요."))
//                    }
                
                Button("동행 구하기") {
                    
                }
                .buttonStyle(.glassProminent)
                .controlSize(.large)
            }
            .frame(maxWidth: UIView.layoutFittingExpandedSize.width)
            .padding(.bottom, 20)
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
    
    dummyDartViewModel.finalSpot = Spot(region: "효자·지곡", theme: "카페", name: "소디스에스프레소바", imageName: ["효자 소디스"], description: "소디스에스프레소바 음료 테이크아웃 해서 지곡 회관 앞 벤치에서 마시기")
    
    return ResultView(dartViewModel: dummyDartViewModel)
        .modelContainer(for: FavoriteSpot.self, inMemory: true)
}
