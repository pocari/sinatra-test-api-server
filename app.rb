require 'sinatra'
require 'json'

class Sinatra::Application
  def http_headers
    request.env.select { |k, v|
      k.start_with?('HTTP_')
    }.map { |k, v|
      [k, v]
    }.to_h
  end
end

get '*' do
  puts "--------------------------------------"
  p [:get]
  p params
  p http_headers

  request.params.to_json
end

post '*' do
  puts "--------------------------------------"
  p [:post]
  p params
  p http_headers

  request.params.to_json
end
