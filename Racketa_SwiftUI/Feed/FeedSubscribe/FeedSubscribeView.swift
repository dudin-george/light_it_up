//
//  FeedSubscribeView.swift
//  Racketa_SwiftUI
//
//  Created by Александр Оганов on 07.04.2021.
//

import SwiftUI

struct FeedSubscribeView: View {
    
    @ObservedObject var viewModel = ProjectSubscribeManager()
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.projects) { project in
                ProjectViewSubscribe(project: project, newsItem: nil)
                    .padding(.bottom, 10.5)
                    .padding(.horizontal, 8)
            }
            VStack {
                Spacer(minLength: 80)
            }
        }
    }
}

struct FeedSubscribeView_Previews: PreviewProvider {
    static var previews: some View {
        FeedSubscribeView()
    }
}
