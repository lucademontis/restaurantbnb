class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    # the resolve method defines the scope
    def resolve
      #scope refers to the rest class


  #   if params[:query].present?
  #     sql_query = " \
  #       movies.title @@ :query \
  #       OR movies.syllabus @@ :query \
  #       OR directors.first_name @@ :query \
  #       OR directors.last_name @@ :query \
  #     "
  #     @movies = Movie.joins(:director).where(sql_query, query: "%#{params[:query]}%")
  #   else
  #     @movies = Movie.all
  #   end
  # end



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

  def destroy?
    is_owner_or_admin?
  end

  private

  def is_owner_or_admin?
    @record.user == @user || @user.admin
  end

end
