require File.dirname(__FILE__) + '/../spec_helper'

describe Page do
  scenario :pages
  
  describe "<r:aggregate>" do
    it "should raise an error when given no 'urls' attribute" do
      pages(:home).should render('<r:aggregate></r:aggregate>').with_error("`urls' attribute required")
    end
    it "should expand its contents with a given 'urls' attribute formatted as '/url1; /url2;'" do
      pages(:home).should render('<r:aggregate urls="/parent/child; /first;">true</r:aggregate>').as('true')
    end
  end
  
  describe "<r:aggregate:children>" do
    it "should expand its contents" do
      pages(:home).should render('<r:aggregate urls="/parent/child; /first;"><r:children>true</r:children></r:aggregate>').as('true') 
    end
  end
  
  describe "<r:aggregate:children:count>" do
    it "should display the number of aggregated children" do
      pages(:home).should render('<r:aggregate urls="/news; /assorted"><r:children:count /></r:aggregate>').as('14')
    end
  end
  
  describe "<r:aggregate:children:each>" do
    it "should loop through each child from the given urls" do
      pages(:home).should render('<r:aggregate urls="/parent; /news"><r:children:each><r:title/> </r:children:each></r:aggregate>').as('Article Article 2 Article 3 Article 4 Child 2 Child 3 Child ')
    end
    it "should sort the children by the given 'by' attribute" do
      pages(:home).should render('<r:aggregate urls="/assorted; /news"><r:children:each by="slug"><r:slug /> </r:children:each></r:aggregate>').as('a article article-2 article-3 article-4 b c d e f g h i j ')
    end
    it "should order the children by the given 'order' attribute when used with 'by'" do
      pages(:home).should render('<r:aggregate urls="/assorted; /news"><r:children:each by="slug" order="desc"><r:slug /> </r:children:each></r:aggregate>').as('j i h g f e d c b article-4 article-3 article-2 article a ')
    end
  end
  
  describe "<r:aggregate:each>" do
    it "should loop through each of the given aggregate urls" do
      pages(:home).should render('<r:aggregate urls="/parent/child; /first; /assorted;"><r:each><r:title /> </r:each></r:aggregate>').as('Child First Assorted ')
    end
  end
  
  describe "<r:aggregate:each:aggregated_page>" do
    it "should display it's contents in the scope of the individually aggregated_page" do
      pages(:home).should render('<r:aggregate urls="/parent; /news; /assorted;"><r:each:aggregated_page><r:children:each><r:title /> </r:children:each></r:each:aggregated_page></r:aggregate>').as('Child Child 2 Child 3 Article Article 2 Article 3 Article 4 a b c d e f g h i j ')
    end
  end
end