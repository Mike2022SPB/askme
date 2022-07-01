module ApplicationHelper
  def inclination(count, one, many)
    return one if count == 1
    return many
  end
end
