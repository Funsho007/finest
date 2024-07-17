class StaticPagesController < ApplicationController
  def show
    @static_page = StaticPage.find_by(title: params[:title])
    if @static_page.nil?
      render file: 'public/404', format: :html, status: :not_found
    end
  end
end
