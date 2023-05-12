import Foundation

enum Config {
    
    enum Keys {
        enum Plist {
            static let baseKEY = "BASE_KEY"
        }
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist cannot found.")
        }
        return dict
    }()
}

extension Config {
    
    static let baseKET: String = {
        guard let key = Config.infoDictionary[Keys.Plist.baseKEY] as? String else {
            fatalError("Base KEY is not set in plist for this configuration.")
        }
        return key
    }()
}
