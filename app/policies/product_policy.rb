class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def new?
    true
  end

  def show?
    true
  end

  def index?
    true
  end

  def edit?
    # user   ==> current_user
    # record ==> @product (objeto que vc esta passando)
    if record.user == user
      true
    else
      false
    end
  end

end
