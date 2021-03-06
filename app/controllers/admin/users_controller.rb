module Admin
  class UsersController < BaseController
    before_action :set_account
    def index
      @users = @account.users.order(created_at: :desc).paginate(page: params[:page], per_page: 20)
    end

    private

    def set_account
      @account = current_user.company.public_accounts.find(params[:public_account_id])
    end
  end
end