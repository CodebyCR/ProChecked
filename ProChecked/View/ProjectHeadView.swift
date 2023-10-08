//
//  ProjectHeadView.swift
//  ProChecked
//
//  Created by Christoph Rohde on 04.05.22.
//

import SwiftUI

struct ProjectHeadView: View {
    var project: Project

    var body: some View {
        if project.imageName != "" {
            ZStack {
                Color(project.color.isEmpty ? "rich_gray" : project.color)
                    .opacity(0.6)
                    .frame(width: 100, height: 100, alignment: .leading)
                    .cornerRadius(5)

                Image(project.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .leading)
                    .cornerRadius(5)
                // vielleicht auch zu capsul
            }
        }

        VStack(alignment: .leading) {
            Text(project.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(1)
                .padding(.vertical, 1)

            Text(project.detailInfo)
                .fontWeight(.light)
                .foregroundColor(Color("rich_ground"))
                .lineLimit(3)

            // Tap
            //            .gesture(
            //
            //                LongPressGesture(minimumDuration: 0)
            //                    .onEnded {_ in
            //
            //                    self.todo.toggleItem(itemId: self.itemId)
            //                    self.hapticSuccess()
            //                        print("long pressed")
            //
            //            })
        }
    }
}

#if DEBUG
@available(iOS 17.0, *)
#Preview {
    ProjectHeadView(project: ProjectList.projects.first!)
        .modelContainer(for: [Project.self, Task.self], inMemory: true)
        .preferredColorScheme(.dark)
}
#endif
