require 'net/http'

params = { 
  token: ENV['API_TOKEN'],
  room_id: ENV['ROOM_ID'],
  user_ids: ENV['USER_IDS']
  body: ENV['BODY'].delete_prefix('"').delete_suffix('"'),
}

uri = URI.parse("https://api.chatwork.com/v2/rooms/#{params[:room_id]}/tasks")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

body = "body=#{params[:body]}&to_ids=#{params[:user_ids]}"
headers = { "X-ChatWorkToken" => "#{params[:token]}" }

response = http.post(uri.path, body, headers)

if response.code == '200'
  puts response.body
else
  raise StandardError.new("action failed! #{response.body}")
end
