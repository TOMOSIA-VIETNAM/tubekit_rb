module TubekitRb::Actions
  class Convert

    attr_accessor :tubekit

    def initialize(tubekit)
      self.tubekit = tubekit
    end

    def call(text, voice)
      tubekit.fill_in('post_text', with: text)
      tubekit.select(voice, from: 'voice_option')
      tubekit.find('.build_speech').click

      sleep 0.5
      tubekit.find(".jconfirm-buttons").find('.btn-info', visible: true).click
    end
  end
end
