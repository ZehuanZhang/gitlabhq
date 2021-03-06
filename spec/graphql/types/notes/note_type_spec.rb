# frozen_string_literal: true
require 'spec_helper'

describe GitlabSchema.types['Note'] do
  it 'exposes the expected fields' do
    expected_fields = [:id, :project, :author, :body, :created_at,
                       :updated_at, :discussion, :resolvable, :position, :user_permissions,
                       :resolved_by, :resolved_at, :system, :body_html, :confidential]

    expect(described_class).to have_graphql_fields(*expected_fields)
  end

  specify { expect(described_class).to expose_permissions_using(Types::PermissionTypes::Note) }
  specify { expect(described_class).to require_graphql_authorizations(:read_note) }
end
