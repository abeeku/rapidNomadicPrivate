class Permission

    def initialize(user)
      allow :users, [:index, :show, :profile]
      allow :posts, [:index]
allow :pages, [:world_wall]
allow :pages, [:world_wall, :dashboard, :friend_activity]
         allow :users, [:new, :create, :wall]
         allow :sessions, [:new, :create]
allow :password_resets, [:new, :create, :index, :edit]
          allow :photos, [:show, :index]
      allow :comments, [:index, :show]
      allow :games, [:index, :show]
      if user
allow :friendships, [:create,:accept,:show]
        allow :posts, [:new, :create, :like, :dislike, :unlike,:share, :index]
        allow :comments, [:new, :create,:load_commentable, :index]
        allow :user_info, [:index,:edit, :update, :create]
        allow :messages, [:index, :create, :new, :show, :count]
        allow :photos , [:new,:create,:index]
        allow :photos, [:change, :update, :destroy] 
        allow :pages, [:world_wall, :dashboard, :friend_activity]
        allow :users, [:edit, :update]
        allow :sessions, [:destroy]
        allow_all if user.admin?
      end
    end


  def allow?(controller, action, resource = nil)
    allowed = @allow_all || @allowed_actions[[controller.to_s, action.to_s]]
    allowed && (allowed == true || resource && allowed.call(resource))
  end
  
  def allow_all
    @allow_all = true
  end
  
  def allow(controllers, actions, &block)
    @allowed_actions ||= {}
    Array(controllers).each do |controller|
      Array(actions).each do |action|
        @allowed_actions[[controller.to_s, action.to_s]] = block || true
      end
    end
  end

  def allow_param(resources, attributes)
    @allowed_params ||= {}
    Array(resources).each do |resource|
      @allowed_params[resource] ||= []
      @allowed_params[resource] += Array(attributes)
    end
  end

  def allow_param?(resource, attribute)
    if @allow_all
      true
    elsif @allowed_params && @allowed_params[resource]
      @allowed_params[resource].include? attribute
    end
  end

  def permit_params!(params)
    if @allow_all
      params.permit!
    elsif @allowed_params
      @allowed_params.each do |resource, attributes|
        if params[resource].respond_to? :permit
          params[resource] = params[resource].permit(*attributes)
        end
      end
    end
  end
end













