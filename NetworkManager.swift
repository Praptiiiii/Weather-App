//
//  NetworkManager.swift
//  OpenWeather
//
//  Created by Prapti on 08/04/24.
//

import UIKit
import CoreData



class NetworkManager {
    static let shared = NetworkManager()
    private let baseUrl = "https://api.openweathermap.org/data/2.5/forecast"
    private let apiKey = "4a61912511dfd915d73ed8428a179573" // Insert your OpenWeatherMap API key
    
    func fetchWeatherData(lat: Double, lon: Double, completion: @escaping (Result<Welcome, Error>) -> Void) {
        let urlString = "\(baseUrl)?lat=\(lat)&lon=\(lon)&appid=\(apiKey)"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 0, userInfo: nil)))
                return
            }
            do {
                let decoder = JSONDecoder()
                let weatherData = try decoder.decode(Welcome.self, from: data)
                completion(.success(weatherData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}


