//
//  OptionSetsView.swift
//  FlippingDishes
//
//  Created by Serdar Buhan on 16/11/2021.
//

import SwiftUI

struct OptionSetsView: View {

    let optionSets: [MenuItemOptionSet]

    var body: some View {

        HStack {
            Spacer(minLength: 0)
            VStack(alignment: .center) {
                ForEach(optionSets) { optionSet in
                    VStack(alignment: .leading) {
                        if let optionSetName = optionSet.name {
                            Text(optionSetName)
                                .font(.callout)
                                .bold()
                                .foregroundColor(.black)
                        }
                        HStack {
                            ForEach(optionSet.optionSetItems) { item in
                                OptionSetItemView(item: item)
                            }
                        }
                    }
                }
            }
            Spacer(minLength: 0)
        }
        .padding()
        .background(Color.orange.opacity(0.4))
        .cornerRadius(20.0)
    }
}

struct OptionSetsView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            Spacer()
            OptionSetsView(optionSets: [.mock(), .mock()])
                .background(Color.orange)
            Spacer()
        }
    }
}

extension MenuItemOptionSet {
    static func mock(id: Int = 1,
                     name: String? = "Size",
                     isMasterOptionSet: Bool = false,
                     optionSetItems: [MenuItemOptionSetItem] = [.mock(name: "Small"),
                                                                .mock(name: "Large")]) -> MenuItemOptionSet {
        return MenuItemOptionSet(id: id,
                                 name: name,
                                 isMasterOptionSet: false,
                                 optionSetItems: optionSetItems)
    }
}
