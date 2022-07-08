function compareTables(x, y)
  if x == y then
    return true
  elseif x == nil or y == nil then
    return false
  else
    for i in ipairs(x) do
      if x[i] ~= y[i] then
        return false
      end
    end
    return true
  end
end

function length(x)
  local l = 0
  for i in pairs(x) do
    l = l + 1
  end
  return l
end
