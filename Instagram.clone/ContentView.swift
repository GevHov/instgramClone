//
//  ContentView.swift
//  Instagram.clone
//
//  Created by Gevorg Hovhannisyan on 26.12.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            navigationBar
            stories
            post
            Spacer()
        }
    }
    
    var navigationBar: some View {
        HStack{
            Image("iconInstagram")
            Spacer()
            
            HStack(spacing: 26) {
                Button(action: {}){
                    Image("iconNewPhotoVideo")
                }
                
                Button(action: {}){
                    Image("iconEmptyHeart")
                }
                
                Button(action: {}){
                    Image("iconDirect")
                }
            }
            .foregroundColor(.accentColor)
        }
        .padding(.horizontal, 20)
    }
    
    var stories: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                ForEach(storyCollections){ storyCollection in
                    StoryCollectionView(storyCollection: storyCollection)
                }
            }
        }
    }
    var post: some View{
        PostView()
    }
}

    struct PostView: View {
     var body: some View {
         VStack(spacing: 0){
             header
             content
             actions
             liked
             caption
         }
     }
        
        var header: some View{
            HStack{
                Image("2")
                    .resizable()
                    .frame(width: 32, height: 32)
                    .clipped()
                    .scaledToFit()
                    .cornerRadius(66)
                VStack(alignment: .leading){
                    Text("pierborgo")
                        .font(.system(size: 13.5, weight: .medium))
                    Text("Florence, Italy")
                        .font(.system(size: 11.5, weight: .regular))

                }
                Spacer()
                Button(action: {}) {
                    Image("iconThreeDot")
                        .foregroundColor(.black)
                }
            }
            .padding(10)
        }
        
        var content: some View{
            TabView{
                Image("1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 414, height: 414)
                    .clipped()
                Image("2")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 414, height: 414)
                    .clipped()
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
           
        var actions: some View{
            HStack{
            Button(action: {}) {
                Image("iconeHeart")
            }
                Button(action: {}) {
                    Image("iconComment")
                }
                Button(action: {}) {
                    Image("iconDirect")
                }
                Spacer()
                Button(action: {}) {
                    Image("iconCollect")
                }
                .foregroundColor(.black)
                .padding(10)
            }
        }
        
        var liked: some View{
            HStack(spacing: 5){
                HStack(spacing: -15){
                    CircledImageView(imageName: "1")
                    CircledImageView(imageName: "2")
                    CircledImageView(imageName: "3")
                }
                Text("Liked by ").font(.system(size: 13.5, weight: .regular))
                +
                Text("leeviahq ").font(.system(size: 13.5, weight: .medium))
                +
                Text("and ").font(.system(size: 13.5, weight: .regular))
                +
                Text("others").font(.system(size: 13.5, weight: .medium))
                Spacer()
            }
        }
        var caption: some View{
            Text("pieroborgo ").font(.system(size: 13.5, weight: .bold))
            +
            Text("Thanks for dowloading this freebie ❤️ ").font(.system(size: 13.5, weight: .regular))
            +
            Text("#freebie #instagram #figma")
            .font(.system(size: 13.5, weight: .regular))
            .foregroundColor(.blue)
        }
}

struct CircledImageView: View {
    var imageName: String
    
    var body: some View{
        ZStack{
            Circle()
                .fill(Color .white)
        Image("3")
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .padding(2)
        }
        .frame(width: 32, height: 32)
    }
}

struct StoryCollection: Identifiable {
    var id: String {
        title
    }
    
    let title: String
    let thumbnaile: Image
}


struct StoryCollectionView: View {
    let storyCollection: StoryCollection
    var body: some View {
        ZStack{
            storyCollection.thumbnaile
                .resizable()
                .frame(width: 66, height: 66)
                .clipped()
                .scaledToFill()
                .cornerRadius(100)
        }
        .frame(width: 66, height: 66)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}

let storyCollections:[StoryCollection] = [
.init(title: "nugmanoff",thumbnaile: Image("1")),
.init(title: "nugmanoff",thumbnaile: Image("1")),
.init(title: "nugmanoff",thumbnaile: Image("1")),
.init(title: "nugmanoff",thumbnaile: Image("1")),
.init(title: "nugmanoff",thumbnaile: Image("1")),
.init(title: "nugmanoff",thumbnaile: Image("1")),
.init(title: "nugmanoff",thumbnaile: Image("1")),
.init(title: "nugmanoff",thumbnaile: Image("1")),
.init(title: "nugmanoff",thumbnaile: Image("1")),]
