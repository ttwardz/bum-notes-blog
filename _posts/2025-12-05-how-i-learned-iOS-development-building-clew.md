---
layout: post
date: 2025-12-05 12:00
title: How I Learned iOS Software Development by Building an App
description: On learning to code, building an iOS app, and turning software development from an experiment into a practice I love.
author: Tommy Twardzik
pinned: false
tags: [programming, technology, project]
---

I started Clew with no software development experience, and along the way, it's changed from a learning experiment to a project that I love working on.

More importantly, [Clew is an app I love using]({% post_url 2025-12-03-clew-i-built-an-iOS-app %}) every day.

For better or worse, this is an artisanal app. My approach isn't really scalable if your intention is commercial-first.

But I'm having a great time working on this, so I think it's for the better.

But back to the beginning.

## Learning to Code From the Ground Up

Because I was learning everything from scratch, I decided early on that I wanted to keep things as native as possible. So, I stuck to built-in iOS frameworks like SwiftUI and iCloud Drive.

For its basic structure and look, I took inspiration from the apps that come with your iPhone---Mail and Reminders and Calendar. They're function-forward, clean, and clear interfaces for entering text, adding metadata, and tracking information.[^design]

When I started, SwiftUI was still very new. (I suppose it still is very new, compared to other languages.) It lets you _describe_ what you want the system to do and display, which is a little different than some other programming languages.

At the very simplest, writing SwiftUI code looks something like this:

```swift
struct HighlightsListView: View {
    @FetchRequest(entity: Highlight.entity(), sortDescriptors: []) var highlights: FetchedResults<Highlight>

    var body: some View {
        List {
            ForEach(highlights, id: \.id) { highlight in
                NavigationLink(destination:
                    HighlightDetailView(highlight: highlight)
                ) {
                    VStack {
                        Text(highlight.text).bold()
                        Text(highlight.note)
                    }
                }
            }
        }.padding(.horizontal)
    }
}
```

That's an extremely simplified version of a generic view. It's the kind of code that tells the iPhone to show a view, which contains a list, which pulls in saved highlights from the user's database and displays each one in a vertical stack with the highlight text in bold on top and any note the user wrote below it.

Behind that, there's a _lot_ of code that's responsible for making sure there _is_ a database to save highlights to, that the app can read those saved items along with all their associated attributes, that the view can read and display each highlight's attributes in the list's rows, and that the user can tap on a list row to open up an entirely new view which shows the highlight's full details.

There's also much more that goes into making sure all of what I just described is fast, smooth, reliable, and aesthetically pleasing. That example view doesn't even include a function---it doesn't do anything other than show pre-loaded information and handle navigation from the list to the detail view.

But at a fundamental level, that's the gist of what writing a visual interface in SwiftUI looks like.

## A Beginner's Process for SwiftUI Development

I learned by doing. Every time I started working on a new button or view or function, I spent a lot of time reading how-to articles and watching YouTube videos.

I also bought a couple amazingly inexpensive (like, $20 on sale) courses on Udemy and Coursera that were valuable as a solid foundation at the beginning. I probably got through 30% of any of those courses before it became just too conceptual for my attention span, and I needed to start working on real examples in my app. And so, back to YouTube.

Here's what my process looked like:

1. _I want to let the user type text into a text box that they can save as a note that's attached to the highlight they've saved,_ I think.
2. Search the web: "How to make a text box in SwiftUI."
3. Find an article or YouTube video showing how to create a TextEditor (back then it was different, but today that's how it's done) in SwiftUI.
4. Put a TextEditor in my code and watch it be weird and (probably) not work exactly how I want it to work.
5. Do another web search: "How to change the default height of a TextEditor in SwiftUI."
6. Read another article or watch another video about changing the size and probably a dozen other characteristics of a SwiftUI TextBox (or, in many cases, find out that what I want is very difficult/nearly impossible without lots of custom, hacky code).
7. Try to implement the relevant parts of the article/video and see that it's still not doing quite what I want.
8. Also start seeing errors pop up because I've written something incorrectly or broken something else.
9. Search the web for how to fix these various errors and continue figuring out how to get the text box just right. (Remember that this is one text box in the notes section of one kind of detail view in the app.)
10. Later---many hours later---finally get the app to build successfully (with no errors) and test the text box and... it works!
11. Notice that the keyboard hides a lot of the view while the user is typing, and there's no way to hide the keyboard when they're done. Decide to add a button right above the keyboard to hide it.
12. Search the web: "How to add a button above the keyboard in SwiftUI"...

And so on...

This is what I've done for thousands of hours, now.

And what's fun is that, as I've become comfortable with these fundamentals, I've also moved on to much more complex ideas, like data model migrations, AI-powered tag suggestions, and comprehensive data backups.

Thus, the process has remained pretty much the same. It's incredibly frustrating and incredibly satisfying.

## Resources for Learning iOS Software Development

If you're interested in learning to build apps for iPhones, iPads, and Macs, these are some of my absolute favorite resources that I continue to go back to as I build new features:

1. [Hacking with Swift][hws]{:target="_blank"}
2. [Swift by Sundell][sundell]{:target="_blank"}
3. [Swift with Majid][majid]{:target="_blank"}
4. [Natalia Panferova at Nil Coalescing][nat]{:target="_blank"}
5. [Kilo Loco][kilo]{:target="_blank"}
6. [Sean Allen][sean]{:target="_blank"}
7. [CodeWithChris][chris]{:target="_blank"}

For higher level discussions about iOS app development, the recently concluded [Under the Radar podcast](https://www.relay.fm/radar){:target="_blank"} is incredible.

If you'd like to follow my development of Clew, check out the [Clew website](https://getclew.com/updates){:target="_blank"} for updates and the roadmap. 📱


[hws]: https://www.hackingwithswift.com/
[sundell]: https://www.swiftbysundell.com/
[majid]: https://swiftwithmajid.com/
[nat]: https://nilcoalescing.com/blog/
[kilo]: https://www.youtube.com/@Kilo_Loco
[sean]: https://www.youtube.com/@seanallen
[chris]: https://www.youtube.com/@CodeWithChris

[^design]: I'm steadily adding more splashes of color, finding more opportunities for user customizations, and improving information density. I'm not a designer by trade, but I know what I like in an app.