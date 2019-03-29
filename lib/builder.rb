require "mandate"
require "propono"

require "ext/propono"
require "builder/publish_message"
require "builder/listen_for_new_analyzers"

module Builder
  def self.listen
    ListenForNewAnalyzers.()
  end
end
