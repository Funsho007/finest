class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update]

  def show
    @contact = Contact.new
  end

  def show
    @contact = Contact.new if @page&.permalink == 'contact'
    if @page
      render :show
    else
      render :not_found
    end
  end

  def edit
    if @page
      render :edit
    else
      render :not_found
    end
  end

  def update
    if @page.update(page_params)
      redirect_to page_path(@page.permalink), notice: 'Page was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_page
    @page = Page.find_by(permalink: params[:permalink])
  end

  def page_params
    params.require(:page).permit(:title, :content, :permalink)
  end
end
