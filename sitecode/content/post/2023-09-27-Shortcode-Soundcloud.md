---
title: Hugo Shortcode
subtitle: Hugo Shortcode for Soundcloud
date: 2023-09-27
tags: [ "website", "site update", "hugo", "shortcode", "webdev", "fullstack" ]
---

I recently had the need to embed an iframe into a hugo page.  this isn't an ideal thing to do since hugo uses markdown for definigin the contents of the page.  Hugo does however have a nice feature called 'shortcode'.  It's basically an html partial that can be used in markdown.

I needed to embed Soundcloud playlists into at least one page on this site.  I am also using this site as the framework to convert [tech-noid.net](https://tech-noid.net/) and [emotionalsupportpizza.com](https://emotionalsupportpizza.com/) to [hugo](https://gohugo.io/) and the [JAMStack](https://en.wikipedia.org/wiki/Jamstack) architecture.


### create shortcode
You will need to create a shortcode file in the proper location:
    layouts/shortcodes/soundcloud.html
{{< highlight html >}}
<div class="embed soundcloud-player">
    <iframe width="100%" height="450" scrolling="no" frameborder="no" allow="autoplay" 
    src="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/{{ index .Params 0 }}&color=%23c9622e&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true"></iframe>
</div>
{{</ highlight >}}

### use shortcode
To use this in your markdown for the page you will need to do the following:
{{< highlight md >}}
    {{</* soundcloud 1342914016 */>}} 
{{</ highlight >}}
'soundcloud' is the name for the shortcode and it takes in exactly 1 param at the moment.  This param is the playlist ID from soundcloud that you would like to embed into the post.  Example as shown will load the same interface that is one my [Music](htttps://mrcupp.com/page/music/) page.


Well, that is all for now.  Hope this helps in some way!