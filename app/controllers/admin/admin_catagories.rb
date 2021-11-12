class Admin::CategoriesController < ApplicationController
  @categories = Category.order(:name).all
end