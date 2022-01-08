module ApplicationHelper
  def change_color_when_active(path)
    return 'nav-active-link ' if current_page?(path)

    nil
  end
end
