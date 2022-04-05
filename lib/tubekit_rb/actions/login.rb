module TubekitRb::Actions
  class Login
    attr_accessor :tubekit

    def initialize(tubekit)
      self.tubekit = tubekit
    end

    def call
      tubekit.visit("https://www.tubekit.win/login.html")

      tubekit.fill_in('username', with: self.tubekit.username)
      tubekit.fill_in('password', with: self.tubekit.password)
      tubekit.find('.icheckbox_square-blue').click
      tubekit.click_on('Login')
    end
  end
end
