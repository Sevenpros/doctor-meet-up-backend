class ApplicationController < ActionController::API
    include JsonapiErrorsHandler

    rescue_from ::StandardError, with: lambda { |e| handle_error(e) }
end
