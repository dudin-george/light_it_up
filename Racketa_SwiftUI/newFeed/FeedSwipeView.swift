//
//  FeedSwipeView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 16.03.2021.
//

import SwiftUI

struct FeedSwipeView: View {
    
    @State private var offset: CGFloat = 0
    @State private var index = 0
    //разница в высоте
    @State private var heightDiff: CGFloat = 0
    
    private let width = UIScreen.main.bounds.width - 60
    private let height: CGFloat = UIScreen.main.bounds.height - 274

    
    let projects = [Project(id: 0, name: "BioTerm", description: "Производство экологических емкостей и другие непонятные слова", imageName: "forTest"), Project(id: 1, name: "BioTerm2", description: "Производство экологических емкостей и другие непонятные слова", imageName: "forTest"), Project(id: 2, name: "BioTerm3", description: "Производство экологических емкостей и другие непонятные слова", imageName: "forTest")]
    
    func getHeight(id: Int) -> CGFloat {
        if id == projects[index].id {
            return height + 70
        } else if index < projects.count - 1 && id == projects[index + 1].id {
            return height + heightDiff
        } else if index > 0 && id == projects[index - 1].id {
            return height + heightDiff
        }
        return height
    }
    
    
    let spacing: CGFloat = 0
    
    var body: some View {
        return ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: self.spacing) {
                    ForEach(self.projects) { pr in
                        ProjectViewNew(project: pr)
                            .frame(width: width, height: getHeight(id: pr.id))
                            .padding(.leading, 15)

                }
            }
        }
        .content.offset(x: self.offset)
        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
        .gesture(
            DragGesture()
                .onChanged({ value in
                    self.offset = value.translation.width - width * CGFloat(self.index)
                    self.heightDiff = abs(value.translation.width)/width*70
                })
                .onEnded({ value in
                    if -value.predictedEndTranslation.width > width*0.7, self.index < self.projects.count - 1 {
                        self.index += 1
                    }
                    if value.predictedEndTranslation.width > width*0.7, self.index > 0 {
                        self.index -= 1
                    }
                    self.heightDiff = 0
                    withAnimation { self.offset = -(width + self.spacing) * CGFloat(self.index) }
                })
        )
    }
}

struct FeedSwipeView_Previews: PreviewProvider {
    static var previews: some View {
        FeedSwipeView()
    }
}
