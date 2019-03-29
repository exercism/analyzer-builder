require 'test_helper'

module Builder
  class BuildAnalyzerTest < Minitest::Test

    def test_calls_system_and_propono_with_the_correct_params_and
      track_slug = "ruby"
      tag = "v.1.2.3"

      Kernel.expects(:system).with(%Q{echo "Build analyzer for #{track_slug} for tag##{tag}"}).returns(true)
      PublishMessage.expects(:call).with(
        :analyzer_ready_to_deploy,
        image_name: "exercism-analyzer-#{track_slug}:#{tag}"
      )

      Builder::BuildAnalyzer.(track_slug, tag)
    end

    def test_does_not_publish_if_kernel_fails
      Kernel.expects(:system).returns(false)
      PublishMessage.expects(:call).never

      Builder::BuildAnalyzer.("foo", "v1.3.4")
    end
  end
end
