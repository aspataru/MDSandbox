class SearchesController < ApplicationController
  # GET /searches
  # GET /searches.json
  def index
    # If the autocomplete is used, it will send a parameter 'term', so we catch that here
    #if params[:term]
    if params[:term]

      countries = Country.find(:all,:conditions => ['lower(name) LIKE ?', "%#{params[:term].downcase}%"], :select => "name, id")
      resorts = Resort.find(:all,:conditions => ['lower(name) LIKE ?', "%#{params[:term].downcase}%"], :select => "name, id")

      @results = []
      
      countries.each do |c|
        jsc = c.to_json
        jscH = JSON.parse(jsc)
        jscH[:type] = 'c'
        @results << jscH
      end
      resorts.each do |r|
        jsr = r.to_json
        jsrH = JSON.parse(jsr)
        jsrH[:type] = 'r'
        @results << jsrH
      end


    # resorts.each do |resort|
    # @results.push resort
    # end
#     
    # countries.each do |country|
    # @results.push country
    # end

    else

      @results = Resort.all
      
    end

    respond_to do |format|
      format.html # index.html.erb
      # Here is where you can specify how to handle the request for "/search.json"
      format.json { render :json => @results }
    end
  end

end
