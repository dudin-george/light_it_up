//
//  UserProfileView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 10.08.2021.
//

import SwiftUI

struct UserProfileView: View {
    
    private var user = User(id: 0, phone: 0, name: "Алексей", surname: "Гребинов", birthday: Date(timeIntervalSince1970: 100000), country: "Russia", city: "Москва", profession: "UX/UI дизайнер", education: [], portfolio: ["Portfolio"], description: "", photos: "forTest", tags: [])
    
    var body: some View {
        ZStack {
            UserProfileCard()
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
