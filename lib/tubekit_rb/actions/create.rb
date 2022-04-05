module TubekitRb::Actions
  class Create

    attr_accessor :tubekit

    def initialize(tubekit)
      self.tubekit = tubekit
    end

    def call
      id = Time.now.to_i
      tubekit.visit("https://www.tubekit.win/r2f6j5i576q5a634m676z50626t5")
      tubekit.fill_in('txt_name', with: id)
      tubekit.click_on('submit')
    end
  end
end
