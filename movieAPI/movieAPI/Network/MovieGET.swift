import Foundation
import UIKit

import Alamofire


final class movieGet{
    static let shared = movieGet()
    
    private init() {}
    
    func moviePoster(completion: @escaping (NetworkResult<Any>) -> Void){
        let url = "https://api.themoviedb.org/3/discover/movie?api_key=" + Config.baseKET + "&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate"
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
    
        let dataRequest = AF.request(url,
                                    method: .get,
                                    encoding: JSONEncoding.default,
                                    headers: header)
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            
            case .failure:
                completion(.networkErr)
            }
            
        }
        
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any>{
        switch statusCode {
        case 200, 201: return isValidData(data: data)
        case 400, 409: return isValidData(data: data)
        case 500: return .serverErr
        default: return .networkErr
        }
    }
    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(Welcome.self, from: data) else { return.pathErr }
        return .success(decodedData as Any)
    }
    
}

