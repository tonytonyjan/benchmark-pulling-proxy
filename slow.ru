# frozen_string_literal: true

require 'rack/common_logger'
use Rack::CommonLogger
run lambda { |*|
  sleep(20)
  [200, {}, ['ok']]
}
