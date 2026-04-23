import SwiftUI
import SwiftData

struct FavoriteRowView: View {
    var favoriteSpot: FavoriteSpot
    @Query var favorites: [FavoriteSpot]
    @Environment(\.modelContext) var context
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Image(favoriteSpot.spotImageName)
                    .resizable()
                    .frame(width: 81, height: 54)
                    .scaledToFill()
                    .cornerRadius(10)
                    .foregroundStyle(Color(.defaultBlack))
                
                VStack (alignment: .leading) {
                    Text(favoriteSpot.spotImageName)
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                    
                    Text("\(favoriteSpot.spotRegion) → \(favoriteSpot.spotTheme)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                Image(systemName: favoriteSpot.isFavorite ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .foregroundColor(favoriteSpot.isFavorite ? .red : .gray)
                    .onTapGesture {
                        context.delete(favoriteSpot)
                    }
            }
            .padding(.horizontal, 20)
            
            Text(favoriteSpot.spotDescription)
                .font(.system(size: 17))
                .foregroundStyle(Color(.gray))
                .lineLimit(1)
                .padding(.horizontal, 20)
            
        }
        .frame(maxWidth: .infinity)
    }
}


struct FavoritesView: View {
    @Query(sort: \FavoriteSpot.dateAdded, order: .reverse) var favorites: [FavoriteSpot]
    @Environment(\.modelContext) var context
    
    @Binding var selectedTab: Int
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.newBackground)
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Text("저장된 활동")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.bottom, 3)
                            .foregroundStyle(Color(.defaultBlack))
                        
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                    
                    List {
                        ForEach(favorites) { spot in
                            let destinationVM = createViewModel(favoriteSpot: spot)
                            NavigationLink {
                                ResultView(dartViewModel: destinationVM)
                            } label: {
                                FavoriteRowView(favoriteSpot: spot)
                            }
                            //.listRowBackground(Color.clear)
                        }
                        .onDelete { indexSet in
                            for index in indexSet {
                                context.delete(favorites[index])
                            }
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .padding(.horizontal, 20)
                    .padding(.bottom, 50)
                }
                
                if favorites.isEmpty {
                    VStack(spacing: 20) {
                        Text("아직 저장된 활동이 없어요.")
                            .font(.subheadline)
                        
                        Button("오늘 밤 뭐하지?") {
                            selectedTab = 0
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.backgroundGradient2)
                        .foregroundStyle(Color(.defaultBlack))
                    }
                }
            }
        }
        
    }
    
    func createViewModel(favoriteSpot: FavoriteSpot) -> DartViewModel {
        let destinationViewModel: DartViewModel = DartViewModel()
        
        destinationViewModel.finalSpot = allSpots.first { $0.name == favoriteSpot.spotName && $0.region == favoriteSpot.spotRegion }
        
        return destinationViewModel
    }
}


#Preview {
    //    FavoriteRowView(favoriteSpot: FavoriteSpot(spot: allSpots[0], weatherManager: WeatherManager()))
    //        .modelContainer(for: FavoriteSpot.self, inMemory: true)
    FavoritesView(selectedTab: .constant(1))
}
