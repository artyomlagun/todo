module API
  module V1
    class Projects < Grape::API
      resource :projects do
        desc 'Get all projects'
        get do
          @projects = ::Project.all
          {status: true, projects: @projects}
        end

        desc 'Get project by ID'
        params do
          requires :id, type: Integer, desc: 'Project Id'
        end
        get ':id' do
          @project = ::Project.find(params[:id])
          {status: true, project: @project}
        end

        desc 'Create project'
        params do
          requires :title, type: String, desc: 'Project title'
          requires :description, type: String, desc: 'Project description'
          requires :short_desc, type: String, desc: 'Project short description'
        end
        post do
          @project = ::Project.new(declared(params))
          if @project.save
            {status: true, project: @project}
          else
            {status: false, project: @project.errors}
          end
        end

        desc 'Update project'
        params do
          requires :id, type: Integer, desc: 'Project Id'
          requires :title, type: String, desc: 'Project title'
          requires :description, type: String, desc: 'Project description'
          requires :short_desc, type: String, desc: 'Project short description'
        end
        put ':id' do
          @project = ::Project.find(params[:id])
          if @project.update_attributes(declared(params))
            {status: true, project: @project}
          else
            {status: false, project: @project.errors}
          end
        end

        desc 'Delete project'
        params do
          requires :id, type: Integer, desc: 'Project Id'
        end
        delete ':id' do
          @project = ::Project.find(params[:id])
          if @project.destroy
            {status: true, project: 'Was successfully destroy!'}
          else
            {status: false, project: @project.errors}
          end
        end
      end
    end
  end
end
