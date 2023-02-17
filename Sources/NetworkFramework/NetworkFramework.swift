import Foundation
import Alamofire

public struct User: Codable {
    let name: String
    let username: String
}

public class NetworkManager {
    public static func request(completion: @escaping(Result< [User], AFError> ) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        AF.request(url).responseDecodable(of: [User].self ,completionHandler: { reponse in
            completion(reponse.result)
        })
    }
}
