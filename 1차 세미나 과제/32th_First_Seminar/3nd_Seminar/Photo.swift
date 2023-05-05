import UIKit

struct Photo {
    let image: UIImage
    var heartTapped: Bool
}
extension Photo {
    static func dummy() -> [Photo]{
        var photos: [Photo] = []
        for photo in 1...12 {
            photos.append(Photo(image: UIImage(named: "3nd_Seminar/photo_\(photo)")!,
                                           heartTapped: false))
        }
        return photos + photos
    }
}
