require 'test_helper'

module Builder
  class BuildContainerTest < Minitest::Test

    def test_calls_system_with_the_correct_params
      track_slug = "ruby"
      tag = "v.1.2.3"

      Kernel.expects(:system).with(%Q{echo "Build analyzer for #{track_slug} for tag##{tag}"})

      Builder::BuildContainer.(track_slug, tag)
    end
  end
end
