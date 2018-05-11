//
//  HẻoDataServices.swift
//  DemoAPI
//
//  Created by Vu Ngoc Cong on 5/10/18.
//  Copyright © 2018 Vu Ngoc Cong. All rights reserved.
//

import UIKit

typealias DICT = Dictionary<AnyHashable, Any>

class HeroDataServices {
    static let shared: HeroDataServices = HeroDataServices()
    
    private var _heros: [Hero]?
    
    var heros: [Hero] {
        get {
            if _heros == nil {
                updateDataFromAPI()
            }
            return _heros ?? []
        }
    }
    
    func updateDataFromAPI() {
        _heros = []
        let urlString = "http://infomationchampion.pe.hu/showInfo.php?index=1&number=20"
        let url = URL(string: urlString)!
        let urlRequest = URLRequest(url: url)
        DispatchQueue.global().async {
            let task = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
                guard error == nil else {
                    print(error!.localizedDescription)
                    return
                }
                
                guard let aData = data else { return }
                
                do {
                    guard let result = try JSONSerialization.jsonObject(with: aData, options: .mutableContainers) as? [DICT] else {
                        return
                    }
                    
                    for heroObject in result {
                        if let hero = Hero(dict: heroObject) {
                            self._heros?.append(hero)
                        }
                    }
                    DispatchQueue.main.async {
                        NotificationCenter.default.post(name: Notification.Name.init("update"), object: nil)
                    }
                }
                catch {
                    print(error.localizedDescription)
                }
            })
            task.resume()
        }
    }
    
}
