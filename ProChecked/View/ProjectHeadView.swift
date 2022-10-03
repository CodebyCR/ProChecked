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
                //vielleicht auch zu capsul
            }

        }


        VStack(alignment: .leading) {

            Text(project.titel)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(1)
                .padding(.vertical, 1)



            Text(project.description)
                .fontWeight(.light)
                .foregroundColor(Color("rich_ground"))
                .lineLimit(3)

            //            // Tap
            //            .gesture(
            //
            //                LongPressGesture(minimumDuration: 0)
            //                    .onEnded {_ in
            //
            //        //                    self.todo.toggleItem(itemId: self.itemId)
            //        //                    self.hapticSuccess()
            //                        print("long pressed")
            //
            //            })
        }
    }
}

struct ProjectHeadView_Previews: PreviewProvider {
    static var previews: some View {


        Group {
            //First
            HStack {
                ProjectHeadView(project: ProjectList.projects.first!)
                    .previewDevice("IPhone 11")
                    .preferredColorScheme(.dark)

            }
                .previewInterfaceOrientation(.landscapeRight)


            //Second
            VStack {
                ProjectHeadView(project: ProjectList.projects.first!)
                    .previewDevice("IPhone 11")
            }

        }
    }
}
