//
//  ProjectPreferencesView.swift
//  XcodeProjects
//
//  Created by Dima Kalachniuk on 13/08/2020.
//  Copyright © 2020 com.klm.mac.myProjects. All rights reserved.
//

import SwiftUI

struct ProjectPreferencesView: View {
    @EnvironmentObject var preferences: Preferences

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ProjectPreferencesView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectPreferencesView()
    }
}
