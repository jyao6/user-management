module Umanage
  class Engine < ::Rails::Engine
    isolate_namespace Umanage

    # config.to_prepare do
    #   ActionController::Base.helper(Umanage::SessionsHelper)
    # end

  end
end
