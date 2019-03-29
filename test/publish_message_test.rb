require 'test_helper'

module Builder
  class PublishMessageTest < Minitest::Test

    def test_publishes_to_propono
      topic = mock
      data = mock

      client = mock
      client.expects(:publish).with(topic, data, async: false)
      Propono.expects(:configure_client).returns(client)

      PublishMessage.(topic, data)
    end
  end
end
