class AggregationExtension < Radiant::Extension
  version "0.1"
  description "Describe your extension here"
  url "http://seancribbs.com"

  # define_routes do |map|
  #   map.connect 'admin/aggregation/:action', :controller => 'admin/asset'
  # end
  
  def activate
    Page.send :include, AggregationTags
  end
  
  def deactivate
    # admin.tabs.remove "Aggregation"
  end
    
end