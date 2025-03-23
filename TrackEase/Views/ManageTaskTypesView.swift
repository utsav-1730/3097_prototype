import SwiftUI

struct ManageTaskTypesView: View {
    @State private var taskTypes: [String] = ["Work", "Personal", "Health"]
    @State private var newTaskType: String = ""

    var body: some View {
        VStack {
            List {
                ForEach(taskTypes, id: \.self) { type in
                    Text(type)
                }
            }

            TextField("Enter new task type", text: $newTaskType)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Add Type") {
                if !newTaskType.isEmpty {
                    taskTypes.append(newTaskType)
                    newTaskType = ""
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}
