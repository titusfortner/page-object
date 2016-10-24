require 'rubygems'
require 'bundler'
require 'rspec/core/rake_task'
require 'cucumber'
require 'cucumber/rake/task'
require 'coveralls/rake/task'

Coveralls::RakeTask.new
Bundler::GemHelper.install_tasks

task :temp do
  require 'watir-webdriver'
  caps = Selenium::WebDriver::Remote::Capabilities.chrome(chrome_options: {'binary' => ENV['CHROME_BINARY']})
  browser ||= Watir::Browser.new :chrome, desired_capabilities: caps

  browser.goto 'google.com'
  browser.quit
end

namespace :features do
  Cucumber::Rake::Task.new(:watir_webdriver, "Run features with Watir") do |t|
    t.profile = "watir_webdriver"
  end

  Cucumber::Rake::Task.new(:selenium_webdriver, "Run features with Selenium") do |t|
    t.profile = "selenium_webdriver"
  end

  desc 'Run all features'
  task :all => [:watir_webdriver, :selenium_webdriver]
end

desc 'Run all specs and cukes'
task :test => ['spec', 'features:all']

task :lib do
  $LOAD_PATH.unshift(File.expand_path("lib", File.dirname(__FILE__)))
end

task :test_with_coveralls => [:test, 'coveralls:push']

task :default => :test_with_coveralls
