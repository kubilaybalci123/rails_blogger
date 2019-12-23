
 has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
 <%= image_tag @article.image.url(:medium) %>
