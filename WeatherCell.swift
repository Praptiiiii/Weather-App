//
//  WeatherCell.swift
//  OpenWeather
//
//  Created by Prapti on 08/04/24.
//

//import UIKit
//
//class WeatherCell: UITableViewCell {
//    let weatherDescriptionLabel = UILabel()
//    let temperatureLabel = UILabel()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupSubviews()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setupSubviews() {
//        // Configure UI elements for WeatherCell
//       
//        contentView.addSubview(weatherDescriptionLabel)
//        contentView.addSubview(temperatureLabel)
//
//        weatherDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
//        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([
//            weatherDescriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
//            weatherDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            weatherDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            
//            temperatureLabel.topAnchor.constraint(equalTo: weatherDescriptionLabel.bottomAnchor, constant: 8),
//            temperatureLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            temperatureLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            temperatureLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
//        ])
//    }
//    
//    func configure(with weather: List) {
//        // Configure the cell with data from the weather object
//        if let weatherDescription = weather.weather.first?.description.rawValue {
//            weatherDescriptionLabel.text = "Description: \(weatherDescription.capitalized)"
//        } else {
//            weatherDescriptionLabel.text = "Description: N/A"
//        }
//        temperatureLabel.text = "Temperature: \(weather.main.temp)°C"
//    }
//
//
//}


import UIKit

class WeatherCell: UITableViewCell {
    let cityNameLabel = UILabel()
    let weatherDescriptionLabel = UILabel()
    let temperatureLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubviews() {
        // Configure UI elements for WeatherCell
        contentView.addSubview(cityNameLabel)
        contentView.addSubview(weatherDescriptionLabel)
        contentView.addSubview(temperatureLabel)

        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        weatherDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cityNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cityNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cityNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            weatherDescriptionLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 8),
            weatherDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            weatherDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            temperatureLabel.topAnchor.constraint(equalTo: weatherDescriptionLabel.bottomAnchor, constant: 8),
            temperatureLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            temperatureLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            temperatureLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func configure(cityName: String, weatherDescription: String, temperature: Double) {
        // Configure the cell with provided data
        cityNameLabel.text = "City: \(cityName)"
        weatherDescriptionLabel.text = "Description: \(weatherDescription)"
        temperatureLabel.text = "Temperature: \(temperature)°C"
    }
}
