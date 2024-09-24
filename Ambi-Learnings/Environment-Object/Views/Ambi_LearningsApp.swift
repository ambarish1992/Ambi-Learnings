//
//  Ambi_LearningsApp.swift
//  Ambi-Learnings
//
//  Created by Ambarish Shivakumar on 03/07/24.
//

import SwiftUI

@main
struct Ambi_LearningsApp: App {
    //@StateObject var VM = CombineModel()
    var body: some Scene {
        WindowGroup {
            CombineView()
                //.environmentObject(VM)
        }
    }
}

//struct Ambi_LearningsApp: App {
//    @StateObject var VM = EnvironmentViewModel()
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//                .environmentObject(VM)
//        }
//    }
//}
