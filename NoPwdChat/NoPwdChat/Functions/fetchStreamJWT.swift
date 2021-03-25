import Foundation

func fetchStreamJWT(_ auth0Token: String, completion: @escaping (String?) -> Void) {
    let url = URL(string: "https://89eedc9689f7.ngrok.io/?auth0Token=\(auth0Token)")!
    URLSession.shared.dataTask(with: url) { data, response, error in
        if let data = data {
            completion(String(data: data, encoding: .utf8))
        } else {
            completion(nil)
        }
    }.resume()
}
