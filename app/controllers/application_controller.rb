class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
USAGE
PROTECT RESTAURANT
rails g pundit:policy restaurant
# => generates the file `app/policies/restaurant_policy.rb`
Question: Who can create a restaurant?

ADMIN USERS
rails g migration AddAdminToUsers admin:boolean
rails db:migrate
rails c
pry> user = User.where(email: 'seb@lewagon.org').first
pry> user.admin = true
pry> user.save
You can now use this admin field in your policies!

HAPPY AUTHORIZING!

end
