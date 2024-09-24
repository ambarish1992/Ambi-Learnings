//
//  EnvironmentModel.swift
//  Ambi-Learnings
//
//  Created by Ambarish Shivakumar on 03/07/24.
//

import Foundation

struct UserInfo {
    
    var fullName: String?
    var email: String?
    var address: String?
    
    var initials: String? {
        
        let formatter = PersonNameComponentsFormatter()
        guard let components = formatter.personNameComponents(from: fullName ?? "") else {
            return nil
        }
        formatter.style = .abbreviated
        return formatter.string(from: components)
    }
}
