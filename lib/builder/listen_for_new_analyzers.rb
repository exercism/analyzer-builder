module Builder
  class ListenForNewAnalyzers
    include Mandate

    def call
      client.listen(:analyzer_ready_to_build) do |message|
        track_slug = message[:track_slug]
        tag = message[:tag]
        p "Build analyzer for #{track_slug} for tag##{tag}"
      end
    end

    private
    def client
      @client ||= Propono.configure_client
    end
  end
end
