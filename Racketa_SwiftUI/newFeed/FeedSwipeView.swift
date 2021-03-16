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
    private let width = UIScreen.main.bounds.width - 60
    private let height: CGFloat = UIScreen.main.bounds.height - 274

    
    let projects = [Project(id: 0, name: "BioTerm", description: "Производство экологических емкостей и другие непонятные слова", imageName: "forTest"), Project(id: 1, name: "BioTerm2", description: "Производство экологических емкостей и другие непонятные слова", imageName: "forTest"), Project(id: 2, name: "BioTerm3", description: "Производство экологических емкостей и другие непонятные слова", imageName: "forTest")]
    
//    private var curId: Int {
//        return projects[index].id
//    }
    
    let spacing: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            return ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: self.spacing) {
                        ForEach(self.projects) { project in
                            ProjectViewNew(project: project)
                                .padding(.leading, 15)

                    }
                }
            }
            .content.offset(x: self.offset)
            .frame(width: geometry.size.width, alignment: .leading)
            .gesture(
                DragGesture()
                    .onChanged({ value in
                        self.offset = value.translation.width - width * CGFloat(self.index)
                    })
                    .onEnded({ value in
                        if -value.predictedEndTranslation.width > width / 2, self.index < self.projects.count - 1 {
                            self.index += 1
                        }
                        if value.predictedEndTranslation.width > width / 2, self.index > 0 {
                            self.index -= 1
                        }
                        withAnimation { self.offset = -(width + self.spacing) * CGFloat(self.index) }
                    })
            )
        }
    }
}

struct FeedSwipeView_Previews: PreviewProvider {
    static var previews: some View {
        FeedSwipeView()
    }
}
