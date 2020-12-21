class Admin::DocumentPolicy < ApplicationPolicy
  class Scope < Scope
    def create
      user.admin?
    end

    def update
      user.admin?
    end
    # def resolve
    #   scope.all
    # end
  end
end
