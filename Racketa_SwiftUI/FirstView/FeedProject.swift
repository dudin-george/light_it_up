//
//  FeedProject.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 16.05.2021.
//

import SwiftUI

struct FeedProject: View {
    
    private let width = UIScreen.main.bounds.width
    @State var subView = true
    
    var body: some View {
        VStack {
            setHotNews()
                .padding(.vertical, 10)
            stories()
                .padding(.vertical, 10)
            Button(action: {
                print("Debug: Создать запись")
            }){
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 28)
                        .frame(width: width - 56, height: 37)
                        .accentColor(Color.init(#colorLiteral(red: 0.8823529412, green: 0.8823529412, blue: 0.8823529412, alpha: 1)))
                    (Text(Image("pencil")).bold() + Text("Создать запись"))
                        .foregroundColor(.gray)
                        .font(Font.custom("ProximaNova-Extrabld", size: 14))
                        .padding(.leading, 12)
                }
            }
            .padding(.vertical, 10)
            
            HStack(spacing: 65){
                Button(action: {
                    print("Debug: подписки")
                    subView = true
                }){
                    Text("Подписки")
                        .font(Font.custom("ProximaNova-Extrabld", size: 14))
                        .foregroundColor(subView ? .blue : .gray)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.blue, lineWidth: subView ? 3 : 0)
                                .frame(width: 128, height: 23)
                        )
                }
                
                Button(action: {
                    print("Debug: интересное")
                    subView = false
                }){
                    Text("Интересное")
                        .font(Font.custom("ProximaNova-Extrabld", size: 14))
                        .foregroundColor(!subView ? .blue : .gray)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.blue, lineWidth: !subView ? 3 : 0)
                                .frame(width: 133, height: 23)
                        )
                }
            }
            .frame(width: width - 128, alignment: .leading)
            .padding(.vertical, 10)
        }
    }
    
    private func setHotNews() -> some View{
        let widthImage = width - 56
        return ZStack {
            Image("forTest")
                .resizable()
                .scaledToFill()
                .frame(width: widthImage, height: widthImage*0.61, alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: Color.init(#colorLiteral(red: 0.6990006345, green: 0.6990006345, blue: 0.6990006345, alpha: 0.5)), radius: 4, x: 0, y: 4)
        }
    }
    
    private func stories() -> some View {
        return ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20){
                ForEach((1...20).reversed(), id: \.self){ i in
                    if i == 20 {
                        imageForStories()
                            .padding(.leading, 28)
                    } else {
                        imageForStories()
                    }
                }
            }
        }
    }
    
    private func imageForStories() -> some View {
        return Image("forTest")
            .resizable()
            .scaledToFill()
            .frame(width: 60, height: 60)
            .clipShape(Circle())
    }
}

struct FeedProject_Previews: PreviewProvider {
    static var previews: some View {
        FeedProject()
    }
}
