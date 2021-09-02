//
//  UserProfileCard.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 10.08.2021.
//

import SwiftUI

struct UserProfileCard: View {
    
    private var user = User(id: 0, phone: 0, name: "Алексей", surname: "Гребинов", birthday: Date(timeIntervalSince1970: 400000000), country: "Russia", city: "Москва", profession: "UX/UI дизайнер", education: [], portfolio: ["Portfolio_1", "Portfolio_2", "Portfolio_3"], description: "", photos: "forTest", tags: [])
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.9725490196, green: 0.9725490196, blue: 0.9725490196, alpha: 1))
            VStack {
                getTopProfileCard()
                Spacer()
            }
        }
    }
    
    private func getPortfolioHStack() -> some View {
            HStack {
                ForEach((0..<user.portfolio.count), content: { i in
                    CustomButtonUrl(title: user.portfolio[i], colorBorder: .black, padding: 10,
                                    colorTitle: .black, url: URL(string: user.portfolio[i])!)
                        .padding(.vertical)
                        .padding(.horizontal, 2)
                })
            }
    }
    
    private func getTopProfileCard() -> some View {
        ZStack {
            RoundedCorners(tl: 0, tr: 0, bl: 25, br: 25)
                .foregroundColor(.white)
                .frame(height: 330)
            VStack {
                Text(user.fullname)
                    .font(.headline)
                
                Image(user.photos)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90, height: 90)
                    .clipShape(Circle())
                
                Text(user.profession)
                
                Text("\(user.age) лет, \(user.city)")
                    .foregroundColor(.gray)
                
                if user.portfolio.count > 2 {
                    ScrollView(.horizontal, showsIndicators: false) {
                        getPortfolioHStack()
                    }
                    .padding(.leading, 12)
                } else {
                    getPortfolioHStack()
                        .padding()
                }
            }
        }
    }
}

struct UserProfileCard_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileCard()
    }
}
