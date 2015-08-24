# Jekyll Youtube

This Jekyll pluging provides a tag that takes a Youtube URL and generates a (responsive) html snippet to embed the video into your site.

## Installation

Add this line to your Gemfile:

```ruby
group :jekyll_plugins do
  gem "jekyll-youtube"
end
```

And then execute:

    $ bundle

Alternatively install the gem yourself as:

    $ gem install jekyll-youtube

and put this in your ``_config.yml`` 

```yaml
gems: [jekyll-youtube]
 # This will require each of these gems automatically.
```

## Usage

```
 {% youtube "https://www.youtube.com/watch?v=ho8-vK0L1_8" %}
```
or using variables/front matter

```
{% youtube page.youtubeurl %}
```

## Result

By default the plugin will output the following code


```markup
<style>.embed-container { position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; } .embed-container iframe, .embed-container object, .embed-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }</style><div class='embed-container'>    <iframe title="YouTube video player" width="640" height="390" src="http://www.youtube.com/embed/ho8-vK0L1_8" frameborder="0" allowfullscreen></iframe></div>
```

You can specify your own snippet by creating a partial ``_includes/youtube.html``. Inside that partial the Youtube ID is available as ``{{ youtube_id }}``.