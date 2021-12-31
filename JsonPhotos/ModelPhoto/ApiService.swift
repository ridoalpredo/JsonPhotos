//
//  ApiService.swift
//  JsonPhotos
//
//  Created by rido alpredo on 31/12/21.
//

import Foundation
import SwiftUI

class ApiService: ObservableObject {
    @Published var photo = [Post]()
        
    init() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                if let PostPhoto = data {
                    let decodedData = try JSONDecoder().decode([Post].self, from: PostPhoto)
                    DispatchQueue.main.async {
                        self.photo = decodedData
                    }
                }else{
                    print("No Data")
                }
            }catch{
                print("Error")
            }
        }.resume()
    }
}
