module API
  module V1
    class Users < Grape::API
      resource :users do
        desc 'Get all users'
        get do
          @users = ::User.all
          {status: true, users: @users}
        end

        desc 'Get user by ID'
        params do
          requires :id, type: Integer, desc: 'User Id'
        end
        get ':id' do
          @user = ::User.find(params[:id])
          {status: true, user: @user}
        end

        desc 'Create user'
        params do
          requires :lname, type: String, desc: 'User Last Name'
          requires :fname, type: String, desc: 'User First Name'
          requires :position, type: String, desc: 'User Position'
          requires :username, type: String, desc: 'User Username'
          requires :email, type: String, desc: 'User Email'
        end
        post do
          @user = ::User.new(declared(params))
          if @user.save
            {status: true, user: @user}
          else
            {status: false, user: @user.errors}
          end
        end

        desc 'Update user'
        params do
          requires :id, type: Integer, desc: 'User Id'
          requires :lname, type: String, desc: 'User Last Name'
          requires :fname, type: String, desc: 'User First Name'
          requires :position, type: String, desc: 'User Position'
          requires :username, type: String, desc: 'User Username'
          requires :email, type: String, desc: 'User Email'
        end
        put ':id' do
          @user = ::User.find(params[:id])
          if @user.update_attributes(declared(params))
            {status: true, user: @user}
          else
            {status: false, user: @user.errors}
          end
        end

        desc 'Delete user'
        params do
          requires :id, type: Integer, desc: 'User Id'
        end
        delete ':id' do
          @user = ::User.find(params[:id])
          if @user.destroy
            {status: true, user: 'Was successfully destroy!'}
          else
            {status: false, user: @user.errors}
          end
        end
      end
    end
  end
end
