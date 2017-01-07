module Unidom
  module Product

    class Engine < ::Rails::Engine

      include Unidom::Common::EngineExtension

      isolate_namespace ::Unidom::Product

      enable_initializer enum_enabled: true, migration_enabled: true

    end

  end
end
