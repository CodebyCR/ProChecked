//
//  Project.swift
//  ProChecked
//
//  Created by Christoph Rohde on 20.01.22.
//

import SwiftUI
import SwiftData

@Model
class Project: Identifiable {
    let id = UUID()
    let imageName: String
    let titel: String
    let detailInfo: String
    let color: String
    @Relationship() var tasks = [Task]()

    init(imageName: String, titel: String, description: String, color: String) {
        self.imageName = imageName
        self.titel = titel
        self.detailInfo = description
        self.color = color
        self.tasks = []
    }

}

struct ProjectList {

    static let projects = [

        Project(imageName: "Qarla", titel: "Qarla",
            description: "A Python program for code and decoder QR Codes with some fetures.", color: ""),

        Project(imageName: "", titel: "Sudoku",
            description: "Sudodu in C++ mit einstelbaren schwirgkeitsgrad. Coming Soon", color: "drip_purple"),

        Project(imageName: "", titel: "IP Adressen Rechner",
            description: "Subnetz generator für ip v4.", color: "drip_purple"),

        Project(imageName: "ProChecked_Icon", titel: "ProChecked",
            description: """
                        KanbanList with some features. -features: optionale
                        RSA verschülung über ein Password, für manche projecte
                        """,
            color: ""),

        Project(imageName: "", titel: "Web Scraping",
            description: """
                        App / Anwendung  Diese soll für die Webseite 'Gearspace'Favorisierte
                        Einträgen von Accounts anzeigt- die Möglichkeit bieten den
                        gesamten Foren Eintrag zu sehen.- sich
                        selbst jede Stunde/ oder bei Benutzung updaten.
                        """,
            color: "drip_purple")
    ]

}
