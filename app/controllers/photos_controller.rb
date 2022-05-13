class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({:created_at => :desc})
    render({:template => "photo_templates/index.html.erb"})
  end

  def show
    url_id = params.fetch("photo_id")
    matching_photos = Photo.where({:id => url_id})
    @the_photo = matching_photos[0]
    render({:template => "photo_templates/show.html.erb"})
  end

  def delete
    url_id = params.fetch("photo_id")
    matching_photos = Photo.where({:id => url_id})
    the_photo = matching_photos[0]

    the_photo.destroy
    redirect_to("/photos")
  end

  def insert
    new_photo = Photo.new
    new_photo.image = params.fetch("input_image")
    new_photo.caption = params.fetch("input_caption")
    new_photo.owner_id = params.fetch("input_owner_id")

    new_photo.save
    redirect_to("/photos/" + new_photo.id.to_s)
  end

  def update
    the_id = params.fetch("photo_id")
    matching_photos = Photo.where({:id => the_id})
    the_photo = matching_photos[0]

    the_photo.image = params.fetch("input_image")
    the_photo.caption = params.fetch("input_caption")

    the_photo.save
    redirect_to("/photos/" + the_photo.id.to_s)
  end

  def insert_comment
    the_id = params.fetch("input_photo_id")
    new_comment = Comment.new
    new_comment.body = params.fetch("input_body")
    new_comment.author_id = params.fetch("input_author_id")
    new_comment.photo_id = params.fetch("input_photo_id")

    new_comment.save
    redirect_to("/photos/" + the_id.to_s)
  end
end
