require 'test_helper'

class CreateEventsTest < ActionDispatch::IntegrationTest

    def setup
        @user = User.create(name: "jolly")
        @event = Event.create(description: "Testing", date: "2019-09-26 00:00:00", creator: @user )
    end

    test "invalid category submission results in failure" do 
        sign_in_as(@user)
        get new_event_path
        assert_template 'events/new'
        assert_no_difference 'Event.count'  do 
            post events_path, params: {event:{description:" "}}
        end
        assert_template 'events/new'
        assert_match "Create Event", response.body
    end 

end 