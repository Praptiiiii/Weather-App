//
//  DataManager.swift
//  OpenWeather
//
//  Created by Prapti on 08/04/24.
//

import UIKit
import CoreData

class DataManager {
    
    static let shared = DataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "WeatherData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        })
        return container
    }()
    
    func saveWeatherData(_ data: Welcome) {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            let context = self.persistentContainer.newBackgroundContext()
            context.performAndWait {
                let entity = NSEntityDescription.entity(forEntityName: "Weather", in: context)!
                let weather = NSManagedObject(entity: entity, insertInto: context)
                weather.setValue(data.city.name, forKeyPath: "cityName")
                do {
                    try context.save()
                } catch {
                    print("Failed to save data: \(error)")
                }
            }
        }
    }

}

