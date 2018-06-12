class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    # the resolve method defines the scope
    def resolve
      #scope refers to the rest class
      scope.all
    end
  end


  def create?
    !@user.nil?
  end

  def new?
    create?
  end


  private

  def is_owner_or_admin?
    @record.user == @user || @user.admin
  end

end
