class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
      # scope ==> Product (a classe que voce esta passando)
      # aqui é o scope padrão e no controller é a continuação da query.
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def edit?
    owner?
  end

  def update?
    owner?
  end

  def destroy?
    owner?
  end

  private

  def owner?
    # record.user == user || user.admin
    record.user == user
    # user   ==> current_user
    # record ==> @product (objeto que vc esta passando)
  end
end
