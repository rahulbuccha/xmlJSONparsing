//
//  ContentView.swift
//  ApiCallJsonParse
//
//  Created by Admin on 05/05/22.
//

import SwiftUI

struct Course : Hashable, Codable{
    let name : String
    let image : String
}

class viewModel : ObservableObject{
    func fetch(){
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _,
            error in
            guard let data == data, error == nil else {
                return
            }
            // convert to JSon
            do{
                let courses = try JSONDecoder().decode([Course].self, from: data)
            }
            catch{
                print(error)
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                
            }
            .navigationTitle("Courses")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
