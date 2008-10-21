require File.dirname(__FILE__) + '/../spec_helper'

describe Page do
  scenario :pages
  
  describe "<r:aggregate>" do
    it "should raise an error when given no 'urls' attribute" do
      pages(:home).should render('<r:aggregate></r:aggregate>').with_error("`urls' attribute required")
    end
  end
  
  describe "<r:aggregate:children>" do
    it "should expand its contents" do
      pages(:home).should render('<r:aggregate urls="/parent/child; /first;"><r:children>true</r:children></r:aggregate>').as('true') 
    end
  end
  
  describe "<r:aggregate:children:each>" do
    it "should loop through each child from the given urls" do
      pages(:home).should render('<r:aggregate urls="/parent; /news"><r:children:each><r:title/> </r:children:each></r:aggregate>').as('Article Article 2 Article 3 Article 4 Child 2 Child 3 Child ')
    end
  end
  
  describe "<r:aggregate:each>" do
    it "should loop through each of the given aggregate urls" do
      pages(:home).should render('<r:aggregate urls="/parent/child; /first; /assorted;"><r:each><r:title /> </r:each></r:aggregate>').as('Child First Assorted ')
    end
  end
end