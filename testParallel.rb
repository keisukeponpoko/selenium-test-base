require "selenium-webdriver"
require 'parallel'

urls = [
  'https://github.com',
  'https://hub.docker.com',
  'https://bitbucket.org',
]

Parallel.each_with_index(urls, in_threads: 3) do |url, index|
  puts 'hi'
  driver = Selenium::WebDriver.for :remote, url: 'http://localhost:4444/wd/hub', :desired_capabilities => :firefox
  driver.navigate.to url
  puts driver.title
  sleep(5)
  puts driver.title
  driver.save_screenshot "screenshot#{index}.png"
end
