#encoding: utf-8
require 'open-uri'
require 'json'

content = open("http://weather.livedoor.com/forecast/webservice/json/v1?city=140020").read
json_data = JSON.parse(content)
today = json_data["forecasts"][0]
tomorrow = json_data["forecasts"][1]

puts "\n小田原の天気"
puts "今日(#{today["date"]})：#{today["telop"]}"
puts "明日(#{tomorrow["date"]})：#{tomorrow["telop"]}"

if today["temperature"]["min"] == nil
  today_min = "--"
else
  today_min = today["temperature"]["min"]["celsius"]
end

puts "\n今日の最高気温：#{today["temperature"]["max"]["celsius"]}℃"
puts "今日の最低気温：#{today_min}℃"

puts "\n明日の最高気温：#{tomorrow["temperature"]["max"]["celsius"]}℃"
puts "明日の最低気温：#{tomorrow["temperature"]["min"]["celsius"]}℃"

