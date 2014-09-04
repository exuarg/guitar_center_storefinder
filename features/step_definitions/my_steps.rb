Given(/^user goes to guitarcenter website$/) do
  @Browser = Watir::Browser.new :ff
  @Browser.goto "guitarcenter.com"
  @Browser.div(:class=>"gc_redesign_header_store_locator").wait_until_present
end

When(/^user goes to the store finder, inputs "([^"]*)"$/) do |zipcode|
  @Browser.link(:text=>"Store Finder").click
  @Browser.div(:class=>"search-results").wait_until_present
  @Browser.text_field(:id=>"txtSearch").set "#{zipcode}"
  @Browser.text_field(:id=>"txtSearch").send_keys :enter
  @Browser.div(:class=>"search-results").wait_until_present
  @Browser.link(:text=>"Directions", :index=>0).click


  @Browser.window(:title => /Google Maps/).use do
  @Browser.input(:class=>"tactile-searchbox-input").wait_until_present
  @Browser.text_field(:class=>"tactile-searchbox-input").set "#{zipcode}"
  @Browser.text_field(:class=>"tactile-searchbox-input").send_keys :enter
  @Browser.div(:class=>"cards-directions-details cards-directions-animated cards-directions-show-expanded").wait_until_present
  @first_store = @Browser.span(:class=>"cards-directions-details cards-directions-distance").text
   puts @first_store
  @Browser.window(:title => /Google Maps/).close
  end
  @Browser.div(:class=>"search-results").wait_until_present
  @Browser.link(:text=>"Directions", :index=>1).click
  @Browser.window(:title => /Google Maps/).use do
  @Browser.input(:class=>"tactile-searchbox-input").wait_until_present
  @Browser.text_field(:class=>"tactile-searchbox-input").set "#{zipcode}"
  @Browser.text_field(:class=>"tactile-searchbox-input").send_keys :enter
  @Browser.div(:class=>"cards-directions-details cards-directions-animated cards-directions-show-expanded").wait_until_present
  @second_store = @Browser.span(:class=>"cards-directions-details cards-directions-distance").text
    puts @second_store
  @Browser.window(:title => /Google Maps/).close

  end

end


Then(/^they get results of stores by distance starting with the closest$/) do
   puts  @first_store.to_f
   puts  @second_store.to_f
  if @first_store.to_f <= @second_store.to_f
  puts "Stores Arranged From Closest to Furthest"
  else
    puts "Stores Not Arraged Properly"
  end
end


