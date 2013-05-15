class AppointmentsController < ApplicationController
  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @appointments }
    end
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @appointment }
    end
  end

  # GET /appointments/new
  # GET /appointments/new.json
  def new
    @appointment = Appointment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @appointment }
    end
  end

  # GET /appointments/1/edit
  def edit
    @appointment = Appointment.find(params[:id])
  end

  # GET /appointments/bydate/2013-05-12
  # POST /appointments/bydate/ with Hash date param
  def bydate
    # Accept date in two formats: hash {"date" => {"day" => 18, "year" => "2013", "month" => "05"} or string
    if params["date"].class != String
      # Assuming we have a hash; ToDo: better error handling
      @date = "#{sprintf('%02d', params["date"]["year"])}-#{sprintf('%02d', params["date"]["month"])}-#{sprintf('%02d', params["date"]["day"])}"
    else
      @date = params["date"].to_s
    end
    @appointments = Appointment.by_date(@date)
  end

  # POST /appointments
  # POST /appointments.json
  def create
    # Before making record, tack on proper date from :date to :starttime and :endttime
    params[:appointment]["starttime(1i)"] = params[:appointment]["date(1i)"]
    params[:appointment]["starttime(2i)"] = params[:appointment]["date(2i)"]
    params[:appointment]["starttime(3i)"] = params[:appointment]["date(3i)"]
    params[:appointment]["endtime(1i)"] = params[:appointment]["date(1i)"]
    params[:appointment]["endtime(2i)"] = params[:appointment]["date(2i)"]
    params[:appointment]["endtime(3i)"] = params[:appointment]["date(3i)"]
    @appointment = Appointment.new(params[:appointment])

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, :notice => 'Appointment was successfully created.' }
        format.json { render :json => @appointment, :status => :created, :location => @appointment }
      else
        format.html { render :action => "new" }
        format.json { render :json => @appointment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /appointments/1
  # PUT /appointments/1.json
  def update
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      if @appointment.update_attributes(params[:appointment])
        format.html { redirect_to @appointment, :notice => 'Appointment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @appointment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy

    respond_to do |format|
      format.html { redirect_to appointments_url }
      format.json { head :no_content }
    end
  end
end
