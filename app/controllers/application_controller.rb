class ApplicationController < ActionController::API
  include JsonapiErrorsHandler

  rescue_from ::StandardError, with: ->(e) { handle_error(e) }
end
