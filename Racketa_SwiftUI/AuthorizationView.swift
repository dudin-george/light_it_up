//
//  ContentView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 18.02.2021.
//

import SwiftUI

struct AuthorizationView: View {
    
    private let standartHeight: CGFloat = 45
    private let corner: CGFloat = 30
    
    private let phoneMask = "+X (XXX) XXX-XX-XX"
    
    @State var phoneNumber: String = ""
    
    @State var numberCorrect = false
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 1, green: 0.5764705882, blue: 0.4666666667, alpha: 1)).edgesIgnoringSafeArea(.all)
            GeometryReader { geometry in
                VStack{
                    VStack(alignment: .leading, spacing: 26) {
                        VStack(alignment: .leading, spacing: 18){
                            Text("Регистрация")
                                .font(Font.system(size: 24))
                                .bold()
                            Text("На ваш номер телфона придет код для подтверждения регистрации")
                            
                        }
                            .foregroundColor(.white)
                            .padding(.top, 111.0)
                            .padding(.leading, 42)
                        Spacer().frame(height: 26)
                        PhoneEditableText(placeHolder: "Введите номер телефона...", text: phoneNumber, onChanged: setPhoneNumber(newPhoneNumber:))
                            .background(Color(#colorLiteral(red: 1, green: 0.6763185859, blue: 0.5504712462, alpha: 1)))
                            .frame(height: standartHeight)
                            .cornerRadius(corner)
                            .padding(.horizontal, 44)
                    }
                    Spacer().frame(height: 43)
                    if numberCorrect {
                        Button(action: {
                            print("go to code view")
                        }, label: {
                            Text("Получить код")
                                .bold()
                        })
                        .frame(width: 310, height: standartHeight)
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 0.6078431373, blue: 0.5098039216, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.8274509804, blue: 0.6666666667, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(corner)
                    } else {
                        Text("Получить код")
                            .bold()
                            .frame(width: 310, height: standartHeight)
                            .foregroundColor(.gray)
                            .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 0.6078431373, blue: 0.5098039216, alpha: 1)), Color(#colorLiteral(red: 1, green: 0.8274509804, blue: 0.6666666667, alpha: 1))]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(corner)
                    }
                }
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
    }
    
    func setPhoneNumber(newPhoneNumber: String) {
        phoneNumber = newPhoneNumber
        numberCorrect = phoneNumber.count == phoneMask.count
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorizationView()
    }
}
