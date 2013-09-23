require_relative '../../spec_helper'
require_relative '../../../app/entities/organization'
require_relative '../../../app/entities/newsletter'

describe "Organization" do
    let(:organization) {Organization.process({})}
    let(:valid_attributes) {{ :name => "org name"}}
    let(:newsletter) {Newsletter.process}
    
    describe "validations" do
        describe "validates orgnaization name field" do 
            #decide how to test this
        end
    end
    
    
    describe "initialization" do

        describe "#process" do

            it "sets an id field" do
                organization.id.should eq 1
            end
        end


     end
    

    describe "usage methods" do

	    describe "#edit" do 
	        it "sets the title field" do
	        	organization.edit(valid_attributes)
	            expect(organization.name).to eq "org name"
	        end
	    end

	    describe "#add_newsletter" do
	    	it "creates a newsletter draft and attaches/adds it to the organization" do 
	    		organization.add_newsletter(newsletter)
	    		expect(organization.newsletters).to_not be_empty
	    	end
		end


		
	end
end