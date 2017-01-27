class ArtistFinder
  include HTTParty

  base_uri "https://api.spotify.com/v1"

  attr_accessor :name, :info, :version, :authors, :downloads

  def initialize(name, id, external_url, genre, href)
    self.id = id
    self.external_url = external_url
    self.genre = genre
    self.href = href
    self.name = name
  end

  # Find a particular artist, based on its name
  def self.find(name)
    response_item = get("/search?type=artist&limit=50&q=#{name}")
    if response_item.success?
      response_item.to_h["artists"].map do |response|
        self.new(response["name"], response["id"], response["external_url"],
           response["genre"], response["href"])
      end
    else
      # this just raises the net/http response that was raised
      raise response.response
    end
  end
end