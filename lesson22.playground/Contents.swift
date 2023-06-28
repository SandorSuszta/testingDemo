import UIKit

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int
    var trackName: String
    var collectionName: String
}

let someUrl = URL(string: "https://itunes.apple.com/search?term=metallica&entity=song")!
let request = URLRequest(url: someUrl)

enum CustomError: Error {
    case failedParsing
    case noResults
}

// 1
URLSession.shared.dataTask(with: request) { data, response, error in
    if error != nil { print(error?.localizedDescription as Any) }

    if let data = data {
        do {
            let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
            if !decodedResponse.results.isEmpty {
                print(decodedResponse.results[0].trackName)
                print(decodedResponse.results[0].collectionName)
            }
        } catch { print("parsing error") }
    }
}.resume()

// 2
func parseResponse(data: Data) throws {
    let decodedResponse = try? JSONDecoder().decode(Response.self, from: data)
    if let decodedResponse = decodedResponse {
        if !decodedResponse.results.isEmpty {
            print(decodedResponse.results[0].trackName)
            print(decodedResponse.results[0].collectionName)
        } else {
            throw CustomError.noResults
        }
    } else {
        throw CustomError.failedParsing
    }
}

let data = try Data(contentsOf: someUrl, options: [])

do {
    try parseResponse(data: data)
} catch CustomError.failedParsing {
    print("couldn't parse request")
} catch CustomError.noResults {
    print("no such artist")
}
