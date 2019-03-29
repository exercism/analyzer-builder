module Builder
  class ListenForNewAnalyzers
    include Mandate

    def call
      client.listen(:analyzer_ready_to_build) do |message|
        track_slug = message[:track_slug]
        tag = message[:tag]

        Builder::BuildContainer.(track_slug, tag)
      end
    end

    private
    def client
      @client ||= Propono.configure_client
    end
  end
end
