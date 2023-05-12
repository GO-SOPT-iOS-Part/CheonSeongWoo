
import UIKit
import SnapKit
import Then
final class ViewController: UIViewController {
    
    let tableView = UITableView(frame: .zero, style: .plain).then {
        $0.register(WeatherTableViewCell.self, forCellReuseIdentifier: "weatherCell")
        $0.tableFooterView = UIView()
    }
    
    var cityWeatherList: [Weathers] = [] // 배열 추가
    
    let cityList = ["gongju", "gwangju", "gumi", "gunsan", "daegu", "daejeon", "mokpo", "busan", "seosan", "seoul", "sokcho", "suwon", "suncheon", "ulsan", "iksan", "jeonju", "jeju", "cheonan", "cheongju", "chuncheon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        self.title = "날씨"

        
        tableView.delegate = self
        tableView.dataSource = self
        
        for city in cityList {
            cityWeather(name: city)
        }
    }
    
    func cityWeather(name: String) {
        WeatherService.shared.cityWeather(city: name) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                guard let data = data as? Weathers else { return }
//                print(data)
                self.cityWeatherList.append(data)
                self.tableView.reloadData()
            default:
                return
            }
        }
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityWeatherList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! WeatherTableViewCell
        
        let data = cityWeatherList[indexPath.row]
        if let imageURL = data.weather.first?.icon {
            cell.weatherImage.getImageFromURL(imageURL)
        }
        cell.cityLabel.text = data.name
        cell.tempLabel.text = "현재 온도 : \(data.main.temp)°C"
        cell.humidityLabel.text = "습도 : \(data.main.humidity)%"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCity = cityWeatherList[indexPath.row].name
        let detailViewController = WeatherDetailViewController()
        detailViewController.detailCity = selectedCity
        self.navigationController?.pushViewController(detailViewController, animated: true)
        
    }
    
    


}
