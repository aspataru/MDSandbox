class SearchesController < ApplicationController
  # GET /searches
  # GET /searches.json
  def index
    # If the autocomplete is used, it will send a parameter 'term', so we catch that here
    if params[:term]
      # Then we limit the number of records assigned to @people, by using the term value as a filter.
      @searches = Search.find(:all,:conditions => ['name LIKE ?', "%#{params[:term]}%"])
      # In my example, I still need to access all records when I first render the page, 
      #so for normal use I assign all. This has nothing to do with the autocomplete, 
      #just showing you how I used it in my situation.
    else
      @searches = Search.all
    end

    respond_to do |format|
      format.html # index.html.erb
      # Here is where you can specify how to handle the request for "/search.json"
      format.json { render :json => @searches.to_json }
    end
  end

  # GET /searches/1
  # GET /searches/1.json
  def show
    @search = Search.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @search }
    end
  end

  # GET /searches/new
  # GET /searches/new.json
  def new
    @search = Search.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @search }
    end
  end

  # GET /searches/1/edit
  def edit
    @search = Search.find(params[:id])
  end

  # POST /searches
  # POST /searches.json
  def create
    @search = Search.new(params[:search])

    respond_to do |format|
      if @search.save
        format.html { redirect_to @search, notice: 'Search was successfully created.' }
        format.json { render json: @search, status: :created, location: @search }
      else
        format.html { render action: "new" }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /searches/1
  # PUT /searches/1.json
  def update
    @search = Search.find(params[:id])

    respond_to do |format|
      if @search.update_attributes(params[:search])
        format.html { redirect_to @search, notice: 'Search was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /searches/1
  # DELETE /searches/1.json
  def destroy
    @search = Search.find(params[:id])
    @search.destroy

    respond_to do |format|
      format.html { redirect_to searches_url }
      format.json { head :no_content }
    end
  end
end
