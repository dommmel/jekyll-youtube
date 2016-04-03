require "jekyll"
require "jekyll-youtube/version"
class YouTubeEmbed < Liquid::Tag

  def initialize(tagName, content, tokens)
    super
    @content = content
  end

  def render(context)
    youtube_url = "#{context[@content.strip]}"
    if youtube_url[/youtu\.be\/([^\?]*)/]
      @youtube_id = $1
    else
      # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      @youtube_id = $5
    end
    
    tmpl_path = File.join Dir.pwd, "_includes", "youtube.html"
    if File.exist?(tmpl_path)
      tmpl = File.read tmpl_path
      site = context.registers[:site]
      tmpl = (Liquid::Template.parse tmpl).render site.site_payload.merge!({"youtube_id" => @youtube_id})
    else
      %Q{<style>.embed-container { position: relative; padding-bottom: 56.25%; height: 0; overflow: hidden; max-width: 100%; } .embed-container iframe, .embed-container object, .embed-container embed { position: absolute; top: 0; left: 0; width: 100%; height: 100%; }</style><div class='embed-container'>    <iframe title="YouTube video player" width="640" height="390" src="//www.youtube.com/embed/#{ @youtube_id }" frameborder="0" allowfullscreen></iframe></div>}
    end
  end

  Liquid::Template.register_tag "youtube", self
end