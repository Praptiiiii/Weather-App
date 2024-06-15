//import UIKit
//
//class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    
//    var tableView: UITableView!
//    var weatherData: Welcome?
//    let apiHeadingLabel = UILabel() // Add a label for displaying the API heading
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Add API Heading Label
//        apiHeadingLabel.frame = CGRect(x: 30, y: 20, width: view.frame.width - 40, height: 100)
//        apiHeadingLabel.textAlignment = .center
//        apiHeadingLabel.font = UIFont.boldSystemFont(ofSize: 40)
//        apiHeadingLabel.text = "Weather API Data"
//        view.addSubview(apiHeadingLabel)
//        
//        // Create UITableView instance
//        tableView = UITableView(frame: CGRect(x: 0, y: apiHeadingLabel.frame.maxY + 20, width: view.bounds.width, height: view.bounds.height - apiHeadingLabel.frame.maxY - 20), style: .plain)
//        
//        // Set delegate and data source
//        tableView.delegate = self
//        tableView.dataSource = self
//        
//        // Register custom UITableViewCell class
//        tableView.register(WeatherCell.self, forCellReuseIdentifier: "WeatherCell")
//        
//        // Add UITableView as subview
//        view.addSubview(tableView)
//        
//        // Fetch weather data
//        fetchData()
//    }
//    
//    // MARK: - Table View Data Source
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return weatherData?.list.count ?? 0
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
//        if let weatherData = weatherData {
//            let weather = weatherData.list[indexPath.row]
//            cell.configure(with: weather)
//        }
//        return cell
//    }
//    
//    // MARK: - Fetch Weather Data
//    
//    func fetchData() {
//        NetworkManager.shared.fetchWeatherData(lat: 40.7128, lon: -74.0060) { [weak self] result in
//            switch result {
//            case .success(let data):
//                self?.weatherData = data
//                DispatchQueue.main.async {
//                    self?.tableView.reloadData()
//                }
//            case .failure(let error):
//                print("Error fetching data: \(error)")
//            }
//        }
//    }
//}
//
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var tableView: UITableView!
    var weatherData: Welcome?
    let apiHeadingLabel = UILabel() // Add a label for displaying the API heading
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add API Heading Label
        apiHeadingLabel.frame = CGRect(x: 30, y: 20, width: view.frame.width - 40, height: 100)
        apiHeadingLabel.textAlignment = .center
        apiHeadingLabel.font = UIFont.boldSystemFont(ofSize: 40)
        apiHeadingLabel.text = "Weather API Data"
        view.addSubview(apiHeadingLabel)
        
        // Create UITableView instance
        tableView = UITableView(frame: CGRect(x: 0, y: apiHeadingLabel.frame.maxY + 20, width: view.bounds.width, height: view.bounds.height - apiHeadingLabel.frame.maxY - 20), style: .plain)
        
        // Set delegate and data source
        tableView.delegate = self
        tableView.dataSource = self
        
        // Register custom UITableViewCell class
        tableView.register(WeatherCell.self, forCellReuseIdentifier: "WeatherCell")
        
        // Add UITableView as subview
        view.addSubview(tableView)
        
        // Fetch weather data
        fetchData()
    }
    
    // MARK: - Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherData?.list.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
        if let weatherData = weatherData {
            let weather = weatherData.list[indexPath.row]
            cell.configure(cityName: weatherData.city.name, weatherDescription: weather.weather.first?.description.rawValue ?? "N/A", temperature: weather.main.temp)
        }
        return cell
    }
    
    // MARK: - Fetch Weather Data
    /*
     
     https://api.openweathermap.org/data/2.5/forecast?lat=26.460914&lon=80.3217588&appid=4a61912511dfd915d73ed8428a179573
     */
     
    func fetchData() {
        NetworkManager.shared.fetchWeatherData(lat: 26.460914, lon: 80.3217588) { [weak self] result in
            switch result {
            case .success(let data):
                self?.weatherData = data
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print("Error fetching data: \(error)")
            }
        }
    }
}
