require 'open-uri'
require 'json'

class Series < ActiveRecord::Base
  has_many :issues
  AUTH_KEY = ENV["MARVEL_API_KEY"]

  def self.get_marvel_data(series_id)
    public_key = "66be3651c789717274dfcfe7ce6b4b32"
    ts = Time.now.to_i
    md5hash = Digest::MD5.hexdigest("#{ts.to_s}#{AUTH_KEY}#{public_key}")
    url = "http://gateway.marvel.com:80/v1/public/series/#{series_id}?ts=#{ts}&apikey=#{public_key}&hash=#{md5hash}"
    referer = "localhost"
    options = {"Referer" => referer}
    file = open(url, options)
    JSON.parse(file.read)["data"]["results"][0]
  end

  def self.browse_series
    public_key = "66be3651c789717274dfcfe7ce6b4b32"
    ts = Time.now.to_i
    md5hash = Digest::MD5.hexdigest("#{ts.to_s}#{AUTH_KEY}#{public_key}")
    url = "http://gateway.marvel.com:80/v1/public/series/#{series_id}?ts=#{ts}&apikey=#{public_key}&hash=#{md5hash}"
    referer = "localhost"
    options = {"Referer" => referer}
    file = open(url, options)
    JSON.parse(file.read)["data"]["results"]

  end

  def get_issues
    public_key = "66be3651c789717274dfcfe7ce6b4b32"
    ts = Time.now.to_i
    md5hash = Digest::MD5.hexdigest("#{ts.to_s}#{AUTH_KEY}#{public_key}")
    url = "http://gateway.marvel.com:80/v1/public/series/#{series_id}?ts=#{ts}&apikey=#{public_key}&hash=#{md5hash}"
    referer = "localhost"
    options = {"Referer" => referer}
    file = open(url, options)
    JSON.parse(file.read)["data"]["results"]
  end

  def build_issue(issue_data)
    self.issues << Issue.create(title: issue_data["title"], issue_number: issue_data["issueNumber"], url: issue_data["urls"][0]["url"], thumbnail: ("#{issue_data['thumbnail']['path']}.#{issue_data['thumbnail']['extension']}"))
  end

end