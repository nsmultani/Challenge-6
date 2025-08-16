#!/usr/bin/env ruby
require_relative 'config/environment'

require 'puma'

app = Rails.application

server = Puma::Server.new(app)
server.add_tcp_listener('127.0.0.1', 3000)
server.min_threads = 3
server.max_threads = 3

puts "Starting server on http://127.0.0.1:3000"
server.run