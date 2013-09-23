require_relative '../../spec_helper'
require_relative '../../../app/entities/article'

describe "Article" do
    let(:draft) {Article.process_and_create_draft({:title => "generic title"})}
    let(:text) {"This is the text of my article. I'm going to try and get over fifty characters. That way I know this is being treated as text in the database and not be in a string field."}
    let(:valid_attributes) {{ :title => "user article title", :tags => "tag1, tag2, tag3", :article_text => text, :summary => "This is the article summary.", :author => "Jeremy"}}
    
    describe "validations" do
        describe "validates title field" do 
            draft_without_title = Article.process_and_create_draft({})
        #figure out how to test this
        end
    end
    
    
    describe "initialization" do

        describe "#process_and_create_draft" do

            it "sets title field" do
                draft.title.should eq "generic title"
            end


            it "sets an id field" do
                draft.id.should eq 1
            end
        end
            
        describe "#edit_draft" do
            
            
            it "sets the title field" do
                draft.edit_draft(valid_attributes)
                draft.title.should eq "user article title"
            end
            
            it "sets the tags field" do
                draft.edit_draft(valid_attributes)
                draft.tags.should eq "tag1, tag2, tag3"
            end
            
            it "sets article text field" do
                draft.edit_draft(valid_attributes)
                draft.article_text.should eq text
            end
            
            it "sets the author field" do
                draft.edit_draft(valid_attributes)
                draft.author.should eq "Jeremy"
            end
            
            it "sets the summary field " do
                draft.edit_draft(valid_attributes)
                draft.summary.should eq "This is the article summary."
            end
        end
    end    
end