import SwiftUI
import Charts

//struct FanShape: Shape {
//    var startAngle: Angle
//    var endAngle: Angle
//    var clockwise: Bool = false
//}

struct DartPanelView: View {
    @Binding var remainingDarts: Int
    @Binding var isOnPanel: Bool
    @Binding var offsetX: CGFloat
    @Binding var offsetY: CGFloat
    @State var selectedAngleValue: Double?
    
    let data1 = [
        (name: "효자/지곡", ratio: 25),
        (name: "영일대", ratio: 25),
        (name: "송도", ratio: 25),
        (name: "환호/여남", ratio: 25),
        (name: "죽도/동빈내항", ratio: 25),
        (name: "이동/대잠", ratio: 25)
    ]
    
    let data2 = [
        (name: "밤 산책", ratio: 25),
        (name: "심야 카페", ratio: 25),
        (name: "야식/한 잔", ratio: 25),
        (name: "멍때리기", ratio: 25)
    ]
    
    let data3 = [
        (name: "돗자리", ratio: 25),
        (name: "파도", ratio: 25),
        (name: "스페이스워크", ratio: 25),
        (name: "터미널", ratio: 25)
    ]
    
    //    func distanceFromCircle(circle: Circle) -> Double {
    //
    //    }
    
    //    var randomColors: [Color] = [Color.gray, .pink, .purple]
    var body: some View {
        
        if (!isOnPanel) {
            GeometryReader { geometry in
                ZStack {
                    switch remainingDarts {
                    case 2:
                        ZStack {
                            Chart(data2, id: \.name) { name, ratio in
                                SectorMark(angle: .value("비율", ratio))
                                    .foregroundStyle(by: .value("테마", name))
                            }
                            .chartLegend(.hidden)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding()
                            
                            Image("2라운드 다트판")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding()
                        }
                        
                    case 1:
                        ZStack {
                            Chart(data3, id: \.name) { name, ratio in
                                SectorMark(angle: .value("비율", ratio))
                                    .foregroundStyle(by: .value("활동", name))
                            }
                            .chartLegend(.hidden)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding()
                            
                            Image("3라운드 영일대 다트판")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding()
                        }
                        
                    default:
                        ZStack {
                            Chart(data1, id: \.name) { name, ratio in
                                SectorMark(angle: .value("비율", ratio))
                                    .foregroundStyle(by: .value("지역", name))
                            }
                            .chartLegend(.hidden)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding()
                            .chartAngleSelection(value: $selectedAngleValue)
                            
                            Image("1라운드 다트판")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding()
                        }
                        
                    }
                }
            }
        } else {
            GeometryReader { geometry in
                ZStack {
                    switch remainingDarts + 1 {
                    case 2:
                        ZStack {
                            Chart(data2, id: \.name) { name, ratio in
                                SectorMark(angle: .value("비율", ratio))
                                    .foregroundStyle(by: .value("테마", name))
                            }
                            .chartLegend(.hidden)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding()
                            
                            Image("2라운드 다트판")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding()
                        }

                    case 1:
                        ZStack {
                            Chart(data3, id: \.name) { name, ratio in
                                SectorMark(angle: .value("비율", ratio))
                                    .foregroundStyle(by: .value("활동", name))
                            }
                            .chartLegend(.hidden)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding()
                            
                            Image("3라운드 영일대 다트판")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding()
                        }
                        
                    default:
                        ZStack {
                            Chart(data1, id: \.name) { name, ratio in
                                SectorMark(angle: .value("비율", ratio))
                                    .foregroundStyle(by: .value("지역", name))
                            }
                            .chartLegend(.hidden)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding()
                            
                            Image("1라운드 다트판")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding()
                        }
                        
                    }
                    
                    Image("꽂힌 다트")
                        .resizable()
                        .frame(width: 55, height: 76)
                        .position(x: geometry.size.width * 0.5 + offsetX, y: geometry.size.height * 0.5 + offsetY)
                }
            }
            
        }
        
    }
}

#Preview {
    DartPanelView(remainingDarts: .constant(1), isOnPanel: .constant(false), offsetX: .constant(0), offsetY: .constant(0))
}
