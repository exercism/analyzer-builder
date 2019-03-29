require "mandate"
require "propono"

require "ext/propono"
require "builder/build_container"
require "builder/listen_for_new_analyzers"
require "builder/publish_message"

module Builder
  def self.listen
    ListenForNewAnalyzers.()
  end
end
