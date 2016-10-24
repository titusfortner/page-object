require 'selenium/webdriver/remote/http/persistent'

module PageObject
  module PersistantBrowser
    @@browser = nil
    def self.get_browser
      caps = Selenium::WebDriver::Remote::Capabilities.chrome(chrome_options: {'binary' => ENV['CHROME_BINARY']})
      @@browser ||= Watir::Browser.new :chrome, desired_capabilities: caps
    end
    
    def self.quit
      @@browser.quit
    end

    private

    def self.is_remote?(target)
      not target.include? 'local'
    end

    def self.watir_browser(target)
      if is_remote?(target)
        Watir::Browser.new(:remote,
                           :http_client => client,
                           :url => url,
                           :desired_capabilities => desired_capabilities)
      else
        browser = target.gsub('local_', '').to_sym
        Watir::Browser.new browser, :http_client => client
      end
    end

    def self.selenium_browser(target)
      if is_remote?(target)
        Selenium::WebDriver.for(:remote,
                                :http_client => client,
                                :url => url,
                                :desired_capabilities => desired_capabilities)
      else
        browser = target.gsub('local_', '').to_sym
        Selenium::WebDriver.for browser, :http_client => client
      end
    end

    def self.client
      Selenium::WebDriver::Remote::Http::Persistent.new
    end

    def self.capabilities(browser, version, platform, name)
      caps = Selenium::WebDriver::Remote::Capabilities.send browser
      caps.version = version
      caps.platform = platform
      caps[:name] = name
      caps
    end

    def self.url
      "http://pageobject:18002ee8-963b-472e-9425-2baf0a2b6d95@ondemand.saucelabs.com:80/wd/hub"
    end
  end
end
