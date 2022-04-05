module TubekitRb::Actions
  class Result
    attr_accessor :tubekit

    def initialize(tubekit)
      self.tubekit = tubekit
    end

    def call
      loop do
        if tubekit.find("#ajax_process", visible: true).text == 'Finish'
          self.tubekit.url = tubekit.find("#video_player").find("center").find(:xpath, ".//div/a[1]")['href']
          break
        end
      end
    end
  end
end
