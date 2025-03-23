import Foundation
import CoreData

@objc(Task)
public class Task: NSManagedObject, Identifiable {
    @NSManaged public var name: String
    @NSManaged public var type: String
    @NSManaged public var dueDate: Date
    @NSManaged public var isCompleted: Bool
}
