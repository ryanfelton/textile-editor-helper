$:.unshift(File.dirname(__FILE__) + '/../lib')

require 'yaml'
require 'test/unit'
require 'rubygems'
require 'action_controller'
require 'breakpoint'
require 'action_controller/test_process'
require 'action_view'
require 'active_support'
# Show backtraces for deprecated behavior for quicker cleanup.
#ActiveSupport::Deprecation.debug = true

ActionController::Base.logger = nil
ActionController::Base.ignore_missing_templates = false
ActionController::Routing::Routes.reload rescue nil