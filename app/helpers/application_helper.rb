module ApplicationHelper
  def inclination(count, one, many)
    return one if count == 1
    return many
  end

  def current_user_header_color
    current_user&.header_color || "#370617"
  end
end
