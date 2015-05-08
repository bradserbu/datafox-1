module Raw
  class V1 < Grape::API
    version 'v1', using: :param, parameter: "v"
    helpers do
      def authenticate!

      end
    end

    resource :raw do
      #temporary authentication
      http_basic do |username, password|
        username == 'pk' && password == 'idiot'
      end

      #curl http://localhost:3000/api/raw/sample_companies?v=v1
      desc "Return last 20 newly created companies"
      get :sample_companies do
        RawCompany.last(20)
      end

      desc "Return all companies match the name"
      params do
        requires :name, type: String, desc: "Company name"
      end
      route_param :name do
        get do
          RawCompany.find(params[:name])
        end
      end

      #curl -H "Content-Type: application/json" -X POST -d '{"name":"testCompany2"}' -u pk:idiot http://localhost:3000/api/raw?v=v1
      desc "Add a new Company information."
      params do
        requires :name, type: String, desc: "Company name"
        optional :location, type: String, desc: "Company location"
        optional :founded, type: String, desc: "Company founded year"
        optional :team, type: String, desc: "Company team members"
        optional :investor, type: String, desc: "Company investors"
        optional :field, type: String, desc: "Company field, could be mulitple strings"
        optional :buzimodel, type: String, desc: "Company business model"
        optional :url, type: String, desc: "Company url"
        optional :stage, type: String, desc: "Company current stage"
        optional :news, type: String, desc: "Company news"
        optional :source, type: String, desc: "Source of the company info, like it get from 36kr"
        optional :desc, type: String, desc: "Overview description of the company"
      end
      post do
        #authenticate!
        RawCompany.create!({
          name: params[:name],
          location: params[:location],
          founded: params[:founded],
          team: params[:team],
          investor: params[:investor],
          field: params[:field],
          buzimodel: params[:buzimodel],
          url: params[:url],
          stage: params[:stage],
          news: params[:news],
          source: params[:source],
          desc: params[:desc]
        })
      end
=begin
      desc "Update a company."
      params do
        requires :id, type: Integer, desc: "Company ID"
        requires :col, type: String, desc: "Specific company column"
        requires :info, type: String, desc: "Info to upadte"
      end
      put :id do
        authenticate!
        RawCompany.where(params[:id]).update({
          (params[:col]): params[:info]
        })
      end
=end
      desc "Delete a company."
      params do
        requires :id, type: String, desc: "Company ID"
      end
      delete ':id' do
        authenticate!
        RawCompany.find(params[:id]).destory
      end
    end
  end
end
