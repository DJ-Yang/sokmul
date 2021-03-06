class PeopleController < ApplicationController
    def new
    end
    
    def index
       @people = Person.all 
    end
    
    def create
        @person = Person.new(params.require(:person).permit(:name, :phone, :relation, :user_id))
        
        @person.save
        redirect_to people_path
    end
    
    def show
        @person= Person.find(params[:id])
    end
    
    def destroy
        person = Person.find(params[:id])
        person.destroy
        
        redirect_to people_path
    end
    
    def edit
        @person = Person.find(params[:id])
    end
    
    def update
        params.permit!
        @person = Person.find(params[:id])
        @person.update(params[:person])
        
        redirect_to @person
    end
    
end
