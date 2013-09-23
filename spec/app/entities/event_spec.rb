require_relative '../../spec_helper'
require_relative '../../../app/entities/event'

describe "Event" do
    let(:draft) {Event.process_and_create_event_draft({:event_name => "generic event name"})}
    let(:description) {"This is the text of my event description. I'm going to try and get over fifty characters. That way I know this is being treated as text in the database and not be in a string field."}
    let(:valid_attributes) {{ :event_name => "generic event name", :description => description, :author => "Jeremy", :event_start_date => Date.new(2013, 10, 30), :event_end_date => Date.new(2013, 11, 01), :expire_on => Date.new(2013, 11, 02)}}
    
    describe "validations" do
        describe "validates event_name field" do 
            draft_without_event_name = Event.process_and_create_event_draft({})
        end
    end
    
    
    describe "initialization" do

        describe "#process_and_create_event_draft" do

            it "sets event_name field" do
                draft.event_name.should eq "generic event name"
            end


            it "sets an id field" do
                draft.id.should eq 1
            end
        end
            
        describe "#edit_draft" do
            
            
            it "sets the title field" do
                draft.edit_draft(valid_attributes)
                draft.event_name.should eq "generic event name"
            end
            
            it "sets article text field" do
                draft.edit_draft(valid_attributes)
                draft.description.should eq description
            end

            it "sets the author field" do
                 draft.edit_draft(valid_attributes)
                 draft.author.should eq "Jeremy"
            end

            it "sets the event_start_date" do
                draft.edit_draft(valid_attributes)
                draft.event_start_date.year.should == 2013
                draft.event_start_date.month.should == 10
                draft.event_start_date.day.should == 30
            end

            
            it "sets the event_end_date" do
                draft.edit_draft(valid_attributes)
                draft.event_end_date.year.should == 2013
                draft.event_end_date.month.should == 11
                draft.event_end_date.day.should == 01
            end

             it "sets the expire_on date" do
                draft.edit_draft(valid_attributes)
                draft.expire_on.year.should == 2013
                draft.expire_on.month.should == 11
                draft.expire_on.day.should == 02
            end


        end
    end    
end