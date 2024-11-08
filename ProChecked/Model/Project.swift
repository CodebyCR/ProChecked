//
//  Project.swift
//  ProChecked
//
//  Created by Christoph Rohde on 20.01.22.
//

import SwiftData
import SwiftUI

@Model
class Project {
    private(set) var id = UUID()
    private(set) var imageName: String
    private(set) var title: String
    private(set) var detailInfo: String
    private(set) var color: String
    @Relationship
    var tasks: [Task]

//    @available(*, deprecated, message: "Use Color directly")
    init(imageName: String, title: String, description: String, color: String) {
        self.imageName = imageName
        self.title = title
        self.detailInfo = description
        self.color = color
        self.tasks = []
    }

//    init(title: String, description: String, image: String?, color: Color = getRandomColor()) {
//        self.imageName = imageName
//        self.title = title
//        self.detailInfo = description
//        self.color = color
//        self.tasks = []
//    }
}

func getRandomColor() -> Color {
    let colors: [Color] = [.purple, .indigo, .blue, .cyan]
    let totalColor = colors.shuffled().randomElement() ?? Color.purple
    print(totalColor)
    return totalColor
}

enum ProjectList {
    static let projects = [
        Project(imageName: "Qrala",
                title: "Qrala",
                description: "A Python program for code and decoder QR Codes with some fetures.",
                color: "drip_purple")
//        ,

//        Project(imageName: "", titel: "Sudoku",
//            description: "Sudodu in C++ mit einstelbaren schwirgkeitsgrad. Coming Soon", color: "drip_purple"),
//
//        Project(imageName: "", titel: "IP Adressen Rechner",
//            description: "Subnetz generator für ip v4.", color: "drip_purple"),
//
//        Project(imageName: "ProChecked_Icon", titel: "ProChecked",
//            description: """
//                        KanbanList with some features. -features: optionale
//                        RSA verschülung über ein Password, für manche projecte
//                        """,
//            color: ""),
//
//        Project(imageName: "", titel: "Web Scraping",
//            description: """
//                        App / Anwendung  Diese soll für die Webseite 'Gearspace'Favorisierte
//                        Einträgen von Accounts anzeigt- die Möglichkeit bieten den
//                        gesamten Foren Eintrag zu sehen.- sich
//                        selbst jede Stunde/ oder bei Benutzung updaten.
//                        """,
//            color: "drip_purple")
    ]
}
