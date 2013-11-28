module ApplicationHelper

  def show_image(image, size = "", text = "")

    size = "155x110" if size.blank?

    text = "Indispon%C3%ADvel" if text.blank?

    url = (image.present?)? image.url : "http://placehold.it/#{size}&text=#{text}"

    return image_tag(url, :alt => text, :title => text, :size => size)
  end

  def browser_info
    %Q{
    <input type="hidden" name="cookie_enabled" id="cookie_enabled" />
    <input type="hidden" name="resolution" id="resolution" />
    <input type="hidden" name="available_size" id="available_size" />
    <input type="hidden" name="color_depth" id="color_depth" />
    <input type="hidden" name="flash_version" id="flash_version" />
    }.html_safe
  end
end
