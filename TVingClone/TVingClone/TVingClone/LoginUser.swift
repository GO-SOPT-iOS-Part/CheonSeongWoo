import Foundation


final class LoginUser{
    
    func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    
    func checkId(email: String) -> Bool {
        return isValidEmail(email: email)
    }
    
    func checkPassword(password: String) -> Bool{
        return !password.isEmpty
    }
}
