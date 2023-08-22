# frozen_string_literal: true

task :slow_server do
  system(*%w[rackup -E production -s falcon -p 4000 slow.ru])
end

task :polling_proxy do
  system(*%w[rackup -E production -s falcon -p 3000 polling_proxy.ru])
end
