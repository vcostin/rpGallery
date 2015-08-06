module MediaHelper

  def link_with_image(model_with_image, link_options: {class: ["th", "[radius]"]})
    link_to model_with_image.attachment.url, link_options do
      image_tag model_with_image.attachment.thumb.url
    end
  end

  def iterable?(object)
    object.is_a? Enumerable
  end


  def li_wrapper(string_to_wrap)
    content_tag :li do
      string_to_wrap
    end
  end


  def build_image_gallery(gallery_elements)
    content_tag :ul, class: "clearing-thumbs", data: {clearing: ""} do
      if iterable? gallery_elements
        gallery_elements.each do |gallery_element|
          li_wrapper link_with_image gallery_element
        end
      else
        li_wrapper link_with_image gallery_elements
      end
    end
  end

end
