module Api::V1
    class Overrides::SessionsController < DeviseTokenAuth::SessionsController

        def create
            byebug
                super
        end
        
        private

        def render_create_success  
            @user = @resource   
        end
    
    end
end