import SwiftUI
import CoreMotion
import Combine
import Foundation

class DartMotion: ObservableObject {
    let motion = CMMotionManager()
    var timer: Timer?
    @Published var x: Double = 0.0
    @Published var y: Double = 0.0
    @Published var z: Double = 0.0
    
    func startAccelerometers() {
        if self.motion.isAccelerometerAvailable {
            print("센서 켜짐")
            self.motion.accelerometerUpdateInterval = 1.0 / 10.0
            self.motion.startAccelerometerUpdates()
            
            self.timer = Timer(fire: Date(), interval: (1.0 / 10.0), repeats: true, block: { (timer) in
                
                if let data = self.motion.accelerometerData {
                    self.x = data.acceleration.x
                    self.y = data.acceleration.y
                    self.z = data.acceleration.z
                    
                    // 내 앱에서 사용할 데이터
                    if (self.z <= -2 || self.z >= 2) {
                        print("Z: " + self.z.description)
                    }
                    if (self.y <= -2 || self.y >= 2) {
                        print("Y: " + self.y.description)
                    }
                    if (self.x <= -2 || self.x >= 2) {
                        print("X: " + self.x.description)
                    }
                }
            })
            
            RunLoop.current.add(self.timer!, forMode: .default)
            
        }
    }
    
    func stopUpdates() {
        timer?.invalidate()
        motion.stopAccelerometerUpdates()
        print("센서 꺼짐")
    }
}

func selectRandomIndex(array: [String]) -> Int {
    
    let randomIndex = Int.random(in: 0..<array.count)
    
    return randomIndex
}

struct DartView: View {
    @State var darts: Int = 3
    @State var isDartOnPanel: Bool = false // NOTE: 이렇게 변수를 추가해본다면?
    @StateObject var dartMotion = DartMotion()
    @State var showModal: Bool = false
    @State var gameStarted: Bool = false
    
    var body: some View {
        ZStack {
            Color(.newBackground)
                .ignoresSafeArea()
            
            VStack {
                WeatherView(remainingDarts: $darts)
                    .padding(.bottom, 20)
                
                DartPanelView(remainingDarts: $darts, isOnPanel: $isDartOnPanel)
                    .onChange(of: dartMotion.y) {
                        if dartMotion.y >= 2.7 {
                            dartMotion.stopUpdates()
                            print("다트 날라감")
                            darts -= 1
                            isDartOnPanel = true
                        }
                    }
                
                RemainingDartsView(remainingDarts: $darts)
                
                ZStack {
                    Rectangle()
                        .frame(width: 350, height: 100)
                        .foregroundStyle(Color.clear)
                    
                    if (darts == 3 && gameStarted == false) {
                        Button("시작하기") {
                            gameStarted.toggle()
                            dartMotion.startAccelerometers()
                        }
                        .controlSize(.extraLarge)
                        .buttonStyle(.glass)
                    }
                    
                    if (darts == 3 && gameStarted == true) {
                        Text("기기를 세게 흔들어 목적지를 정해볼까요?")
                            .padding(.top, 11)
                            .font(.caption)
                            .foregroundStyle(.defaultText)
                    }
                    
                    if (darts <= 0 && isDartOnPanel == true) {
                        HStack {
                            Button("다시") {
                                darts = 3
                                isDartOnPanel = false
                                dartMotion.startAccelerometers()
                            }
                            .controlSize(.extraLarge)
                            .buttonStyle(.glassProminent)
                            .tint(.red)
                            
                            Button("결과 보기") {
                                showModal.toggle()
                            }
                            .controlSize(.extraLarge)
                            .buttonStyle(.glassProminent)
                            .sheet(isPresented: $showModal) {
                                ResultView().presentationDetents([.medium, .large])
                            }
                        }
                        
                    }
                    else if (darts > 0 && isDartOnPanel == true) {
                        Button("다음 구슬 뽑기") {
                            isDartOnPanel = false
                            dartMotion.startAccelerometers()
                        }.controlSize(.extraLarge)
                            .buttonStyle(.glassProminent)
                            .tint(.backgroundGradient1)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    DartView()
}

