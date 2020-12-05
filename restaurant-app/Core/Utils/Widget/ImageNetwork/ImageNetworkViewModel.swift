//
//  ImageNetworkViewModel.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 03/12/20.
//

import Foundation
import Combine

class ImageNetworkViewModel: ObservableObject {
    var data = PassthroughSubject<Data, Never>()

    init(url: String) {
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let imageData = data else { return }
            DispatchQueue.main.async {
                self.data.send(imageData)
            }
        }

        task.resume()
    }
}
