require "selenium-webdriver"

@driver = Selenium::WebDriver.for :remote, :url => "http://localhost:4444/wd/hub", :desired_capabilities => :chrome

@driver.navigate.to "http://knowledge.sakura.ad.jp/"

sleep(10)

puts @driver.title

puts @driver.current_url

@driver.save_screenshot('./chrome.png')

@driver.quit
