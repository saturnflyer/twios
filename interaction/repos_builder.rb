class ReposBuilder
  attr_accessor :organization, :hash

  def initialize(organization, hash)
    self.organization = organization
    self.hash = hash
  end

  def build
    hash.map do |name, description|
      Repo.new(
        organization: organization,
        name: name.to_s,
        description: description
      )
    end
  end
end
