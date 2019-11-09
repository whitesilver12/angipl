require "rails_helper"

RSpec.describe WordsController do
    describe "GET Index" do
        context "when some words present" do
            it "assings '@words'" do
                word = create(:word)
                get :index
                expect(assigns(:words)).to eq([word])  
            end
        end

        context "when no present" do
            it "assings '@words'" do
                get :index
                expect(assigns(:words)).to eq([])  
            end
        end

        
        it "renders the index template" do
            get :index
            expect(response).to render_template(:index) 
        end
    end
end