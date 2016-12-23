# frozen_string_literal: true

# Represents overall group information for JSON API output
class WorldCalsRepresenter < Roar::Decorator
  include Roar::JSON

  property :worldcals
end
