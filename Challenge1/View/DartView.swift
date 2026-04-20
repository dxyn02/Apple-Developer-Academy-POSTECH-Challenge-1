import SwiftUI
import CoreMotion
import Combine
import Foundation

@Observable
class DartMotion: ObservableObject {
    let motion = CMMotionManager()
    var timer: Timer?
    var x: Double = 0.0
    var y: Double = 0.0
    var z: Double = 0.0
    
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

struct DartView: View {
    @State var dartMotion = DartMotion()
    @State var dartViewModel = DartViewModel()
    
    var body: some View {
        ZStack {
            Color(.newBackground)
                .ignoresSafeArea()
            
            VStack {
                WeatherView(remainingDarts: $dartViewModel.remainingTimes)
                    .padding(.bottom, 20)
                
                PanelView(items: dartViewModel.currentPanelItems)
                    .onChange(of: dartMotion.y) {
                        if dartMotion.y >= 2.7 {
                            dartMotion.stopUpdates()
                            dartViewModel.process()
                            print("다트 날라감")
                        }
                    }
                
                RemainingDartsView(remainingDarts: $dartViewModel.remainingTimes)
                
                ZStack {
                    Rectangle()
                        .frame(width: 350, height: 100)
                        .foregroundStyle(Color.clear)
                    
                    if (dartViewModel.remainingTimes == 3 && dartViewModel.isStarted == false) {
                        Button("시작하기") {
                            dartViewModel.isStarted.toggle()
                            dartMotion.startAccelerometers()
                        }
                        .controlSize(.extraLarge)
                        .buttonStyle(.glass)
                    }
                    
                    if (dartViewModel.remainingTimes == 3 && dartViewModel.isStarted == true) {
                        Text("기기를 세게 흔들어 목적지를 정해볼까요?")
                            .padding(.top, 11)
                            .font(.caption)
                            .foregroundStyle(.defaultText)
                    }
                    
                    if (dartViewModel.remainingTimes <= 0 && dartViewModel.isShaked == true) {
                        HStack {
                            Button("다시") {
                                dartMotion.startAccelerometers()
                            }
                            .controlSize(.extraLarge)
                            .buttonStyle(.glassProminent)
                            .tint(.red)
                            
                            Button("결과 보기") {
                                dartViewModel.showModal.toggle()
                            }
                            .controlSize(.extraLarge)
                            .buttonStyle(.glassProminent)
                            .sheet(isPresented: $dartViewModel.showModal) {
                                ResultView().presentationDetents([.medium, .large])
                            }
                        }
                        
                    }
                    else if (dartViewModel.remainingTimes > 0 && dartViewModel.isShaked == true) {
                        Button("다음 구슬 뽑기") {
                            dartViewModel.isShaked = false
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
