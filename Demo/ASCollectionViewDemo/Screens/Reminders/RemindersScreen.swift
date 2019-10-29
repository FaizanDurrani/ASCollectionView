//
//  RemindersScreen.swift
//  ASCollectionViewDemo
//
//  Created by Toby Brennan on 26/10/19.
//  Copyright © 2019 Apptek Studios. All rights reserved.
//

import SwiftUI
import ASCollectionView

struct RemindersScreen: View {
	enum Section {
		case upper
		case list
		case addNew
	}
	
	@State var upperData : [GroupModel] = [
		GroupModel(icon: "calendar", title: "Today", color: .blue),
		GroupModel(icon: "clock.fill", title: "Scheduled", color: .orange),
		GroupModel(icon: "tray.fill", title: "All", color: .gray),
		GroupModel(icon: "flag.fill", title: "Flagged", color: .red),
	]
	
	let addNewModel = GroupModel(icon: "plus", title: "Create new list", contentCount: nil, color: .green)
	
    var body: some View {
		ASCollectionView<Section>(layout: layout, sections: [
			ASCollectionViewSection(id: .upper, data: upperData) { model in
				GroupLarge(model: model)
			},
			ASCollectionViewSection(id: .list, data: upperData) { model in
				GroupSmall(model: model)
			}
			.sectionHeader {
				HStack {
					Text("My Lists")
						.font(.headline)
						.bold()
						.padding(.bottom, 5)
					Spacer()
				}
			},
			ASCollectionViewSection(id: .addNew, content:
				GroupSmall(model: addNewModel)
			)
				.sectionFooter {
					HStack {
						Spacer()
						Text("Try rotating the screen")
							.padding()
							.background(Color(.secondarySystemGroupedBackground))
						Spacer()
					}
					.padding(.top)
			}
		])
			.contentInsets(.init(top: 20, left: 0, bottom: 20, right: 0))
			.background(Color(.systemGroupedBackground))
			.edgesIgnoringSafeArea(.all)
    }
	
	var layout: ASCollectionViewLayout<Section>
	{
		ASCollectionViewLayout(interSectionSpacing: 20) { section -> ASCollectionViewLayoutSection in
			switch section {
			case .upper:
				return ASCollectionViewLayoutGrid(layoutMode: .adaptive(withMinItemSize: 165), itemSpacing: 20, lineSpacing: 20, itemSize: .absolute(90))
			case .list, .addNew:
				return ASCollectionViewLayoutGrid(layoutMode: .adaptive(withMinItemSize: 220), itemSpacing: 20, lineSpacing: 5, itemSize: .absolute(65))
			}
		}
	}
}

struct RemindersScreen_Previews: PreviewProvider {
    static var previews: some View {
        RemindersScreen()
    }
}
