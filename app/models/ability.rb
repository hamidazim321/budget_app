class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, Group, author_id: user.id
    can :manage, BudgetTransaction, author_id: user.id
  end
end
