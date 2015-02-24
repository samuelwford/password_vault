class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @accounts = policy_scope(Account).order(:name)
    respond_with(@accounts)
  end

  def show
    @account.record_viewed_by current_user
    respond_with(@account)
  end

  def new
    @account = Account.new
    respond_with(@account)
  end

  def edit
    @account.record_edited_by current_user
  end

  def create
    @account = Account.new(account_params)
    @account.record_created_by current_user
    @account.save
    respond_with(@account)
  end

  def update
    @account.update(account_params)
    @account.record_changed_by current_user
    respond_with(@account)
  end

  def destroy
    @account.destroy
    respond_with(@account)
  end

  private
    def set_account
      @account = Account.find(params[:id])
      authorize @account
    end

    def account_params
      params.require(:account).permit(:name, :password, :notes, :group_id, :account_name, :url)
    end
end
