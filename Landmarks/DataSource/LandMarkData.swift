//
//  ModelData.swift
//  Landmarks
//
//  Created by Lucy on 18/08/22.
//

import Foundation
import Combine

class LandMarkData{
    static func load<T: Decodable>() -> T {
        let data: Data
        let fileName = "landmarkData.json"

        guard let file = Bundle.main.url(forResource: fileName, withExtension: nil)
        
        else {
            fatalError("Couldn't find \(fileName) in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
            
        } catch {
            fatalError("Couldn't load \(fileName) from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(fileName) as \(T.self):\n\(error)")
        }
    }
}
