require 'open-uri'
require 'json'

series_to_add = [19750, 2258, 17113, 17602, 20622, 18468, 16410, 9311, 18457]
AUTH_KEY = ENV["MARVEL_API_KEY"]

def get_marvel_data(series_id)
    url = "http://gateway.marvel.com:80/v1/public/series/#{series_id}?apikey=#{AUTH_KEY}"
    referer = "localhost"
    options = {"Referer" => referer}
    file = open(url, options)
    JSON.parse(file.read)["data"]["results"][0]
end

series_to_add.each do |series_id|
  series_data = get_marvel_data(series_id)

  Series.create!(title: series_data['title'], link: series_data['urls'][0]['url'], description: series_data['description'], num_issues: series_data['comics']['available'], series_id: series_id)
end

all_series = Series.all
all_series.each do |series|
  series.get_issues.each do |issue|
    series.build_issue(issue)
  end
end


User.create!(username: 'alana', password: 'password')
User.create!(username: 'dave', password: 'password')
User.create!(username: 'shomari', password: 'password')
User.create!(username: 'amy', password: 'password')
User.create!(username: 'verdell', password: 'password')
User.create!(username: 'sparky', password: 'password')




