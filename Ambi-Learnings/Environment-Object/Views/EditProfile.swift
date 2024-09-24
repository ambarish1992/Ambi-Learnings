//
//  EditProfile.swift
//  Ambi-Learnings
//
//  Created by Ambarish Shivakumar on 03/07/24.
//

import SwiftUI

struct EditProfile: View {
    @EnvironmentObject var ViewModel: EnvironmentViewModel
    
    private var user: UserInfo {
        
        return ViewModel.user
        
    }
    
    var body: some View {
        List {
            Section("Edit Options") {
                Text("\(user.fullName ?? "")")
                NavigationLink {
                    EditEmail()
                } label: {
                    Text("\(user.email ?? "")").foregroundColor(.purple)
                        
                }
                NavigationLink {
                    EditAddress()
                } label: {
                    Text("\(user.address ?? "")").foregroundColor(.orange)
                }
            }
        }
    }
}

struct EditEmail: View {
    @State private var email = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var ViewModel: EnvironmentViewModel
    
    var body: some View {
        VStack {
            TextField("Edit your email", text: $email)
                 .font(.subheadline)
                 .cornerRadius(10)
                 .autocorrectionDisabled()
                 .textInputAutocapitalization(.never)
                 .padding(.horizontal, 4)
             Divider()
             Spacer()
         }
         .navigationTitle("Edit email")
         .navigationBarTitleDisplayMode(.inline)
         .padding()
         .toolbar {
             ToolbarItem(placement: .topBarTrailing) {
                 Button("Done") {
                     
                     self.ViewModel.user.email = email
                     print(email)
                     
                     dismiss()
                 }
                 .fontWeight(.semibold)
             }
         }
    }
}

struct EditAddress: View {
    @State private var address = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var ViewModel: EnvironmentViewModel
    
    var body: some View {
        VStack {
            
            TextField("Edit your address", text: $address)
                 .font(.subheadline)
                 .cornerRadius(10)
                 .padding(.horizontal, 4)
             Divider()
             Spacer()
             
         }
         .navigationTitle("Edit address")
         .navigationBarTitleDisplayMode(.inline)
         .padding()
         .toolbar {
             ToolbarItem(placement: .topBarTrailing) {
                 Button("Done") {
                     
                     self.ViewModel.user.address = address
                     print(address)
                     
                     dismiss()
                 }
                 .fontWeight(.semibold)
             }
         }
    }
}
#Preview {
    EditProfile()
}
