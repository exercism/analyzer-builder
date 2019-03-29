module Builder
  class PublishMessage
    include Mandate

    attr_reader :topic, :data
    def initialize(topic, data)
      @topic = topic
      @data = data
    end

    def call
      client.publish(topic, data, async: false)
    end

    private
    def client
      @client ||= Propono.configure_client
    end
  end
end
