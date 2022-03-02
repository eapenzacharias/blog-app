# frozen_string_literal: true

# List and display user
class UsersController < ApplicationController
  def index; end

  def show
    @id = params[:id]
  end
end
