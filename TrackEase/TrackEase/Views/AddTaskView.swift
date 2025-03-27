import SwiftUI
import CoreData

struct AddTaskView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var taskName: String = ""
    @State private var taskType: String = "General"
    @State private var dueDate: Date = Date()
    @State private var isCompleted: Bool = false
    @Environment(\.presentationMode) var presentationMode

    let taskTypes = ["General", "Work", "Personal"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Details")) {
                    TextField("Task Name", text: $taskName)

                    Picker("Task Type", selection: $taskType) {
                        ForEach(taskTypes, id: \.self) { type in
                            Text(type)
                        }
                    }

                    DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)

                    Toggle("Completed", isOn: $isCompleted)
                }

                Button(action: addTask) {
                    Text("Save Task")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationBarTitle("Add Task", displayMode: .inline)
        }
    }

    private func addTask() {
        guard !taskName.trimmingCharacters(in: .whitespaces).isEmpty else {
            print("⚠️ Task name is empty. Not saving.")
            return
        }

        let newTask = UserTask(context: viewContext)
        newTask.name = taskName
        newTask.type = taskType
        newTask.dueDate = dueDate
        newTask.isCompleted = isCompleted

        do {
            try viewContext.save()
            print("✅ Task successfully saved: \(taskName)")
            presentationMode.wrappedValue.dismiss()
        } catch {
            print("❌ Error saving task: \(error.localizedDescription)")
        }
    }
}
