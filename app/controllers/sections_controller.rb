class SectionsController < ApplicationController
  
  layout "admin"
  before_action :cofirm_logged_in
  before_action :find_page
  def index
    if @page
      @sections = @page.sections.sorted 
    else
      @sections = Section.sorted
    end 
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new({:name => "Default"})
    @sections_count = Section.count + 1
    @pages = Page.all
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section created successfully."
      redirect_to(:action => 'index', :page_id => @page.id)
    else
      @sections_count = Section.count
      @pages = Page.all
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
    @sections_count = Section.count
    @pages = Page.all
  end

  def update
    @section = Section.find(params[:id])
    if @section.update(section_params)
      flash[:notice] = "Section updated successfully."
      redirect_to(:action => 'show', :id => @section.id,  :page_id => @page.id)
    else
      @sections_count = Section.count
      @pages = Page.all
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id]).destroy
    flash[:notice] = "Section destroyed successfully."
    redirect_to(:action => 'index',  :page_id => @page.id)
  end


  private

    def section_params
      params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
    end

    def find_page
      if params[:page_id]
        @page = Page.find(params[:page_id])
      end
    end

end
