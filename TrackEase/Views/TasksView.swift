import SwiftUI
import CoreData

struct TasksView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        entity: Task.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.dueDate, ascending: true)]
    ) private var tasks: FetchedResults<Task>

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(tasks) { task in
                        NavigationLink(destination: TaskDetailView(task: task)) {
                            HStack {
                                Text(task.name)
                                Spacer()
                                Text("\(task.dueDate, formatter: dateFormatter)")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .onDelete(perform: deleteTask)
                }

                Spacer()

                HStack {
                    Spacer()
                    NavigationLink(destination: AddTaskView()) {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .padding()
                            .background(Color.blue)
                            .clipShape(Circle())
                            .foregroundColor(.white)
                    }
                    .padding()
                }
            }
        }
    }

    private func deleteTask(at offsets: IndexSet) {
        offsets.forEach { index in
            let task = tasks[index]
            viewContext.delete(task)
        }
        saveContext()
    }

    private func saveContext() {
        do {
            try viewContext.save()
        } catch {
            print("Error saving context: \(error)")
        }
    }
}

// Date Formatter
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()
