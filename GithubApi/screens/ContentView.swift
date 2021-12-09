//
//  ContentView.swift
//  GithubApi
//
//  Created by Muhammadjon Mamarasulov on 12/7/21.
//

import SwiftUI
import Kingfisher
struct ContentView: View {
    @ObservedObject var ViewModel = PostViewModel()
    var body: some View {
        NavigationView{
            ZStack{
                Image("ic_main")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                if ViewModel.isLoading{
                    ProgressView()
                }else{
                    VStack{
                        KFImage(URL(string: ViewModel.posts.avatar_url ?? ""))
                            .resizable()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 5))
                            .shadow(radius: 10)
                            .padding()
                        Text(ViewModel.posts.login ?? "")
                        //Location
                        Text(ViewModel.posts.location ?? "")
                       // Text(String(ViewModel.posts.followers ?? ""))
                        HStack{
                            Image(systemName: "gamecontroller.fill")
                            //Spacer()
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                NavigationLink(
                                    destination: DetailScreen(),
                                    label: {
                                        Text(ViewModel.posts.bio ?? "")
                                    })
                                
                            })
                        }.padding()
                    }
                    
                }
            }
        }.onAppear{
            ViewModel.apiPostList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
