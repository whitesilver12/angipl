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

    describe "GET new" do
        before { get :new }

        it "assings '@word'" do
            expect(assigns(:word)).to be_a_new(Word)
        end

        it "renders the new template" do
            expect(response).to render_template(:new) 
        end
    end

    describe "POST create" do
        subject { post :create, params: params }
        context 'valid params' do
            let(:params) do 
                { word: { value: "cat", language: "english" } } 
            end

            it "create new word" do
                expect { subject }.to change(Word, :count).from(0).to(1)  
            end
        end

        context 'invalid params' do
            let(:params) do 
                { word: { value: "", language: "" } } 
            end

            it "does not create new word" do
                expect { subject }.not_to change(Word, :count)
            end
        end
    end

    describe "GET show" do
        before { get :show, params: params }

        let(:params) do 
            { id: word.id }
        end
        
        let!(:word) { create(:word) }

        it "assings '@word'" do
            expect(assigns(:word)).to eq(word)
        end

        it "renders the show template" do
            expect(response).to render_template(:show) 
        end
    end
    
end