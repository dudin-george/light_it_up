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
    @State private var heightDiff: CGFloat = 0
    
    
    private let width = UIScreen.main.bounds.width - 60
    private let height: CGFloat = UIScreen.main.bounds.height - 274
    private let heightDelta: CGFloat = 70
    
    let projects = [Project(id: 0, name: "BioTerm", description: "Производство экологических емкостей и другие непонятные слова", imageName: "forTest"), Project(id: 1, name: "BioTerm2", description: "Производство экологических емкостей и другие непонятные слова", imageName: "forTest"), Project(id: 2, name: "BioTerm3", description: "Производство экологических емкостей и другие непонятные слова", imageName: "forTest")]
    
    private func getHeight(id: Int) -> CGFloat {
        //print("DEBUG:", height + heightDelta - heightDiff)
        if id == projects[index].id {
            return height + heightDelta - heightDiff
        }
        return height + heightDiff
    }
    
    
    let spacing: CGFloat = 0
    let leading: CGFloat = 15
    
    var body: some View {
        return ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: self.spacing) {
                    ForEach(self.projects) { pr in
                        ProjectViewNew(project: pr)
                            .frame(width: width, height: getHeight(id: pr.id))
                            .animation(Animation.easeInOut(duration: 0.7))
                            .padding(.leading, leading)
                }
            }
        }
        .content.offset(x: self.offset)
        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
        .gesture(
            DragGesture()
                .onChanged({ value in
                    self.offset = value.translation.width - width * CGFloat(self.index)
                    self.heightDiff = abs(value.translation.width)/width*heightDelta
                })
                .onEnded({ value in
                    let k: CGFloat = 0.8
                    let kPredict: CGFloat = 1
                    if -value.translation.width > width*k,
                       -value.predictedEndTranslation.width > width*kPredict, self.index < self.projects.count - 1 {
                        self.index += 1
                    }
                    if value.translation.width > width*k,
                       value.predictedEndTranslation.width > width*kPredict, self.index > 0 {
                        self.index -= 1
                    }
                    withAnimation {
                        self.offset = -(width + self.spacing + self.leading) * CGFloat(self.index)
                        self.heightDiff = 0
                    }
                })
        )
    }
}

struct FeedSwipeView_Previews: PreviewProvider {
    static var previews: some View {
        FeedSwipeView()
    }
}
