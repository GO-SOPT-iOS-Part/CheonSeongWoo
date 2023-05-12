import UIKit
import SnapKit
import Then

class WeatherDetailViewController: UIViewController {
    var detailCity: String = ""
    
    let weather = UIImageView()

    
    let temperatureLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 24)
        $0.textColor = .black
    }
    
    let weatherDescriptionLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.textColor = .black
    }
    
    let maxTemperatureLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.textColor = .black
    }
    
    let minTemperatureLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.textColor = .black
    }
    
    let feelsLikeTemperatureLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.textColor = .black
        $0.numberOfLines = 2
    }
    
    let humidityLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.textColor = .black
        $0.numberOfLines = 2
    }
    
    let pressureLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.textColor = .black
        $0.numberOfLines = 2
    }
    
    let windSpeedLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 18)
        $0.textColor = .black
        $0.numberOfLines = 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = detailCity
        
        // "Back" 버튼 색상 변경
        navigationController?.navigationBar.tintColor = .black
        setupUI()
        cityWeather(name: detailCity)
        
    }
    
    func setupUI() {
        view.addSubview(weather)
        view.addSubview(temperatureLabel)
        view.addSubview(weatherDescriptionLabel)
        view.addSubview(maxTemperatureLabel)
        view.addSubview(minTemperatureLabel)
        view.addSubview(feelsLikeTemperatureLabel)
        view.addSubview(humidityLabel)
        view.addSubview(pressureLabel)
        view.addSubview(windSpeedLabel)
        
        
        weather.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(5)
            $0.centerX.equalToSuperview()
            
        }
        
        temperatureLabel.snp.makeConstraints {
            $0.top.equalTo(weather.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }
        
        weatherDescriptionLabel.snp.makeConstraints {
            $0.top.equalTo(temperatureLabel.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }
        
        maxTemperatureLabel.snp.makeConstraints {
            $0.top.equalTo(weatherDescriptionLabel.snp.bottom).offset(5)
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(view.snp.centerX).offset(-5) // superview의 X축 중앙에서 왼쪽으로 5만큼 이동
        }
        
        
        
        minTemperatureLabel.snp.makeConstraints {
            $0.top.equalTo(weatherDescriptionLabel.snp.bottom).offset(5)
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(view.snp.centerX).offset(5) // superview의 X축 중앙에서 오른쪽으로 5만큼 이동
            
        }
        
        // 구분선 추가
        let separator1 = UIView().then {
            $0.backgroundColor = .lightGray
        }
        view.addSubview(separator1)
        separator1.snp.makeConstraints {
            $0.top.equalTo(minTemperatureLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(1)
        }
        
        feelsLikeTemperatureLabel.snp.makeConstraints {
            $0.top.equalTo(separator1.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        humidityLabel.snp.makeConstraints {
            $0.top.equalTo(feelsLikeTemperatureLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        pressureLabel.snp.makeConstraints {
            $0.top.equalTo(humidityLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        windSpeedLabel.snp.makeConstraints {
            $0.top.equalTo(pressureLabel.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
    }
    func cityWeather(name: String) {
        WeatherService.shared.cityWeather(city: name) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                guard let data = data as? Weathers else { return }
                if let imageURL = data.weather.first?.icon {
                    self.weather.getImageFromURL(imageURL)
                    self.weather.contentMode = .scaleAspectFill

                }
                self.temperatureLabel.text = "\(data.main.temp)°C"
                self.weatherDescriptionLabel.text = data.weather.first?.description.capitalized
                self.maxTemperatureLabel.text = "최대: \(data.main.temp_max)°C"
                self.minTemperatureLabel.text = "최소: \(data.main.temp_min)°C"
                self.feelsLikeTemperatureLabel.text = "체감 온도 \n \(data.main.feels_like)"
                self.humidityLabel.text = "습도 \n \(data.main.humidity)%"
                self.pressureLabel.text = "압력 \n \(data.main.pressure)hpa"
                self.windSpeedLabel.text = "바람 \n \(data.wind.speed) m/s"
                
            default:
                return
            }
        }
    }
    
}
