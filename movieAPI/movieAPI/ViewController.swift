
import UIKit

class ViewController: UIViewController {
    
    var movieResults = [movieAPI.Result]()
    
    let tableView = UITableView().then {
        $0.register(MovieTableViewCell.self, forCellReuseIdentifier: "movieCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        tableView.dataSource = self
        tableView.delegate = self
        
        self.title = "영화 목록"


        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        getMovie()
    }
    
    private func getMovie() {
        movieGet.shared.moviePoster(){ response in
            switch response {
            case . success(let data):
                guard let data = data as? Welcome else { return }
                self.movieResults = data.results
                self.tableView.reloadData()
            default:
                print("무언가 실패")
                return
            }
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieResults.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
        let movieResult = movieResults[indexPath.row]
        print(movieResult)
        //backdropPath
        cell.titleLabel.text = movieResult.title
        cell.releaseLabel.text = "개봉일 " + movieResult.releaseDate
        cell.popularityLabel.text = "흥행점수 \(movieResult.popularity)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movietitle = movieResults[indexPath.row]
        let detailViewController = MovieDatailViewController()
        detailViewController.movieTitle = movietitle.title
        detailViewController.releaseLabel.text = movietitle.releaseDate
        detailViewController.overview.text = movietitle.overview

        self.navigationController?.pushViewController(detailViewController, animated: true)
        
    }
    
    

}
