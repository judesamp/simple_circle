require_relative '../../spec_helper'
require_relative '../../../app/entities/issue'
require_relative '../../../app/entities/article'
require_relative '../../../app/entities/event'
require_relative '../../../app/entities/newsletter'


describe "Issue" do
		let(:newsletter) {Newsletter.process}
    let(:issue) {Issue.process}
    let(:issue2) {Issue.process}
    let(:article) {Article.process_and_create_draft({:title => "generic title"})}
    let(:event) {Event.process_and_create_event_draft({:event_name => "event name"})}
    let(:valid_attributes) {{:publish_on => Date.today}}
    
    describe "validations" do
    end

    describe "initialization" do
    	it "creates an issue and sets the id" do
    		expect(issue.id).to eq 1
    	end

    	it "should have a draft_id field" do
    		expect(issue.draft_id).to eq nil
    	end

    	it "should have a issue number field" do
    		expect(issue.issue_number).to eq nil
    	end

    	it "should have a publish on date field" do
    		expect(issue.publish_on).to eq nil
    	end

    	it "should have a published on date field" do
    		expect(issue.published_on).to eq nil
    	end
    end

    describe "#add_article" do
     it "adds an article to the issue" do
        issue.add_article(article)
        expect(issue.articles).to_not be_empty
     end

      it "adds an event to the issue" do
        issue.add_event(event)
        expect(issue.events).to_not be_empty
      end
   end

   	describe "#edit" do
    	it "sets the title field" do
        issue.edit(valid_attributes)
        expect(issue.publish_on).to eq Date.today
    	end
   	end


   	describe "issue added to newsletter" do
 		 it "an issue is added to the organization's newsletter" do
          newsletter.add_issue(issue)
          expect(newsletter.issues.class).to eq DataMapper::Associations::OneToMany::Collection
      end

      it "increments and sets the issue's draft id number" do
          newsletter.add_issue(issue)
          newsletter.add_issue(issue2)
          expect(issue.draft_id).to eq 1
          expect(issue2.draft_id).to eq 2
      end
   	end
 end