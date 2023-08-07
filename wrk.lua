request = function()
  wrk.method = "POST"
  wrk.headers["Content-Type"] = "application/x-www-form-urlencoded"
  return wrk.format(nil, nil, nil, "task_id=" .. math.random(0, 255))
end
