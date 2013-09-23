require_relative '../../spec_helper'
require_relative '../../../app/entities/newsletter'
require_relative '../../../app/entities/article'
require_relative '../../../app/entities/event'

describe "Newsletter" do
    let(:newsletter) {Newsletter.process}
    let(:article) {Article.process_and_create_draft({:title => "generic title"})}
    let(:event) {Event.process_and_create_event_draft({:event_name => "event name"})}
    
    describe "validations" do
        describe "" do 
            pending
        end
    end
    

    describe "initialization" do

        describe "#process" do
            it "sets an id field" do
                newsletter.id.should eq 1
            end

            it "sets a created_at field" do
                newsletter.created_at.should_not be nil
            end
        end
        
    end
    
    describe "#edit" do
        let (:today) {Date.today}
        let(:attributes) {{ :title => "user title", :publish_date =>  today}}
        it "sets edited fields" do
            newsletter.edit(attributes)
            newsletter.title.should eq "user title"
            newsletter.publish_date.should eq today
        end
    end
    
    describe "#add_article" do
        it "adds an article to the newsletter" do
            newsletter.add_article(article)
            newsletter.articles.should_not be nil
        end

        it "adds an event to the newsletter" do
            newsletter.add_event(event)
            newsletter.events.should_not be nil
        end
    end
end 
















