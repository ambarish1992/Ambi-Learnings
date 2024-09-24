//
//  CombineViewModel.swift
//  Ambi-Learnings
//
//  Created by Ambarish Shivakumar on 04/07/24.
//

import Foundation
import Combine

class CombineViewModel: ObservableObject {
    
    @Published var data: [CombineModel] = []
    @Published var searchedRes: String = ""
    var anyCancellable = Set<AnyCancellable>()
    
    func getImage() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return }
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data in
                
                guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode <= 300 else { throw URLError(.badServerResponse) }
                
                return data
            }
            .decode(type: [CombineModel].self, decoder: JSONDecoder())
            .sink { completion in
                
                print(completion)
                
            } receiveValue: { [weak self] returnData in
                
                self?.data = returnData
                
            }
            .store(in: &anyCancellable)
    }
    var filterRes: [CombineModel] {
        
        if searchedRes.isEmpty {
            
            return data
        }else {
            
            return data.filter { $0.title?.contains(searchedRes) ?? false}
        }
    }
}
