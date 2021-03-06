AdaptorTemplate.controllers :hosts, :parent => :i_nodes do
  before do
    logger.info('hosts#before')
    @i_node = INode.find_by_uuid(params[:i_node_id])
  end

  get :index do
    logger.info('hosts#index')
    @hosts = i_node.hosts.all(@i_node)

    render 'hosts/index'
  end

  get :index, :map => 'hosts/readings' do
    logger.info('hosts#readings')
    @hosts = i_node.hosts.all(@i_node)

    render 'hosts/readings'
  end

  get :index, :map => 'hosts/:uuid/readings' do
    logger.info('hosts.uuid#readings')
    @host = i_node.hosts.find_by_uuid(@i_node, params[:uuid])

    render 'hosts/readings'
  end

  get :show, :map => "hosts/:uuid" do
    logger.info('hosts#show')
    @host = i_node.hosts.find_by_uuid(@i_node, params[:uuid])

    render 'hosts/show'
  end
end