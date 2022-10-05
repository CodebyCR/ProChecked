//
//  DetailTaskView.swift
//  ProChecked
//
//  Created by Christoph Rohde on 20.01.22.
//

import SwiftUI

struct DetailTaskView: View {

    @ObservedObject var project: Project
    var inLandscape = UIDevice.current.orientation.isLandscape

    var body: some View {
        //        NavigationView{
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("rich_gray"), Color("cold_spring_gray")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack {
                    if inLandscape {
                        HStack(spacing: 10) {
                            HStack {
                                ProjectHeadView(project: project)
                            }.padding()
                        }
                    } else {
                        HStack {
                            HStack {
                                ProjectHeadView(project: project)
                            }.padding(10)
                        }
                    }

                    HStack {
                        Spacer()
                        AddTaskButton(project: project)
                    }
                }

                //                Spacer()

                if project.tasks.isEmpty {
                    Spacer()
                }

                ScrollView {
                    ForEach(project.tasks) { task in

                        TaskItemView(task: task)

                    }.onDelete(perform: { indexSet in

                        if let index = indexSet.first {
                            project.tasks.remove(at: index)
                        }

                    })
                }

                //                }.edgesIgnoringSafeArea(.all)
            }
        }
        //        }.navigationBarBackButtonHidden(false)
    }
}

struct AddTaskButton: View {
    var project: Project
    var body: some View {
        Button(action: {
          let newTask = Task(
              taskTitel: "New super mega Titel ",
              taskText: """
                      new task text mit ganz langer beschreibung,
                      von einen feature um die GUI zu prüfen.
                      """)
          project.tasks.append(newTask)

          print("task count: ", project.tasks.count)

      }, label: {
          Image(systemName: "plus.circle")
              .resizable()
              .scaledToFit()
              .frame(width: 22, height: 22, alignment: .trailing)
              .foregroundColor(.black)
              .padding([.bottom, .trailing], 20)

      })
    }
}

struct TaskItemView: View {

    @State var task: Task

    var body: some View {

        // TaskItemView
        ZStack {
            Color(.white)
                .opacity(0.5)
                .cornerRadius(10)
                .padding(.horizontal, 10)

            HStack {

                VStack(alignment: .leading, spacing: 10) {

                    TextField("Titel", text: $task.taskTitel)
                        .multilineTextAlignment(.leading)

                    // For taskText
                    ZStack {

                        TextEditor(text: $task.taskText)

                        Text(task.taskText)
                            .opacity(0)
                            .padding(.all, 8)
                    }

                }.padding(.horizontal, 12.0)
                .padding(.vertical, 10.0)

            }
        }
    }
}

struct DetailsAndTaskView_Previews: PreviewProvider {
    static var previews: some View {
        Group {

            DetailTaskView(project: ProjectList.projects.first!)
                .preferredColorScheme(.dark)
                .previewDevice("IPhone 11")
                .previewInterfaceOrientation(.landscapeRight)

            DetailTaskView(project: ProjectList.projects.first!)
                .previewDevice("IPhone 11")
        }
    }
}
