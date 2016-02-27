require 'open-uri'
require 'json'

class Series < ActiveRecord::Base
  has_many :issues
  AUTH_KEY = "66be3651c789717274dfcfe7ce6b4b32"

  def self.get_marvel_data(series_id)
    url = "http://gateway.marvel.com:80/v1/public/series/#{series_id}?apikey=#{AUTH_KEY}"
    referer = "localhost"
    options = {"Referer" => referer}
    file = open(url, options)
    JSON.parse(file.read)["data"]["results"][0]
  end

  def get_issues
    url = "http://gateway.marvel.com:80/v1/public/series/#{series_id}/comics?formatType=comic&noVariants=true&orderBy=onsaleDate&limit=100&apikey=#{AUTH_KEY}"
    referer = "localhost"
    options = {"Referer" => referer}
    file = open(url, options)
    JSON.parse(file.read)["data"]["results"]
  end

  def build_issue(issue_data)
    self.issues << Issue.create(title: issue_data["title"], issue_number: issue_data["issueNumber"], url: issue_data["urls"][0]["url"], on_sale_date: issue_data["dates"][0]["date"], thumbnail: ("#{issue_data['thumbnail']['path']}.#{issue_data['thumbnail']['extension']}"))
  end

end