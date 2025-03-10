---
title: A More Readable Internet
author: Tommy Twardzik
tags: programming
date: 2019-12-09 12:00
---

<!-- description: My goal: make my site readable to anyone curious enough to inspect its source code—like the old days. Things have not turned out to be as simple as I'd hoped. -->

# A More Readable Internet

I built this website using words. I set a goal: make my site readable to the people who are curious enough to inspect its source code. I think I succeeded. But things have not turned out to be as simple as I'd hoped.

![HTML source code screenshot.](/assets/images/html-source-code-screenshot.JPG)

## The Complicated Web

One part of working in SEO is knowing how to analyze and repair the foundations of struggling websites. For a large e-commerce site with thousands of pages, that task can be as difficult as repairing the physical foundation of a sprawling brick-and-mortar supermarket. Bug fixes and style revisions and new initiatives cause rapid expansion—the kind that can leave wires tangled and cause problems later on when further expansion is required.

That on-the-fly expansion is hard to avoid. You can't anticipate everything when you begin writing your site. This, though, is the reason for the impenetrable wall of `<div>` tags and lines of CSS that often greets explorers who inspect the source of a webpage. That's not readable.

## My Goal

I wanted my website to be as readable as possible when a visitor presses ⌘ + alt + U in their browser. I wanted them to see a neatly organized, easily recognizable poem of `<h1>`, `<h2>`, `<p>` and `<img>` tags.

My goal was zero Javascript. Nothing but static HTML and CSS styling pulled from a separate, carefully organized file. (In this, I've succeeded.)

But I had to make the site responsive to screen size. So I added a couple of classes—`.desktop` and `.mobile` and sprinkled them all over the place. Though it worked, this off-the-cuff formatting quickly complicated my code. I decided to rebuild almost entirely, just a month after I'd set the site live.

A week and a half later, the site was rebuilt and beautifully organized. I felt clever and successful. I was ready to implement dark mode.

That, I discovered, is more difficult than simply duplicating every color property and adding a second version for `@media (prefers-color-scheme: dark)`. Or, rather, it is exactly that difficult. Because that process is more than tedious: it's convoluted and inefficient and messy.

It was time to suck up my pride and abandon my goal of writing a website that looked like it had been [built in 1999](https://web.archive.org/web/19991117024224/http://apple.com/).

I added CSS variables.

## Variables Are for Programmers

CSS variables are technically called [custom properties](https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_custom_properties). They work like this: you define a variable for a specific property. I used a few (shown below) to store dark and light versions of the colors in my theme.

```
     :root {
        --color-background-body: #f2f2f7;  
        --color-background-main: #ffffff;
        --color-text-default: #1c1c1e;
    }

    @media (prefers-color-scheme: dark) {
      :root {
        --color-background-body: #000000;
        --color-background-main: #1c1c1e;
        --color-text-default: #ffffff
      }
    }
```

I looked at what I'd done and felt… conflicted.

Would a regular (non-technical) visitor be happy to open my site's source code and see a list of variables? Would I, just a year ago, have understood what I was looking at?

Few. And not immediately.

But as far as I can tell, this is the simplest way of achieving the responsiveness that modern websites _must_ prioritize. In fact, variables are much more readable than a sheet specifying the full hex values for every element of the site. That turns a CSS file into a cascade of **#ff9500** and **rgb(155,220,255)**.

## A Little Learning or a Lot of Nonsense

CSS variables are not immediately readable for every person. But neither is HTML, in general. But upon closer inspection, you can get a general idea of what's happening with both. A custom property called `--color-text-default` is as semantically informative as an `<article>` or `<table>` tag.

Where a sheet of hex numbers reads like a coded message, a list of variables reads like a glossary of terms placed at the beginning of the text. It makes reading everything that follows easier.

Of course, CSS custom properties are not a solution to the problems faced by enormous websites. But the principles behind these variables—efficiency and organization—are important for sites of every size. Whether you're a small business whose website is maintained by one or two employees or an individual doing it yourself, CSS variables can make maintenance, revisions and expansions much easier.

## Nothing to Hide

You _can_ build a modern website with simple, semantic code. It's a great way to be more transparent to users and make the jobs of future developers (and you) easier.

It's up to web developers to write with care and discipline. Developers: be the poets of the web, efficient and strict with syntax. Be the woodworkers who proudly brand their initials on the well-built frame of an upholstered chair. Few will see them. But those who do pull back the fabric to reveal the wood beneath will appreciate your craftsmanship.
