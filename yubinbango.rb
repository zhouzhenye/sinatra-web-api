require 'net/http'
require "json"
require 'uri'

#住所を返却する。郵便番号データAPIを取得する
def search_address(post_code)
  res = Net::HTTP.get(URI.parse("http://zipcloud.ibsnet.co.jp/api/search?zipcode=#{post_code}"))
  hash = JSON.parse(res)

#有効な郵便番号かどうかをする
  if hash["status"] == 200

    return hash["results"][0].values.take(3).join("")
  else

    return hash["message"]
  end
end

print "郵便番号を入力してください(例：1234567):"
post_code = gets.chomp


puts search_address(post_code)
