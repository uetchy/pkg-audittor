#!/usr/bin/env ruby

require 'json'
require 'pp'

if ARGV.size < 1
  puts "Usage: detect.rb pkg-path"
  exit
end

system %[/usr/sbin/installer -showChoicesXML -pkg #{ARGV.first} -target / > /tmp/pkginfo]
system %[/usr/bin/plutil -convert json /tmp/pkginfo]

json = JSON.parse(open('/tmp/pkginfo').read)
pp json[0]['childItems']
