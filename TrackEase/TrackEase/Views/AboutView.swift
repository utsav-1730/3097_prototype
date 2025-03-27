import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack(spacing: 15) {
            Text("About TrackEase")
                .font(.largeTitle)
                .bold()
                .padding()

            Text("TrackEase helps you manage tasks efficiently.")
                .multilineTextAlignment(.center)
                .padding()

            Divider()

            Text("Developed By:")
                .font(.headline)
                .padding(.top)

            VStack(alignment: .leading, spacing: 10) {
                Text("📌 Utsav - 101476134")
                Text("📌 Pruthvi - 101411644")
                Text("📌 Eeshan - 101414811")
            }
            .font(.body)
            .padding()

            Spacer()
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
    }
}
