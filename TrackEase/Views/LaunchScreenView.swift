import SwiftUI

struct LaunchScreenView: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            HomeView()
        } else {
            VStack {
                Text("TrackEase")
                    .font(.largeTitle)
                    .bold()
                    .opacity(0.8)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isActive = true
                }
            }
        }
    }
}
