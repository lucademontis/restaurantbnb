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

  def update?
   is_owner_or_admin?
  end

  def edit?
    is_owner_or_admin?
  end

  # def destroy?
  #   is_owner_or_admin?
  # end

  private

  def is_owner_or_admin?
    @record.user == @user || @record.restaurant.user == @user
  end

end
