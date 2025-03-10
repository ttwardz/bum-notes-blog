---
layout: post
title: A Shortcut That Generates Inline CSS for Gradient Text Colors
description: Generate the inline CSS for a gradient text color that you can use in any text editor that supports it.
author: Tommy Twardzik
tags: shortcuts, writing, programming
date: 2024-02-27 12:00
---


Sometimes, you want text to stand out more than the standard bold or even highlight styles. Make it fun with gradients!

If you use a Markdown editor like <a href="https://obsidian.md/" target="_blank" rel="noopener noreferrer">Obsidian</a> or <a href="https://apps.apple.com/app/ia-writer/id775737590" target="_blank" rel="noopener noreferrer">iA Writer</a>, you can see rendered HTML and CSS in the app's preview (and, in the case of Obsidian, the editor's Live Preview mode). That means you can supplement the standard Markdown formatting (**bold**, _italic_, etc.) with <span style="background: linear-gradient(to left, #ffb000 0%, #dd4c4f 100%); -webkit-background-clip: text; -webkit-text-fill-color: transparent; display: inline-block"><strong>colorful gradient text</strong></span>. (It pops even more in dark mode.)

To do this easily in Obsidian, I created a shortcut for iOS and Mac that uses  (from the third-party [Actions app](https://apps.apple.com/app/actions/id1586435171)) to generate two random colors and fill them in to the appropriate `<span>` element. It also automatically uses `<strong>` tags to make the gradient bold—all the better to enjoy it.

<span style="background: linear-gradient(to right, #8943a5 0%, #e80b51 100%); -webkit-background-clip: text; -webkit-text-fill-color: transparent; display: inline-block"><strong>Download the shortcut here:</strong></span> [Generate Inline CSS for Gradient Text - Shortcuts](https://www.icloud.com/shortcuts/05f59db2df334803ac598a7ef47e078a) 

***

You can tweak this shortcut for your own needs.

- For example, I include the Replace Text action to remove the placeholder text when using the <a href="https://github.com/macstories/obsidian-shortcut-launcher" target="_blank" rel="noopener noreferrer">Shortcut Launcher plugin</a> (Direct install link: <a href="obsidian://show-plugin?id=obsidian-shortcut-launcher">Obsidian</a>) without providing any text input. It doesn't affect the shortcut if you're not using Obsidian or that plugin, but you can remove it if you'd like.

Some ideas I have that I'll try if I find the time:

- Allow a choice of initial colors instead of always generating random ones (would require another third-party app to provide the necessary action).
- Allow selection from multiple color options at once instead of requiring you to re-run the shortcut for a new combo.
- Allow you to flip the gradient direction without changing the colors.

<br>
<strong>If you build on this shortcut to make it even better, let me know on <a href="https://mstdn.social/@ttwardz" target="_blank" rel="noopener noreferrer">Mastodon</a> or <a href="https://twitter.com/ttwardz" target="_blank" rel="noopener noreferrer">Twitter</a>!</strong>

<br>
<br>
<br>
📱
