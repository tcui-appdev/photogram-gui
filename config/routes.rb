Rails.application.routes.draw do
  get("/", {:controller => "users", :action => "index"})  

  get("/users", {:controller => "users", :action => "index"})
  get("/users/:username", {:controller => "users", :action => "show"})

  get("/insert_user_record", ({:controller => "users", :action => "insert"}))
  get("/update_user/:user_id", ({:controller => "users", :action => "update"}))

  get("/photos", {:controller => "photos", :action => "index"})
  get("/photos/:photo_id", {:controller => "photos", :action => "show"})

  get("/delete_photo/:photo_id", {:controller => "photos", :action => "delete"})
  get("/insert_photo", {:controller => "photos", :action => "insert"})
  get("/update_photo/:photo_id", {:controller => "photos", :action => "update"})
  get("/insert_comment", {:controller => "photos", :action => "insert_comment"})

end
