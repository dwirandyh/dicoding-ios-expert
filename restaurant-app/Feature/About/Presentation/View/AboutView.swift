//
//  AboutView.swift
//  restaurant-app
//
//  Created by Dwi Randy Herdinanto on 05/12/20.
//

import SwiftUI
import Common

struct AboutView: View {

    var body: some View {
        VStack(alignment: .leading, spacing: 30) {

            AboutProfile(name: "Dwi Randy H", role: "iOS Engineer")

            VStack(alignment: .leading, spacing: 24) {
                AboutLink(name: "Github", link: "https://github.com/dwirandyh/")
                AboutLink(name: "Website", link: "https://dwirandyh.com")
            }
            .padding([.leading, .trailing], 16)

            Spacer()
        }
        .navigationBarTitle("Profile", displayMode: .inline)
    }
}

struct AboutLink: View {
    var name: String
    var link: String

    init(name: String, link: String) {
        self.name = name
        self.link = link
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(name)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(.black100)

            Text(link)
                .font(.system(size: 13))
                .fontWeight(.regular)
                .foregroundColor(.black80)
        }
    }
}

struct AboutProfile: View {
    var name: String
    var role: String

    init(name: String, role: String) {
        self.name = name
        self.role = role
    }

    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Image.background
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: 200)

                HStack(alignment: .center, spacing: 16) {
                    Image.profile
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 80, height: 80)
                    VStack(alignment: .leading) {
                        Text(self.name)
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                        Text(self.role)
                            .font(.system(size: 14))
                            .foregroundColor(.black60)
                    }
                }
                .padding([.leading, .trailing], 20)
                .padding([.top], 45)
            }
        }.frame(height: 200)
        .edgesIgnoringSafeArea(.top)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AboutView()
            AboutLink(name: "Github", link: "https://github.com/dwirandyh").previewLayout(.sizeThatFits)
            AboutProfile(name: "Dwi Randy", role: "iOS Engineer").previewLayout(.sizeThatFits)
        }
    }
}
