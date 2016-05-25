class PublicationPolicy < ApplicationPolicy

	  def index?
		true
	  end

	  def show?
		scope.where(:id => record.id).exists?
	  end

	  def create?
		publication.author == user
	  end

	  def new?
		user.present?
	  end

	  def update?
		user.present? && ((publication.author == user) || (user.has_role? :admin))
	  end

	  def destroy?
		user.present? && ((publication.author == user) || (user.has_role? :admin))
	  end
	  
	  def publication
		record
	  end
	  
end
