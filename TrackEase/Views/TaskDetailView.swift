import SwiftUI
import CoreData

struct TaskDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var task: Task
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Form {
            Section(header: Text("Task Details")) {
                TextField("Task Name", text: $task.name)
                
                Picker("Task Type", selection: $task.type) {
                    Text("General").tag("General")
                    Text("Work").tag("Work")
                    Text("Personal").tag("Personal")
                }

                DatePicker("Due Date", selection: $task.dueDate, displayedComponents: .date)
                
                Toggle("Completed", isOn: $task.isCompleted)
            }

            Button("Save Task") {
                try? viewContext.save()
                presentationMode.wrappedValue.dismiss()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .navigationBarTitle("Edit Task", displayMode: .inline)
    }
}
