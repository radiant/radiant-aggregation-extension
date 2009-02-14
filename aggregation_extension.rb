class AggregationExtension < Radiant::Extension
  version "1.0"
  description "Provides radius tags to aggregate pages."
  url "http://seancribbs.com"
  
  def activate
    AggregatedArchiveMonth
    Page.send :include, AggregationTags
  end
    
end