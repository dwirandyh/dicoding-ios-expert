//
//  ImageNetwork.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 03/12/20.
//

import Foundation
import SwiftUI

struct ImageNetwork: View {

    @ObservedObject var viewModel: ImageNetworkViewModel
    @State var image: UIImage = UIImage()

    var width: CGFloat?
    var height: CGFloat?

    init(url: String, width: CGFloat?, height: CGFloat?) {
        self.viewModel = ImageNetworkViewModel(url: url)
        self.width = width
        self.height = height
    }

    var body: some View {
        Image(uiImage: self.image)
            .resizable()
            .scaledToFill()
            .frame(width: self.width, height: self.height)
            .clipped()
            .onReceive(viewModel.data) { data in
                self.image = UIImage(data: data) ?? UIImage()
            }
    }
}
