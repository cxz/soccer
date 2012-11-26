class UploadController < ApplicationController
  def index

  end

  def form

  end

  def import

    importer = Importer.new(XmlReader.new(params[:uploaded_file].read))

    unless importer.import
      flash.now[:error] = "The file does not seem to be valid! Ignored."
      render "upload/form"
      return
    end

    flash.now[:notice] = "Team '#{importer.team.name}' imported with #{importer.seasons.size} seasons successfully."
    render 'upload/form'
    end
end
