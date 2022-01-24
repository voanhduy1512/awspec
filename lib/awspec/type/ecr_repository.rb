module Awspec::Type
  class EcrRepository < ResourceBase
    aws_resource Aws::ECR::Types::Repository

    def initialize(repository_name)
      super
      @display_name = repository_name
    end

    def resource_via_client
      @resource_via_client ||= find_ecr_repository(@display_name)
    end

    def id
      @id ||= resource_via_client.repository_name if resource_via_client
    end

    def policy_text
      @policy_text ||= get_policy_text(@display_name)
    end
  end
end
