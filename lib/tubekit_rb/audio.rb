# frozen_string_literal: true
require 'capybara'
require 'selenium-webdriver'
require 'capybara/dsl'
require 'tubekit_rb/actions/login'
require 'tubekit_rb/actions/create'
require 'tubekit_rb/actions/convert'
require 'tubekit_rb/actions/result'

Capybara.run_server = false
Capybara.current_driver = :selenium_chrome

module TubekitRb
  class Audio
    include Capybara::DSL

    attr_accessor :username, :password, :url

    def initialize(username, password)
      self.username = username
      self.password = password
    end

    def convert(text, voice)
      # Step 1 Login
      action = TubekitRb::Actions::Login.new(self)
      action.call

      # Step 2 Add new Audio
      action = TubekitRb::Actions::Create.new(self)
      action.call

      # Step 3 Convert
      action = TubekitRb::Actions::Convert.new(self)
      action.call(text, voice)

      # Step 3 Get url
      action = TubekitRb::Actions::Result.new(self)
      action.call

      Capybara.current_session.driver.quit
    rescue Exception => e
      Capybara.current_session.driver.quit
    end
  end
end
