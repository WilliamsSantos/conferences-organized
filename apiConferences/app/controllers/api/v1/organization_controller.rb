class Api::V1::OrganizationController < Api::V1::ApiController

    respond_to :json
    before_action :require_authorization!, only: [:show, :update, :destroy]

    # GET /api/v1/organization/organize

    def organize

        # Format the files
        fileFormat = FileFormatService.new({fileFormat: params}).format

        # Organize the tracks to response
        @tracks = OrganizeTracksService.new(fileFormat).assemble_timesheet

        if  @tracks[:organize]
            render json: @tracks[:data] || [], status: 200
        else
            render json: { error: orderTracksResult[:error] }, status: 500
        end
    end

    private
    def require_authorization
        unless current_user === User.first
            render json: { message: "Completed 401 Unauthorized" }, status: 401
        end
    end
end