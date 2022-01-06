class UsersController < ApplicationController
    @users = User.all
end
