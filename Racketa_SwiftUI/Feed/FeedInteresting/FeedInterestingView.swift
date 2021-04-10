//
//  FeedSwipeView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 16.03.2021.
//

import SwiftUI

struct FeedInterestingView: View {
    
    @State private var showingSheet = false
    @State private var offset: CGFloat = 0
    @State private var offsetY: CGFloat = 0
    @State private var index = 0
    @State private var heightDiff: CGFloat = 0
    
    
    private let width = UIScreen.main.bounds.width - 60
    private let height: CGFloat = UIScreen.main.bounds.height - 330
    private let heightDelta: CGFloat = 70
    
    @ObservedObject var viewModel = ProjectInterestingManager()
    
    private func getHeight(id: Int) -> CGFloat {
        if id == viewModel.projects[index].id {
            return height + heightDelta - heightDiff
        }
        return height + heightDiff
    }
    
    private func getOffsetY(id: Int) -> CGFloat {
        if id == viewModel.projects[index].id {
            return offsetY
        }
        return 0
    }
    
    private func getOffsetMain(show: Bool) -> CGFloat {
        return show ? 0 : UIScreen.main.bounds.height
    }
    
    let spacing: CGFloat = 0
    let leading: CGFloat = 15
    
    var body: some View {
        ZStack() {
            scrollView()
            ProjectViewMain(showView: $showingSheet, isProject: true, project: viewModel.projects[index])
            //ProjectViewMain(project: viewModel.projects[index], events: TestSystem.events, isProject: true)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .animation(Animation.easeIn(duration: 3))
                .offset(y: getOffsetMain(show: showingSheet))
        }
    }
    
    func scrollView() -> some View {
        ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: self.spacing) {
                    ForEach(self.viewModel.projects) { pr in
                        ProjectViewInteresting(project: pr)
                            .frame(width: width, height: getHeight(id: pr.id))
                            .animation(Animation.easeInOut(duration: 0.5))
                            .padding(.leading, leading)
                            .offset(y: getOffsetY(id: pr.id))
                }
            }
        }
        .content.offset(x: self.offset)
        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
        .gesture(
            DragGesture()
                .onChanged({ value in
                    self.offset = value.translation.width - width * CGFloat(self.index)
                    let upHeight = value.translation.height > 0 ? 0 : value.translation.height
                    self.offsetY = upHeight < -150 ? -150 : upHeight
                    if self.offsetY == -150 {
                        showingSheet = true
                        self.offsetY = 0
                    }
                    self.heightDiff = abs(value.translation.width)/width*heightDelta
                })
                .onEnded({ value in
                    let k: CGFloat = 0.8
                    let kPredict: CGFloat = 1
                    if -value.translation.width > width*k,
                       -value.predictedEndTranslation.width > width*kPredict, self.index < self.viewModel.projects.count - 1 {
                        self.index += 1
                    }
                    if value.translation.width > width*k,
                       value.predictedEndTranslation.width > width*kPredict, self.index > 0 {
                        self.index -= 1
                    }
                    withAnimation {
                        self.offset = -(width + self.spacing + self.leading) * CGFloat(self.index)
                        self.heightDiff = 0
                        self.offsetY = 0
                    }
                })
        )
    }
}

struct FeedSwipeView_Previews: PreviewProvider {
    static var previews: some View {
        FeedInterestingView()
    }
}
