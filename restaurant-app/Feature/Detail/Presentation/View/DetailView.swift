//
//  DetailView.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 03/12/20.
//

import SwiftUI
import Common
import Resolver

struct DetailView: View {

    @Environment(\.presentationMode) var presentationMode

    @ObservedObject var detailViewModel: DetailViewModel

    var restaurantId: String

    init(viewModel: DetailViewModel, restaurantId: String) {
        self.detailViewModel = viewModel
        self.restaurantId = restaurantId
    }

    private var gridItemLayout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    private func addFavorite() {
        self.detailViewModel.addFavorite()
    }

    private func isFavorite() -> Bool {
        guard let isFavorite = self.detailViewModel.restaurantDetail?.isFavorite  else { return false}
        return isFavorite
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ZStack(alignment: .topLeading) {
                    ImageNetwork(url: self.detailViewModel.restaurantDetail?.mediumPicture ?? "", width: nil, height: 200)

                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        ZStack {
                            Image.icBack
                                .resizable()
                                .frame(width: 16, height: 16)
                                .foregroundColor(.black100)
                        }
                        .padding(8)
                        .background(Color.white)
                        .cornerRadius(8)
                        .shadow(radius: 4)
                    })
                    .padding(16)
                    .offset(x: 0)
                }

                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        Text(self.detailViewModel.restaurantDetail?.name ?? "")
                        .titleStyle()
                        Spacer()
                        Button(action: self.addFavorite, label: {
                            if self.isFavorite() {
                                Image.icFavoriteFill
                                    .foregroundColor(.red)
                            } else {
                                Image.icFavorite
                                    .foregroundColor(.black60)
                            }
                        })
                    }

                    Text(self.detailViewModel.restaurantDetail?.categories ?? "")
                        .foregroundColor(.black100)
                        .font(.system(size: 14))
                        .italic()

                    HStack {
                        Image.icMap
                            .foregroundColor(.black100)
                        Text("\(self.detailViewModel.restaurantDetail?.address ?? ""), \(self.detailViewModel.restaurantDetail?.city ?? "")")
                            .foregroundColor(.black100)
                            .font(.system(size: 14))
                    }

                    Spacer()
                        .frame(height: 16)

                    VStack(alignment: .leading, spacing: 24) {

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Overview")
                                .titleSectionStyle()

                            Text(self.detailViewModel.restaurantDetail?.description ?? "")
                                .descriptionStyle()
                                .lineLimit(2)
                        }

                        VStack(alignment: .leading, spacing: 16) {
                            Text("Food")
                                .titleSectionStyle()

                            LazyVGrid(columns: gridItemLayout, spacing: 16) {
                                ForEach(self.detailViewModel.restaurantDetail?.foods ?? [], id: \.self) { food in
                                    MenuWidget(name: food)
                                }
                            }
                        }

                        VStack(alignment: .leading, spacing: 16) {
                            Text("Baverage")
                                .titleSectionStyle()

                            LazyVGrid(columns: gridItemLayout, spacing: 16) {
                                ForEach(self.detailViewModel.restaurantDetail?.drinks ?? [], id: \.self) { drink in
                                    MenuWidget(name: drink)
                                }
                            }
                        }

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Rating")
                                .titleSectionStyle()

                            HStack(spacing: 16) {
                                RatingWidget(rating: self.detailViewModel.restaurantDetail?.rating ?? 0)
                            }

                            Spacer()
                                .frame(height: 4)

                            ForEach(self.detailViewModel.restaurantDetail?.reviews ?? [], id: \.id) { review in
                                ReviewWidget(reviewModel: review)
                            }
                        }
                    }

                }
                .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))

                Spacer()
            }
        }
        .navigationBarHidden(true)
        .onAppear(perform: {
            self.detailViewModel.getDetailRestaurant(restaurantId: self.restaurantId)
        })
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: Resolver.resolve(), restaurantId: "")
    }
}
