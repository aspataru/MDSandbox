class SearchesController < ApplicationController
  # GET /searches
  # GET /searches.json
  def index
    # If the autocomplete is used, it will send a parameter 'term', so we catch that here
    #if params[:term]
    if params[:term]

      @countries = Country.find(:all,:conditions => ['name LIKE ?', "%#{params[:term]}%"])
      @resorts = Resort.find(:all,:conditions => ['name LIKE ?', "%#{params[:term]}%"])
     
      @results = []
     
     @resorts.each do |resort|
       @results.push resort
     end
     
     @countries.each do |country|
       @results.push country
     end
     
      
    else

      @results = Resort.all
      
    end

    respond_to do |format|
      format.html # index.html.erb
      # Here is where you can specify how to handle the request for "/search.json"
      format.json { render :json => @results.to_json }
    end
  end

end
