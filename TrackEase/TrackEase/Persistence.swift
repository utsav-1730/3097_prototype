import CoreData
//database
struct PersistenceController {
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    init() {
        container = NSPersistentContainer(name: "TrackEase") 

        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }

    var context: NSManagedObjectContext {
        return container.viewContext
    }

    func saveContext() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    
    static var preview: PersistenceController = {
        let controller = PersistenceController()
        let viewContext = controller.container.viewContext
        
        let sampleTask = UserTask(context: viewContext)
        sampleTask.name = "Sample Task"
        sampleTask.type = "Work"
        sampleTask.dueDate = Date()
        sampleTask.isCompleted = false

        do {
            try viewContext.save()
        } catch {
            print("❌ Error saving preview data: \(error)")
        }
        
        return controller
    }()
} 
