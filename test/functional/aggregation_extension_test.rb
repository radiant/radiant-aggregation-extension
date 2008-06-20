require File.dirname(__FILE__) + '/../test_helper'

class AggregationExtensionTest < Test::Unit::TestCase

  fixtures :pages
  test_helper :render, :page  
 
  def setup
    @page = pages(:radius)
  end
   
  def test_initialization
    assert_equal File.expand_path(RADIANT_ROOT + '/vendor/extensions/aggregation'), File.expand_path(AggregationExtension.root)
    assert_equal 'Aggregation', AggregationExtension.extension_name
  end
  
  def test_tag_inclusion
    assert_global_tag_module AggregationTags
  end
  
  def test_aggregate_tags
    assert_renders "", %{<r:aggregate urls="/documentation; /textile"></r:aggregate>}
    assert_render_error "`urls' attribute required", %{<r:aggregate></r:aggregate>}
    assert_renders "Books Radius Test Child 1 Radius Test Child 2 Radius Test Child 3 ", 
                    %{<r:aggregate urls="/documentation; /radius"><r:children:each><r:title/> </r:children:each></r:aggregate>}
  end
  
end
