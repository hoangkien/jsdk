class CategoryConstraint
  def matches?
    Category.where(slug: request.path_parameters[:slug]).exists?
  end
end
