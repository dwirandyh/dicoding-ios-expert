//
//  LoadingWidget.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 05/12/20.
//

import SwiftUI

struct LoadingWidget: UIViewRepresentable {
    typealias UIViewType = UIActivityIndicatorView

    @Binding var isLoading: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: self.style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if self.isLoading {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
}
