---
title: Remove Ugly Media Bookmarklet for Mac
author: Tommy Twardzik
tags: [programming]
date: 2020-11-12 12:00
---

<!-- description: Use a little JavaScript to create a simple bookmarklet that removes unsightly or distracting media from webpages. -->

![A silver MacBook opening its lid with ambient purple light.](/assets/images/silver-macbook-opening-lid.jpg)
_Image: [Dmitry Chernyshov][dmitrychernyshov]_

I already wrote about [how to remove ugly media on iOS using Shortcuts][shortcuts-article]. There's another way to accomplish this that works on a Mac, too!

You just have to smush that JavaScript into a tiny DIY browser extension, called a **bookmarklet**.

Bookmarklets let you trigger a JavaScript function simply by clicking the item in your bookmarks list. Instead of opening a URL, the bookmarklet runs its code on the page.

Why opt for this alternative over Shortcuts? Until Shortcuts comes to the Mac (🤞) that solution is limited to iOS and iPadOS. And while Shortcuts takes a moment to animate its progress, the bookmarklet runs instantly.

Bonus: You can use this method right on iPhones and iPads, too!

## Configuring the Bookmarklet

It was fairly simple to reuse the JavaScript from [my Remove Media Shortcut][shortcut] for the bookmarklet but I needed to employ a few tricks to make it work.

These I learned by example, looking at another bookmarklet—**[View Page Source][source-bookmarklet]**—I've been using on my iPad for many months in lieu of the Mac's **Command + Option + U** inspector.

### The \`javascript:()` Wrapper

What's important is beginning the bookmarklet's JavaScript with `javascript:(()=>{` and ending it with the proper… ending: `})();`.

**This is the almost-ready code:**

```
javascript:(function(){
  var images=document.getElementsByTagName('img');
  for(i=0;i<images.length;i++){
      images[i].style.display = "none";};
  var vids=document.getElementsByTagName('video');
  for(i=0;i<vids.length;i++){
    vids[i].style.display = "none";};
    completion(true)
})();
```

Looks good, but it needs one more tweak before it's ready…

### URL Encoding

Within those bookends you insert our JavaScript but the code has to be _URL encoded_. That means each whitespace is replaced with "**%20**", each "{" becomes "**%7B**", etc.

Don't do this by hand.

On an iPad, you can use **[this simple shortcut][encode-sc]** to URL-encode any text, including our JavaScript.

Once it's encoded, the browser will be able to open it like a URL. Instead of displaying a webpage, it'll run the code.

**This is the same JavaScript code as above but URL-encoded and ready to copy-and-paste into your bookmarklet:**

```
javascript:(function()%7Bvar%20images%3Ddocument.getElementsByTagName('img')%3Bfor(i%3D0%3Bi%3Cimages.length%3Bi%2B%2B)%7Bimages%5Bi%5D.style.display%20%3D%20%22none%22%3B%7D%3Bvar%20vids%3Ddocument.getElementsByTagName('video')%3Bfor(i%3D0%3Bi%3Cvids.length%3Bi%2B%2B)%7Bvids%5Bi%5D.style.display%20%3D%20%22none%22%3B%7D%3Bcompletion(true)%7D)();
```

## Creating the Bookmarklet

Creating a JavaScript bookmarklet requires the tiniest of workarounds but I'm not aware of any built-in way to do it.

**On macOS and iOS:**
1. Visit any web page and use the share sheet to "Add Bookmark".
2. Change the name to "Remove Media" or whatever you'd like.
3. Save the bookmark.

**On macOS:**
1. Open the bookmarks list, right click on your new bookmark and click "Edit Address…"
2. Replace the URL with the **URL-encoded JavaScript code** above (the ugly-looking version that's full of "%" marks).
3. Save the change.
4. On a web page with an image or video, open bookmarks and click your new bookmarklet. The media should instantly disappear.

**On iOS:**
1. Open bookmarks, long-press on your new bookmark and tap **Edit**.
2. Replace the URL with the *URL-encoded* JavaScript code above.
3. Navigate back to the list and tap your new bookmarklet to run it on the current web page.

Your bookmarklet is ready to go!


[source-bookmarklet]: https://ole.michelsen.dk/blog/view-source-on-the-ipad-and-iphone/
[encode-sc]: https://www.icloud.com/shortcuts/f3e148e6274147d59c355adf68445e7a
[shortcuts-article]: /blog/remove-media-shortcut
[shortcut]: https://www.icloud.com/shortcuts/c68e71a5ccf74cf589859630904bd2b8
[dmitrychernyshov]: https://unsplash.com/@oneor0
