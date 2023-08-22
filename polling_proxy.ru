# frozen_string_literal: true

require 'async'
require 'rack/common_logger'
require 'rack/request'
require 'net/http'
require 'json'
use Rack::CommonLogger

class App
  URI = URI.parse(ENV.fetch('SLOW_SERVER_URL'))
  HEADERS = { 'Content-Type' => 'application/json' }.freeze

  def initialize
    @task_store = {}
  end

  def call(env)
    request = Rack::Request.new(env)
    id = request.params['task_id']
    return [400, {}, []] unless id.is_a?(String)

    unless @task_store.key?(id)
      @task_store[id] = { state: 'pending' }
      Async do
        result = Net::HTTP.get(URI)
        @task_store[id][:state] = 'done'
        @task_store[id][:result] = result
      end
    end
    [200, HEADERS, [JSON.dump(@task_store[id])]]
  end
end

run App.new
