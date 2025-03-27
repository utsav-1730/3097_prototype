import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("TrackEase")
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 20)

                Spacer()

                
                NavigationLink(destination: TasksView()) {
                    HStack {
                        Image(systemName: "list.bullet")
                        Text("View Tasks")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .frame(width: 250)

               
                NavigationLink(destination: ManageTaskTypesView()) {
                    HStack {
                        Image(systemName: "gearshape")
                        Text("Manage Task Types")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .frame(width: 250)

                NavigationLink(destination: AboutView()) {
                    HStack {
                        Image(systemName: "info.circle")
                        Text("About")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .frame(width: 250)

                Spacer()
            }
            .frame(maxHeight: .infinity, alignment: .center) 
            .padding()
        }
    }
}
