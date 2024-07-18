require 'net/http'

params = {
  token: ENV.fetch('API_TOKEN', nil),
  room_id: ENV.fetch('ROOM_ID', nil),
  user_ids: ENV.fetch('USER_IDS', nil),
  body: ENV.fetch('BODY', nil).delete_prefix('"').delete_suffix('"')
}

uri = URI.parse("https://api.chatwork.com/v2/rooms/#{params[:room_id]}/tasks")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

body = "body=#{params[:body]}&to_ids=#{params[:user_ids]}"
headers = { 'X-ChatWorkToken' => params[:token].to_s }

response = http.post(uri.path, body, headers)

if response.code == '200'
  puts response.body
else
  raise StandardError, "action failed! #{response.body}"
end
