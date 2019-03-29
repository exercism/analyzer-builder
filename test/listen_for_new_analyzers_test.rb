require 'test_helper'

module Builder
  class BuildContainerTest < Minitest::Test

    def test_proxies_message_correctly
      track_slug = "python"
      tag = "v8.3.2"
      message = {track_slug: track_slug, tag: tag}
      propono_client = mock
      propono_client.expects(:listen).with(:analyzer_ready_to_build).yields(message)
      Propono.expects(:configure_client).returns(propono_client)

      BuildContainer.expects(:call).with(track_slug, tag)
      Builder::ListenForNewAnalyzers.()
    end
  end
end
