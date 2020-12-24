//
//  AppSideBarNavigation.swift
//  PhotoViewer
//
//  Created by Алишер Алсейт on 24.12.2020.
//

import SwiftUI

struct AppSideBarNavigation: View {
    
    enum NavigationItem {
        case list
        case grid
        
    }
    
    @State private var selection: Set<NavigationItem> = [.list]
    
    var sidebar: some View {
        List(selection: $selection){
            NavigationLink(destination: ContentView()) {
                Label("List", systemImage: "list.bullet")
                    .accessibility(label: Text("List Layout"))
                    .tag(NavigationItem.list)
            }
            NavigationLink(destination: ImageGridView()) {
                Label("Grid", systemImage: "rectangle.3.offgrid")
                    .accessibility(label: Text("Grid Layout"))
                    .tag(NavigationItem.grid)
            }
        }
        .navigationTitle("Content Options")
        .listStyle(SidebarListStyle())
    }
    
    var body: some View {
        
        NavigationView{
            sidebar
            Text("select Content Style")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct AppSideBarNavigation_Previews: PreviewProvider {
    static var previews: some View {
        AppSideBarNavigation()
    }
}
