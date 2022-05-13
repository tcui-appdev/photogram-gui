class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb" })
  end

  def show
    url_username = params.fetch("username")
    matching_usernames = User.where({ :username => url_username })
    @the_user = matching_usernames[0]

    #if the_user == nil
    #  redirect_to("/")
    #else
      render({ :template => "user_templates/show.html.erb" })
    #end
  end

  def insert
    new_user = User.new
    new_user.username = params.fetch("input_username")
    new_user.save
    redirect_to("/users/" + new_user.username)
  end

  def update
    the_id = params.fetch("user_id")
    the_user = User.where({:id => the_id})[0]
    the_user.username = params.fetch("input_username")
    the_user.save
    redirect_to("/users/" + the_user.username)
  end
end
