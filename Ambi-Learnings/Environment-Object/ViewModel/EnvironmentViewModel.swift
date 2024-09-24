//
//  EnvironmentViewModel.swift
//  Ambi-Learnings
//
//  Created by Ambarish Shivakumar on 03/07/24.
//

import Foundation

class EnvironmentViewModel: ObservableObject {
    
    @Published var user: UserInfo
    
    init() {
        
        self.user = UserInfo(fullName: "Ambarish Shivakumar",
                             email: "ambishiva@gmail.com",
                             address: "Rajaji nagar")
    }
}
