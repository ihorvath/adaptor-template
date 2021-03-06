AdaptorTemplate.controllers :machines, :parent => :i_nodes do
  before do
    @i_node = INode.find_by_uuid(params[:i_node_id])
  end

  # Creates
  post :create do
    @machine = Machine.new(@i_node, params)
    @machine.save

    render 'machines/show'
  end

  # Reads
  get :index do
    @machines = Machine.all(@i_node)

    render 'machines/index'
  end

  get :index, :map => 'machines/readings' do
    @machines = Machine.all(@i_node)

    render 'machines/readings'
  end

  get :index, :map => 'machines/:uuid/readings' do
    @machine = Machine.find_by_uuid(@i_node, params[:uuid])

    render 'machines/readings'
  end

  get :show, :map => "machines/:uuid" do
    @machine = Machine.find_by_uuid(@i_node, params[:uuid])

    render 'machines/show'
  end

  # Updates
  put :show, :map => 'machines/:uuid/power_on' do
    @machine = Machine.find_by_uuid(@i_node, params[:uuid])
    @machine.power_on if @machine.present?

    render 'machines/show'
  end

  put :show, :map => 'machines/:uuid/power_off' do
    @machine = Machine.find_by_uuid(@i_node, params[:uuid])
    @machine.power_off if @machine.present?

    render 'machines/show'
  end

  put :show, :map => 'machines/:uuid/restart' do
    @machine = Machine.find_by_uuid(@i_node, params[:uuid])
    @machine.restart if @machine.present?

    render 'machines/show'
  end

  put :show, :map => 'machines/:uuid/shutdown' do
    @machine = Machine.find_by_uuid(@i_node, params[:uuid])
    @machine.shutdown if @machine.present?

    render 'machines/show'
  end

  put :show, :map => 'machines/:uuid/unplug' do
    @machine = Machine.find_by_uuid(@i_node, params[:uuid])
    @machine.unplug if @machine.present?

    render 'machines/show'
  end
  
  # Deletes
  delete :delete, :map => "machines/:uuid" do
    @machine = Machine.find_by_uuid(@i_node, params[:uuid])
    @machine.delete

    render 'machines/show'
  end
end
