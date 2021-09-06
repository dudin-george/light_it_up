//
//  NewsEditView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 06.09.2021.
//

import SwiftUI

struct NewsEditView: View {
    @State var items: [NewsItem] = []
    @State var text: String = "\t"
    @State var lastText: String = ""
    @State var tagTitle: Int = 2
    @State var tagTab: Bool = false
    
    let startStr = "\t"
    var body: some View {
        VStack {
            ScrollView {
                let width = UIScreen.main.bounds.width - 50
                ForEach(0..<items.count, id: \.self, content: { i in
                    HStack {
                        let item = items[i]
                        if item.tagTitle == 1 {
                            Text("\n")
                                .padding(4)
                                .frame(width: width, alignment: .leading)
                        } else if item.tagTitle >= 2 && item.tagTitle <= 5 {
                            HStack {
                                if item.tagTab {
                                    Rectangle()
                                        .frame(width: 10, height: 35)
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                                getText(item: item)
                            }
                        }
                    }
                })
                HStack {
                    if tagTab {
                        Rectangle()
                            .frame(width: 10, height: 35)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    getTextEditor()
                }
            }
            .frame(maxWidth: .infinity)
            HStack {
                Button(action: {
                    if tagTitle < 5 {
                        tagTitle += 1
                    } else {
                        tagTitle = 2
                    }
                }) {
                    Text("Title")
                        .padding()
                }
                
                Button(action: {
                    tagTab.toggle()
                }) {
                    Text("->")
                        .padding()
                }
                Spacer()
            }
        }
    }
    
    private func getFont(tag: Int) -> Font {
        let arr: [CGFloat] = [15, 17, 19, 13]
        return Font.system(size: arr[tag])
    }
    
    let width = UIScreen.main.bounds.width - 40
    
    private func getText(item: NewsItem) -> some View {
        return Text("\(item.str)")
            .padding(4)
            .frame(width: width, alignment: .leading)
            .font(getFont(tag: item.tagTitle - 2))
    }
    
    private func getTextEditor() -> some View {
        return TextEditor(text: $text)
            .colorMultiply(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.3552011986)))
            .font(getFont(tag: tagTitle - 2))
            .frame(width: width, alignment: .leading)
            .onChange(of: text, perform: { value in
                if value.last == "\n" {
                    if value == startStr + "\n" {
                        items.append(NewsItem(tagTitle: 1, tagTab: false, str: "  "))
                    } else {
                        print(tagTab)
                        items.append(NewsItem(tagTitle: tagTitle, tagTab: tagTab, str: text))
                    }
                    text = startStr
                    tagTitle = 2
                    tagTab = false
                }
                if lastText.count == 1 && value.count == 0 {
                    if items.isEmpty == false {
                        var str = items.last!.str
                        if str.isEmpty == false {
                            str.removeLast()
                        }
                        items.removeLast()
                        text = str
                        tagTitle = 2
                        tagTab = false
                    }
                }
                lastText = text
            })
    }
}

struct NewsEditView_Previews: PreviewProvider {
    static var previews: some View {
        NewsEditView()
    }
}

struct NewsItem {
    var tagTitle: Int
    var tagTab: Bool
    var str: String
}
