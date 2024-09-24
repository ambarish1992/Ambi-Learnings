//
//  CombineView.swift
//  Ambi-Learnings
//
//  Created by Ambarish Shivakumar on 04/07/24.
//

import SwiftUI

struct CombineView: View {
    @StateObject var ViewModel = CombineViewModel()
    var body: some View {
        NavigationView {
            List {
                
                ForEach(self.ViewModel.filterRes) { item in
                    
                    let url = URL(string: item.url ?? "")
                    AsyncImage(url: url) { image in
                        
                        HStack {
                            
                            image
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                            Text(item.title ?? "")
                                .font(.headline)
                        }
                        
                    } placeholder: {
                        
                        ProgressView()
                    }
                }
            }
            .navigationTitle(Text("Combine Images"))
            .searchable(text: $ViewModel.searchedRes)
            .onAppear {
                
                self.ViewModel.getImage()
            }
        }
    }
}

#Preview {
    CombineView()
}
