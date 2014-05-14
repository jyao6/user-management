module Umanage
  class Engine < ::Rails::Engine
    isolate_namespace Umanage
    # config.to_prepare do
    #   ApplicationController.helper(Umanage::SessionsHelper)
    # end
  end
end
