class ReposFinder
  attr_accessor :organization

  def initialize(organization)
    self.organization = organization
  end

  def find
    Github.get("/orgs/#{organization}/repos").map do |json|
      Repo.new(
        organization: organization,
        name: json['name'],
        description: json['description']
      )
    end
  end
end
