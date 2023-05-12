import Foundation
import Alamofire

final class WeatherService {
    
    static let shared = WeatherService()
    
    private init() {}
    
    
    func cityWeather(city: String,
                     completion: @escaping (NetworkResult<Weathers>) -> Void) {
        
        let url = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=" + Config.baseKEY
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let dataRequest = AF.request(url, method: .get, headers: header)

        dataRequest.responseData { response in
            switch response.result {
            case .success(let data):
                guard let statusCode = response.response?.statusCode else {
                    completion(.failure(.requestFailed))
                    return
                }
                let networkResult = self.judgeStatus(by: statusCode, data: data)
                completion(networkResult)

            case .failure:
                completion(.failure(.requestFailed))
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, data: Data) -> NetworkResult<Weathers> {
        switch statusCode {
        case 200:
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(Weathers.self, from: data)
                return .success(decodedData)
            } catch {
                return .failure(.invalidData)
            }
            
        default:
            return .failure(.statusCode(statusCode))
        }
    }
}
