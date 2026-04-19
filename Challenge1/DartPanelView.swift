import SwiftUI
import Charts

struct DartPanelView: View {
    @Binding var remainingDarts: Int
    @Binding var isOnPanel: Bool
    @State var startAnimation: Bool = false
    @State var index1: Int = 0
    @State var index2: Int = 0
    @State var index3: Int = 0
    
    @State var data1: [String] = ["효자 / 지곡", "송도", "영일대", "환호 / 여남", "죽도 /\n동빈내항", "이동 / 대잠"]
    
    @State var data2: [String] = ["밤 산책", "심야 카페", "야식 /\n한 잔", "멍때리기"]
    
    let data3 = [
        (name: "돗자리", ratio: 25),
        (name: "파도", ratio: 25),
        (name: "스페이스워크", ratio: 25),
        (name: "터미널", ratio: 25)
    ]
    
    var body: some View {
        ZStack {
            if (!isOnPanel) {
                GeometryReader { geometry in
                    ZStack {
                        switch remainingDarts {
                        case 2:
                            ZStack {
                                Image("Ellipse")
                                    .frame(maxWidth: .infinity)
                                
                                Text("\(data2[0])")
                                    .font(.system(size: 20))
                                    .padding(50)
                                    .glassEffect(in: .circle)
                                    .shadow(color: .black.opacity(0.25), radius: 20, x: 6, y: -4)
                                    .offset(x: startAnimation ? -100 : -110, y: startAnimation ? -70 : -60)
                                    .scaleEffect(startAnimation ? 1.0 : 0.95)
                                    .animation(
                                        .easeInOut(duration: Double.random(in: 1.3...1.75))
                                        .repeatForever(autoreverses: true)
                                        .delay(Double.random(in: 0...2)),
                                        value: startAnimation
                                    )
                                
                                Text("\(data2[1])")
                                    .font(.system(size: 24))
                                    .padding(70)
                                    .glassEffect(in: .circle)
                                    .shadow(color: .black.opacity(0.25), radius: 20, x: -6, y: -4)
                                    .offset(x: startAnimation ? 80 : 70, y: startAnimation ? -90 : -80)
                                    .scaleEffect(startAnimation ? 1.0 : 0.95)
                                    .animation(
                                        .easeInOut(duration: Double.random(in: 1.3...1.75))
                                        .repeatForever(autoreverses: true)
                                        .delay(Double.random(in: 0...2)),
                                        value: startAnimation
                                    )
                                
                                Text("\(data2[2])")
                                    .font(.system(size: 24))
                                    .padding(65)
                                    .glassEffect(in: .circle)
                                    .shadow(color: .black.opacity(0.25), radius: 20, x: -6, y: 4)
                                    .offset(x: -110, y: 100)
                                    .scaleEffect(startAnimation ? 1.0 : 0.95)
                                    .animation(
                                        .easeInOut(duration: Double.random(in: 1.3...1.75))
                                        .repeatForever(autoreverses: true)
                                        .delay(Double.random(in: 0...2)),
                                        value: startAnimation
                                    )
                                
                                Text("\(data2[3])")
                                    .font(.system(size: 20))
                                    .padding(55)
                                    .glassEffect(in: .circle)
                                    .shadow(color: .black.opacity(0.25), radius: 20, x: -6, y: -4)
                                    .offset(x: startAnimation ? 70 : 80, y: startAnimation ? 90 : 80)
                                    .scaleEffect(startAnimation ? 1.0 : 0.95)
                                    .animation(
                                        .easeInOut(duration: Double.random(in: 1.3...1.75))
                                        .repeatForever(autoreverses: true)
                                        .delay(Double.random(in: 0...2)),
                                        value: startAnimation
                                    )
                            }
                            .frame(maxWidth: .infinity)
                            .onAppear {
                                startAnimation = true
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
                                Image("Ellipse")
                                    .frame(maxWidth: .infinity)
                                
                                Text("\(data1[0])")
                                    .padding(40)
                                    .glassEffect(in: .circle)
                                    .shadow(color: .black.opacity(0.25), radius: 20, x: 6, y: -4)
                                    .offset(x: startAnimation ? 30 : 40, y: startAnimation ? -120 : -130)
                                    .scaleEffect(startAnimation ? 1.0 : 0.95)
                                    .animation(
                                        .easeInOut(duration: Double.random(in: 1.3...1.75))
                                        .repeatForever(autoreverses: true)
                                        .delay(Double.random(in: 0...2)),
                                        value: startAnimation
                                    )
                                
                                Text("\(data1[1])")
                                    .padding(30)
                                    .glassEffect(in: .circle)
                                    .shadow(color: .black.opacity(0.25), radius: 20, x: -6, y: -4)
                                    .offset(x: startAnimation ? -100 : -110, y: startAnimation ? -70 : -60)
                                    .scaleEffect(startAnimation ? 1.0 : 0.95)
                                    .animation(
                                        .easeInOut(duration: Double.random(in: 1.3...1.75))
                                        .repeatForever(autoreverses: true)
                                        .delay(Double.random(in: 0...2)),
                                        value: startAnimation
                                    )
                                
                                Text("\(data1[2])")
                                    .padding(35)
                                    .glassEffect(in: .circle)
                                    .shadow(color: .black.opacity(0.25), radius: 20, x: -6, y: 4)
                                    .offset(x: -110, y: 100)
                                    .scaleEffect(startAnimation ? 1.0 : 0.95)
                                    .animation(
                                        .easeInOut(duration: Double.random(in: 1.3...1.75))
                                        .repeatForever(autoreverses: true)
                                        .delay(Double.random(in: 0...2)),
                                        value: startAnimation
                                    )
                                
                                Text("\(data1[3])")
                                    .padding(45)
                                    .glassEffect(in: .circle)
                                    .shadow(color: .black.opacity(0.25), radius: 20, x: -6, y: -4)
                                    .offset(x: startAnimation ? 100 : 90, y: -10)
                                    .scaleEffect(startAnimation ? 1.0 : 0.95)
                                    .animation(
                                        .easeInOut(duration: Double.random(in: 1.3...1.75))
                                        .repeatForever(autoreverses: true)
                                        .delay(Double.random(in: 0...2)),
                                        value: startAnimation
                                    )
                                
                                Text("\(data1[4])")
                                    .multilineTextAlignment(.center)
                                    .padding(30)
                                    .glassEffect(in: .circle)
                                    .shadow(color: .black.opacity(0.25), radius: 20, x: -6, y: -4)
                                    .offset(x: startAnimation ? 100 : 110, y: startAnimation ? 110: 120)
                                    .scaleEffect(startAnimation ? 1.0 : 0.95)
                                    .animation(
                                        .easeInOut(duration: Double.random(in: 1.3...1.75))
                                        .repeatForever(autoreverses: true)
                                        .delay(Double.random(in: 0...2)),
                                        value: startAnimation
                                    )
                                
                                Text("\(data1[5])")
                                    .padding(40)
                                    .glassEffect(in: .circle)
                                    .shadow(color: .black.opacity(0.25), radius: 20, x: -6, y: -4)
                                    .offset(x: startAnimation ? -20 : -30, y: startAnimation ? 30: 20)
                                    .scaleEffect(startAnimation ? 1.0 : 0.95)
                                    .animation(
                                        .easeInOut(duration: Double.random(in: 1.3...1.75))
                                        .repeatForever(autoreverses: true)
                                        .delay(Double.random(in: 0...2)),
                                        value: startAnimation
                                    )
                                
                            }
                            .frame(maxWidth: .infinity)
                            .onAppear {
                                startAnimation = true
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
                                Image("Ellipse")
                                    .frame(maxWidth: .infinity)
                                
                                Text("\(data2[index2])")
                                    .font(.system(size: 20))
                                    .padding(50)
                                    .glassEffect(in: .circle)
                                    .shadow(color: .black.opacity(0.25), radius: 20, x: 6, y: -4)
                                    .offset(x: startAnimation ? -10 : 10, y: startAnimation ? -10 : 10)
                                    .scaleEffect(startAnimation ? 1.0 : 0.95)
                                    .animation(
                                        .easeInOut(duration: Double.random(in: 1.3...1.75))
                                        .repeatForever(autoreverses: true)
                                        .delay(Double.random(in: 0...2)),
                                        value: startAnimation
                                    )
                            }
                            .frame(maxWidth: .infinity)
                            
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
                                Image("Ellipse")
                                    .frame(maxWidth: .infinity)
                                
                                Text("\(data1[index1])")
                                    .font(.system(size: 20))
                                    .padding(50)
                                    .glassEffect(in: .circle)
                                    .shadow(color: .black.opacity(0.25), radius: 20, x: 6, y: -4)
                                    .offset(x: startAnimation ? -10 : 10, y: startAnimation ? -10 : 10)
                                    .scaleEffect(startAnimation ? 1.0 : 0.95)
                                    .animation(
                                        .easeInOut(duration: Double.random(in: 1.3...1.75))
                                        .repeatForever(autoreverses: true)
                                        .delay(Double.random(in: 0...2)),
                                        value: startAnimation
                                    )
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                }
            }
        }
        .onChange(of: isOnPanel) {
            print("onChange 실행, isOnPanel: \(isOnPanel)")
            if isOnPanel {
                startAnimation = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    startAnimation = true
                }
                data1.shuffle()
                index1 = Int.random(in: 0..<data1.count)
                print("index1: \(index1)")
                data2.shuffle()
                index2 = Int.random(in: 0..<data2.count)
                print("index2: \(index2)")
            }
        }
    }
}

#Preview {
    DartPanelView(remainingDarts: .constant(2), isOnPanel: .constant(true))
}
