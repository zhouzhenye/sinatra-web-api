require 'sinatra'
require 'json'

get '/show' do
  diary = {
      id: 1,
      title: "今日の日記",
      content: "きょうは雨でした。"
  }

  diary.to_json
end

post '/edit' do
  body = request.body.read

  if body == ''
    status 400
  else
    body.to_json
  end
end
