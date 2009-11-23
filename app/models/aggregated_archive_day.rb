class AggregatedArchiveDay < Page
  
  description %{
    To create a day index for an archive, create a child page for the
    archive and assign the "Aggregated Archive Day" page type to it.
    
    A day index page makes following tags available to you:
    
    <r:archive:children>...</r:archive:children>
      Grants access to a subset of the children of the archive page
      that match the specific day which the index page is rendering.
  }
  
  include ArchiveIndexTagsAndMethods
  desc %{
      Grants access to a subset of the children of the aggregated pages
      that match the specific day which the index page is rendering.
      
      *Usage*:
       <pre><code><r:aggregate urls="/section1; /section2; /section3"><r:archive:children>...</r:archive:children></r:aggregate></code></pre>
  }
  tag "aggregate:archive:children" do |tag|
    year, month, day = $1, $2, $3 if request_uri =~ %r{/(\d{4})/(\d{2})/(\d{2})/?$}
    start = Time.local(year, month, day)
    finish = start.tomorrow
    parent_ids = tag.locals.parent_ids || [parent_id] || [Page.find_by_url('/').id]
    tag.locals.children = Page.find(:all,:conditions => ["published_at >= ? and published_at < ? and parent_id IN (?) and status_id = ? and virtual = ?",start,finish,parent_ids,100,false])
    tag.expand
  end
  
end