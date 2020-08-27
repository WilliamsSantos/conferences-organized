class Api::V1::OrganizationController < Api::V1::ApiController

    respond_to :json
    before_action :require_authorization!, only: [:show, :update, :destroy]

    # GET /api/v1/organization/organize

    def organize

        fileFormat = FileFormatService.new({fileFormat: params}).format
        orderTracksResult = OrganizeTracksService.new(fileFormat).assemble_timesheet

        @tracks = Event.organize_byTrack(limit:50)

        render json: @tracks || [], status: 200
    end

    private
    def require_authorization
        unless current_user === User.first
            render json: { message: "Completed 401 Unauthorized" }, status: 401
        end
    end
end