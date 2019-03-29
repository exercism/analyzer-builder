module Builder
  class BuildContainer
    include Mandate

    initialize_with :track_slug, :tag

    def call
      Kernel.system(%Q{echo "Build analyzer for #{track_slug} for tag##{tag}"})
    end
  end
end
