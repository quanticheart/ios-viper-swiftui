//
//  ContentView.swift
//  amiibo
//
//  Created by Jonn Alves on 30/12/22.
//

import SwiftUI
import Combine

struct HomeView: View {
    
    @ObservedObject var presenter: HomePresenter
    @State var hideVisited = false
    
    var body: some View {
        NavigationView {
            LoadingView(status: presenter.amiibosList.isEmpty){
                List(presenter.amiibosList, id: \.id) { amiibo in
                    NavigationLink(
                        destination: presenter.router.goToDetails(tail: amiibo.tail)) {
                            Text("\(amiibo.amiiboSeries)  \(amiibo.name)")
                                .onAppear(){amiibo.load()}
                                .contextMenu() {
                                    Button("Like: 💕") {
                                        presenter.setReaction("💕", for: amiibo)
                                    }
                                    Button("OK: 🙏") {
                                        presenter.setReaction("🙏", for: amiibo)
                                    }
                                    Button("TOP!: 🌟") {
                                        presenter.setReaction("🌟", for: amiibo)
                                    }
                                }
                        }
                }
                .navigationBarTitle("Amiibos")
                .navigationBarItems(trailing: Toggle(isOn: $hideVisited, label: { Text("Hide Visited") })
                    .onChange(of: hideVisited) { value in
                        presenter.statusList(hideVisited: value)
                    })
            }.onAppear{
                presenter.loadList()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeRouter.createModule()
    }
}
