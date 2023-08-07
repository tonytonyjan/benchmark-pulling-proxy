# frozen_string_literal: true

task :slow_server do
  system(*%w[rackup -E production -s falcon -p 4000 slow.ru])
end

task :pulling_proxy do
  system(*%w[rackup -E production -s falcon -p 3000 pulling_proxy.ru])
end
