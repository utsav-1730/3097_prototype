import SwiftUI

@main
struct TrackEaseApp: App {
    let persistenceController = PersistenceController.shared 

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
