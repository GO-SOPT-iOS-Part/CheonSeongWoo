import UIKit

import SnapKit
import Then

class MovieDatailViewController: UIViewController {
    
    var movieTitle: String = ""
    
    let moviePoster = UIImageView().then{
        $0.image = UIImage(named: "test")
    }
    let releaseLabel = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    }
    let overview = UILabel().then{
                $0.numberOfLines = 0
                $0.lineBreakStrategy = .hangulWordPriority
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = movieTitle
        navigationController?.navigationBar.tintColor = .black
        setupUI()
        
    }
    
    
}

extension MovieDatailViewController {
    func setupUI(){
        overview.numberOfLines = 0
        overview.lineBreakMode = .byWordWrapping

        view.backgroundColor = .white
        [moviePoster, releaseLabel, overview].forEach{ view.addSubview($0) }
        
       
        
        moviePoster.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(5)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(view.snp.height).multipliedBy(0.5)
        }
        releaseLabel.snp.makeConstraints{
            $0.top.equalTo(moviePoster.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        overview.snp.makeConstraints {
            $0.top.equalTo(releaseLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.trailing.equalToSuperview().offset(-10)
        }
    }
}
