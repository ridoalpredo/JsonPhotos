//
//  ContentView.swift
//  JsonPhotos
//
//  Created by rido alpredo on 31/12/21.
//

import SwiftUI
struct ContentView: View {
    
    @ObservedObject var ambil = ApiService()
    
    var body: some View  {
        List(ambil.photo){photo in
            VStack(alignment: .leading){
                Text(photo.title).font(.system(size: 24, weight: .bold, design: .rounded))
                Text(photo.url)
        }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
