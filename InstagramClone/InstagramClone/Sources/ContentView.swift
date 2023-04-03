//
//  ContentView.swift
//  InstagramClone
//
//  Created by 이승기 on 2022/07/31.
//

import SwiftUI

struct ContentView: View {
  let users: [User] = [
    .init(name: "josh_me", image: "profile_image1"),
    .init(name: "liddy_tash", image: "profile_image2"),
    .init(name: "jomma_oppa", image: "profile_image3"),
    .init(name: "lainy._.hi", image: "profile_image4"),
    .init(name: "greedy_hamster", image: "profile_image5")
  ]
  
  @State var posts: [Post] = [
    .init(user: .init(name: "josh_me", image: "profile_image1"),
          description: "location: Jeju island", images: ["feed_image1", "feed_image2"],
          content: "I went to Jeju. Is was the most wonderful experience I've ever had"),
    .init(user: .init(name: "jomma_oppa", image: "profile_image3"),
          description: "location: Jeju island", images: ["feed_image2", ""],
          content: "Yo I've been to Jeju either"),
    .init(user: .init(name: "greedy_hamster", image: "profile_image5"),
          description: "The space", images: ["feed_image3"],
          content: "I'm in space.. reconnecting..."),
  ]
  
  init() {
    UITabBar.appearance().backgroundColor = .systemBackground
  }
  
  var body: some View {
    GeometryReader { geometry in
      let colWidth = geometry.size.width / 3
      
      TabView {
        NavigationView {
          VStack(spacing: 0) {
            NavView(colWidth: colWidth)
            
            ScrollView(.vertical) {
              VStack() {
                NewsView()
                Divider()
                ScrollView(.horizontal, showsIndicators: false) {
                  StoryView(users: users)
                }
                Divider()
              }
              LazyVStack(spacing: 36) {
                ForEach(posts, id: \.id) { post in
                  PostView(post: post)
                }
              }
              .padding(.top, 24)
              .padding(.bottom, 24)
            }
            .frame(maxWidth: .infinity)
          }
          .navigationBarHidden(true)
        }
        .tabItem {
          Image("home")
            .renderingMode(.template)
            .scaledToFill()
        }
        
        NavigationView {
          VStack {
            
          }
        }
        .tabItem {
          Image("search")
            .renderingMode(.template)
            .scaledToFill()
        }
        
        NavigationView {
          VStack {
            
          }
        }
        .tabItem {
          Image("reels")
            .renderingMode(.template)
            .scaledToFill()
        }
        
        NavigationView {
          VStack {
            
          }
        }
        .tabItem {
          Image("shop")
            .renderingMode(.template)
            .scaledToFill()
        }
        
        NavigationView {
          VStack {
            
          }
        }
        .tabItem {
          Image("profile")
            .renderingMode(.template)
            .scaledToFill()
        }
      }
    }
  }
}

struct ContentView_Preview: PreviewProvider {
  static var previews: some View {
    return ContentView()
      .previewDevice(.init(rawValue: "iPhone 13 Pro"))
  }
}
