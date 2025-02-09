//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Turner White on 2/15/22.
//

//import SwiftUI
//
//struct Response: Codable {
//    var results: [Result]
//}
//struct Result: Codable {
//    var trackId: Int
//    var trackName: String
//    var collectionName: String
//}
//
//class User: ObservableObject, Codable {
//    enum CodingKeys: CodingKey {
//        case name
//    }
//    @Published var name = "Turner"
//
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        name = try container.decode(String.self, forKey: .name )
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        try container.encode(name, forKey: .name)
//    }
//}
    
//struct ContentView: View {
//    @State private var results = [Result]()
//    var body: some View {
//        VStack {
//            AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")) { image in
//                image.resizable().scaledToFit()
//            } placeholder: {
//                ProgressView()
//            }
//            .frame(width: 200, height: 200)
//            List(results,id: \.trackId) { item in
//                VStack(alignment: .leading) {
//                    Text(item.trackName)
//                        .font(.headline)
//                    Text(item.collectionName)
//                }
//            }
//            .task{
//                await loadData()
//
//        }
//        }
//    }
//    func loadData() async {
//        guard let url = URL(string:
//                "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
//            print("Invalid URL")
//            return
//        }
//
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//
//            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
//                results = decodedResponse.results
//            }
//        } catch {
//            print("Invalid data")
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
