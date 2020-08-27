class Api::V1::OrganizationController < Api::V1::ApiController

    respond_to :json
    before_action :require_authorization!, only: [:show, :update, :destroy]

    # GET /api/v1/organization/organize

    def organize

        # fileFormat          = FileFormatService.new({fileFormat: params}).format
        # orderTracksResult   = OrganizeTracksService.new(fileFormat).assemble_timesheet

        @tracks = Event.organize_byTrack(limit:50)

        if @tracks.empty?
            render json: 'Falha Interna', status: 500
        else
            render json: @tracks, status: 200
        end
    end
end