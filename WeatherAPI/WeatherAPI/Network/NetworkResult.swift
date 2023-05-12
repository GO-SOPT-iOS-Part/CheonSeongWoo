
import Foundation


enum NetworkResult<T> {
    case success(T)
    case failure(NetworkError)
}

enum NetworkError {
    case requestFailed
    case invalidData
    case statusCode(Int)
}
