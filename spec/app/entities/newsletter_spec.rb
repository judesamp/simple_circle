require_relative '../../spec_helper'
require_relative '../../../app/entities/newsletter'
require_relative '../../../app/entities/issue'


describe "Newsletter" do
    let(:newsletter) {Newsletter.process({:title => "Original Newsletter Name"})}
    let(:issue) {Issue.process}
    let(:issue2) {Issue.process}
   
    
    describe "validations" do
        describe "validates newsletter_title field" do 
            it "validates presence of newsletter_title" do
                newsletter_without_title = Newsletter.process({})
                expect(newsletter_without_title).to eq "Newsletter: Title must not be blank"
            end
        end
    end
    
    describe "initialization" do
        describe "#process" do
            it "sets an id field" do
                expect(newsletter.id).to eq 1
            end

            it "sets a created_at field" do
                expect(newsletter.created_at).to_not be nil
            end
        end 
    end
    
    describe "#edit" do
        let(:attributes) {{ :title => "newsletter title"}}
        it "sets edited fields" do
            newsletter.edit(attributes)
            expect(newsletter.title).to eq "newsletter title"
        end
    end

    describe "#add_issue" do

        it "adds an issue to the organization's newsletter" do
            newsletter.add_issue(issue)
            expect(newsletter.issues.class).to eq DataMapper::Associations::OneToMany::Collection
        end
    end
end 
















