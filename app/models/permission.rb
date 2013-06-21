class Permission

    def initialize(user)
      allow :users, [:index, :show]

         allow :users, [:new, :create]
         allow :sessions, [:new, :create]
          allow :photos, [:show, :index]
      allow :comments, [:index, :show]
      if user

        allow :comments, [:new, :create,]
        allow :photos , [:new,:create,:index,:change, :update]
        allow :users, [:edit, :update]
        allow :sessions, [:destroy]
        allow_all if user.admin?
      end
    end


  def allow?(controller, action)
    @allow_all || @allowed_actions[[controller.to_s, action.to_s]]
=begin

       return true if controller == 'sessions'
       return true if controller == "users" && action.in?(%w[index show new create])
       if user
         return true if controller == 'users' && action.in?(%w[edit update])
         return true if user.admin?
       end
       false
=end
    end

  def allow_all
    @allow_all = true
  end

  def allow(controllers, actions)
   @allowed_actions ||= {}
    Array(controllers).each do |controller|
      Array(actions).each do |action|
        @allowed_actions[[controller.to_s, action.to_s]] = true

      end
    end
  end
end
