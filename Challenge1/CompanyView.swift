import SwiftUI

struct CompanyView: View {
    let items = ["영일대 같이 가실 분~", "영일교 파도 명상팟", "바다 보면서 한 잔", "택시 타실 한 분", "밤바다 산책", "카페 야작팟 구함", "치킨 뜯으실 분", "수제맥주 펍 가요!"]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color("Background Gradient 1"), Color("Background Gradient 2")], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            Image("q")
                .resizable()
                .frame(width: 1415, height: 809)
                .position(x: 210, y: 300)
            
            HStack {
                List {
                    ForEach(items, id: \.self) { item in
                        Text(item)
                    }
                }
            }
        }
    }
}
    

#Preview {
    CompanyView()
}
