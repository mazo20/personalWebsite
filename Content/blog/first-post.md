---
title: Build your resume website in Swift
date: 2020-02-15 21:00
description: Why bother sending a PDF with your resume or CV to your future employer when you can show off your skills by sending just a link? 100% JavaScript-free.
tags: Swift, Resume, CV
---

<img src="/images/10-02-20-CV_tutorial/headerImage.jpg" alt="The image with best homography" style="max-width:100%;margin-bottom: 3%;"/>

Attaching your resume to the application form in 2020 feels a little bit outdated. With all the resources that we have we are still stuck with the traditional format that is constrained by technology dating back to the 19th century - you still have to be able to print your CV, right? Unfortunately, it doesn’t seem like it’s about to change anytime soon. It doesn’t mean, however, that we shouldn’t try doing it the other way, the “10x programmer” way.

John Sundell, the hero of the Swift community have recently open-sourced his amazing trio – [Publish](https://github.com/JohnSundell/Publish), [Plot](https://github.com/JohnSundell/Plot) and [Ink](https://github.com/JohnSundell/Ink). These three libraries written 100% in Swift allow you to, you guessed it, write and deploy a website using Swift only. I have always wanted to have a personal website but always dreaded the idea of spending my time trying to learn the JavaScript + HTML combo for the sake of having a website; changed recently when I had to pick up some React Native skills but that’s a story for another time. With Publish you can have a website without writing any JavaScript or HTML. Only Swift sprinkled with a little bit of CSS. 

## How I did it
I started by going through the limited but constantly growing documentation. Trying to understand the process is the most important part of the development for me. I also found an [article](https://www.staskus.io/posts/2020-01-26-publish/) by *Povilas Staškus* with a public GitHub repository which helped me tremendously. Comparing these two resources helped me get my head around it and find the best approach.

<img src="/images/10-02-20-CV_tutorial/defaultProject.jpg" alt="Base project provided by Publish" style="max-width:90%; margin: 3% 5%;border: 1px solid #bfbfbf;"/>

Creating a new project with Publish gives you a basic framework that could be used out-of-the-box for a blog but will require some changes to show your resume.
Publish uses Plot to create the HTML code. The styling you see is provided to you with the `.foundation` theme which we can use and modify to our advantage.

```
struct ResumeWebsitePost: Website {
    ...
}

try ResumeWebsitePost().publish(withTheme: .foundation)
```

Command click on the `.foundation` to jump to its definition. There you can see that in order to create your own, new theme we need to create a new struct which implements the  `HTMLFactory` protocol. For the purpose of our website we are only going to need the `makeIndexHTML()` function.

```
private struct ResumeHTMLFactory<Site: Website>: HTMLFactory {
    func makeIndexHTML(for index: Index, context: PublishingContext<Site>) throws -> HTML {
        //We are only going to need this function
    }
    
    func makeSectionHTML(for section: Section<Site>, context: PublishingContext<Site>) throws -> HTML {}
    
    func makeItemHTML(for item: Item<Site>, context: PublishingContext<Site>) throws -> HTML {}
    
    func makePageHTML(for page: Page, context: PublishingContext<Site>) throws -> HTML {}
    
    func makeTagListHTML(for page: TagListPage, context: PublishingContext<Site>) throws -> HTML? {}
    
    func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<Site>) throws -> HTML? {}
}
```

Each theme has to conform to the `HTMLFactory` protocol but we are only going to need the `makeIndexHTML` function to build the main page. There you use normal HTML tags but with Swift syntax, so `<body></body>` is `.body()`, `<div></div>` is `.div()` etc. If you are not familiar with HTML a quick look at the implementation of `.foundation` will help you understand what goes where and why.

```
func makeIndexHTML(for index: Index,
                   context: PublishingContext<Site>) throws -> HTML {
    HTML(
        .lang(context.site.language),
        .head(for: index, on: context.site),
        .body(
            .header(for: context, selectedSection: nil),
            .wrapper(
                .contentBody(index.body)
            ),
            .footer(for: context.site)
        )
    )
}
```

Some basic tags are already built-in, like `.wrapper` or `.footer`. What we need for our CV is already provided for us in the form of `.contentBody(index.body)`. Without getting into details, our `makeIndexHTML` function provides us with the `index.md` file parsed by Ink. Therefore, now that we have our index page set up, all we have to do is add our resume to `Source/index.md`. A quick guide on what Markdown syntax does Ink support can be found [here](https://github.com/JohnSundell/Ink#markdown-syntax-supported).

<img src="/images/10-02-20-CV_tutorial/markdownFile.jpg" alt="Markdown file in Xcode" style="max-width:90%; margin: 3% 5%;border: 1px solid #bfbfbf;"/>

## Styling

As you could see, `.foundation` comes with pre-build CSS, which in my opinion looks really good. In order to add this to our project, you will have to copy the original file to the *Resources* folder. Everything in that folder gets copied to *Output* when you run your code. However, if you prefer to add your own CSS or use an existing package you can add it in `.head()` node.On my website I added *Pure CSS* and *Font Awesome* icons. 

## Deployment

Finally, we can test our website. Build your project and in terminal go to your source code and enter `publish run`. You can now see your website in your browser at *localhost:8000*. If everything goes well you can share your website with the rest of the world. Yes, you can have your own website and send a link to your friends! We can use GitHub Pages to host it completely free and thanks to Publish it takes just one line to deploy. To set up your GitHub Pages repository you can follow the first part of this [tutorial](https://pages.github.com).

Once you have created your repository simply add it to the publishing steps in `main.swift`.

```
try ResumeWebsitePost().publish(
    withTheme: .resume,
    additionalSteps: [
        .deploy(using: .gitHub("username/username.github.io"))
    ]
)
```

Now run  `publish deploy` in your terminal and *voilà*! You have deployed your website and everyone can now see your resume at *https://username.github.com*! The nice thing is that with little to no effort you can make your CV more interesting by adding links, images, and even CSS, which is impossible in a traditional resume.

<img src="/images/10-02-20-CV_tutorial/finalWebsite.jpg" alt="Base project provided by Publish" style="max-width:90%; margin: 3% 5%;border: 1px solid #bfbfbf;"/>

## Conclusion

If you have some experience in Swift and you've always wanted to create your own website but the idea of using JavaScript was putting you off, this is a project for you. It is by no means a revolutionary solution since you could always create the same page with just HTML and CSS but at least in my case, it made me try out new things which I would never do otherwise.

Special thanks to John Sundell who created Publish and thousands of [Swift articles](https://www.swiftbysundell.com) and [Povilas Staškus](https://www.staskus.io) for the GitHub repository of his website. If you are still wondering how I did find my code on [GitHub](https://github.com/mazo20/personalWebsite).

Lastly, if you find my [resume](/) interesting I will be happy to talk about it!


