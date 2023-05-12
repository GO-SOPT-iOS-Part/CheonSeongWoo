import UIKit

struct SignUpResponse: Codable {
    let code: Int
    let success: Bool?
    let message: String
    let data: SignUpData?
}

struct SignUpData: Codable {
    let userId: Int
    let nickname: String
}
