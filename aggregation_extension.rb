class AggregationExtension < Radiant::Extension
  version "2.0"
  description "Provides radius tags to aggregate pages."
  url "http://seancribbs.com"
  
  def activate
    AggregatedArchive
    AggregatedArchiveDay
    AggregatedArchiveMonth
    AggregatedArchiveYear
    Page.class_eval { include AggregationTags }
  end
    
end