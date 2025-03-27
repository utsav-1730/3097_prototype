import SwiftUI
import CoreData

struct TaskDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var task: UserTask
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Form {
            Section(header: Text("Task Details")) {
                TextField("Task Name", text: Binding(
                    get: { task.name ?? "" },
                    set: { task.name = $0 }
                ))

                Picker("Task Type", selection: Binding(
                    get: { task.type ?? "General" },
                    set: { task.type = $0 }
                )) {
                    Text("General").tag("General")
                    Text("Work").tag("Work")
                    Text("Personal").tag("Personal")
                }

                DatePicker("Due Date", selection: Binding(
                    get: { task.dueDate ?? Date() },
                    set: { task.dueDate = $0 }
                ), displayedComponents: .date)

                Toggle("Completed", isOn: Binding(
                    get: { task.isCompleted },
                    set: { task.isCompleted = $0 }
                ))
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
