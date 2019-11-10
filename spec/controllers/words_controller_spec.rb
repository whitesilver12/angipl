require "rails_helper"

RSpec.describe WordsController do
    describe "GET Index" do
        before  { get :index }

        context "when some words present" do
            let(:word) { create(:word) }

            it "assings '@words'" do
                expect(assigns(:words)).to eq([word])  
            end

            it "renders the index template" do
                expect(response).to render_template(:index) 
            end
        end

        context "when no present" do
            it "assings '@words'" do
                expect(assigns(:words)).to eq([])  
            end
       
            it "renders the index template" do
                expect(response).to render_template(:index) 
            end
        end
    end
end