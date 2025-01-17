require 'rails_helper'

RSpec.describe Api::RolesController, type: :request do
  let!(:super_admin) { create(:user_super_admin) }
  let!(:organization) { create(:organization) }
  let!(:with_read_permission) { organization.user }
  let!(:cant_modify) { [
    create(:user_admin),
    create(:user_waiter),
    create(:user_kitchen),
    create(:user_cash_register),
    create(:user_customer),
  ] }
  let!(:roles) { create_list(:role, 10) }

  describe '#GET /api/roles' do
    it 'should request all roles' do
      get api_roles_path, headers: auth_header(super_admin)
      expect(response).to have_http_status(:ok)
    end
    it 'admin can read all roles' do
      get api_roles_path, headers: auth_header(with_read_permission)
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#GET /api/roles/:id' do
    it 'should request role by id' do
      get api_role_path(roles.sample.id), headers: auth_header(super_admin)
      expect(response).to have_http_status(:ok)
    end
    it 'admin can read role by id' do
      get api_roles_path, headers: auth_header(with_read_permission)
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#POST /api/roles' do
    it 'should create a role' do
      attributes = attributes_for(:role)
      post api_roles_path, params: attributes.to_json, headers: auth_header(super_admin)
      expect(response).to have_http_status(:created)
    end
    it 'should throw error with invalid params' do
      post api_roles_path, headers: auth_header(super_admin)
      expect(response).to have_http_status(:unprocessable_entity)
    end
    it 'with invalid permission, should return forbidden status' do
      attributes = attributes_for(:role)
      post api_roles_path, params: attributes.to_json, headers: auth_header(cant_modify.sample)
      expect(response).to have_http_status(:forbidden)
    end
  end

  describe '#PUT /api/roles/:id' do
    let!(:role) { roles.sample }
    it 'should update a role' do
      role.name = 'editado'
      put api_role_path(role.id), params: role.to_json, headers: auth_header(super_admin)
      expect(response).to have_http_status(:ok)
    end
    it 'should throw error with invalid params' do
      role.name = ''
      put api_role_path(role.id), params: role.to_json, headers: auth_header(super_admin)
      expect(response).to have_http_status(:unprocessable_entity)
    end
    it 'with invalid permission, should return forbidden status' do
      role.name = 'editado'
      put api_role_path(role.id), params: role.to_json, headers: auth_header(cant_modify.sample)
      expect(response).to have_http_status(:forbidden)
    end
  end

  describe '#DELETE /api/roles/:id' do
    it 'should delete role' do
      delete api_role_path(roles.sample.id), headers: auth_header(super_admin)
      expect(response).to have_http_status(204)
    end
    it 'with invalid permission, should return forbidden status' do
      delete api_role_path(roles.sample.id), headers: auth_header(cant_modify.sample)
      expect(response).to have_http_status(:forbidden)
    end
  end
end
