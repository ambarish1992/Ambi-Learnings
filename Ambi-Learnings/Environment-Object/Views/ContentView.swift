//
//  ContentView.swift
//  Ambi-Learnings
//
//  Created by Ambarish Shivakumar on 03/07/24.
//

import SwiftUI

struct ContentView: View {
   
    @EnvironmentObject var ViewModel: EnvironmentViewModel
    
    private var user: UserInfo {
        
        return ViewModel.user
        
    }
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink {
                    EditProfile()                    
                } label: {
                    HStack {
                        Text(user.initials ?? "")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(width: 48, height: 48)
                            .background(Color(.systemOrange))
                            .clipShape(.circle)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            
                            Text(user.fullName ?? "")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text(user.email ?? "")
                                .font(.subheadline)
                                .foregroundStyle(.green)
                                .padding(.leading, 2)
                                .tint(.green)
                            Text(user.address ?? "")
                                .autocorrectionDisabled()
                                .font(.footnote)
                                .foregroundStyle(.gray)
                            
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
