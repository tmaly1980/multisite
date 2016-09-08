module Multisite
  class MultisiteController < ApplicationController
    protect_from_forgery with: :exception
  end
end
