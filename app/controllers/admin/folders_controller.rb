class Admin::FoldersController < ApplicationController
  def new
    @folder = Folder.new
    authorize([:admin, @folder])
  end

  def create
    @folder = Folder.new(folder_params)
    authorize([:admin, @folder])
    if @folder.save
      redirect_to documents_path
    else
      render :new
    end
  end

  private

  def folder_params
    params.require(:folder).permit(:name)
  end
end
