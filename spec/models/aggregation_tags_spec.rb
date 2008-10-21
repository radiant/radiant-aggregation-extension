require File.dirname(__FILE__) + '/../spec_helper'

describe Page do
  scenario :pages
  describe "<r:aggregate:each>" do
    it "should loop through each of the given aggregate urls" do
      pages(:home).should render('<r:aggregate urls="/parent/child; /first; /assorted;"><r:each><r:title /> </r:each></r:aggregate>').as('Child First Assorted ')
    end
  end
end