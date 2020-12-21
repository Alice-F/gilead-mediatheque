class DocumentPolicy < ApplicationPolicy
  class Scope < Scope
    def show
      true
    end

    def resolve
      scope.all
    end
  end
end
