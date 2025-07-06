import Foundation

struct Product: Codable,Identifiable{
    var id:Int
    var title:String
    var price:Double
    var description:String
    var category:String
    var image:String
}

func fetchData(completion:@escaping ([Product]?) -> Void){
    let strURL = "https://fakestoreapi.com/products"
    guard let url = URL(string: strURL) else{
        completion(nil)
        return
    }
    let request = URLRequest(url: url)
    URLSession.shared.dataTask(with: request){data, response, error in
        guard let data = data, error == nil else {
           completion(nil)
           return
       }
       do {
           let decodedData = try JSONDecoder().decode([Product].self, from: data)
           completion(decodedData)
       } catch {
           print("Ошибка декодирования: \(error)")
           completion(nil)
       }
    }.resume()
}
