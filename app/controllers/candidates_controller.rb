class CandidatesController < ApplicationController

    before_action :find_candidate, only: [:show, :edit, :update, :destroy, :vote]

    def index
        @candidates = Candidate.all
    end

    def show
    end

    def new
        @candidate = Candidate.new
    end


    def create

        @candidate = Candidate.new(candidate_params)

        if @candidate.save
            redirect_to '/candidates', notice: 'Candidate created!'
        else
            #如果NG
            render :new
        end
    end

    def edit
    end

    def update
        if @candidate.update(candidate_params)
            redirect_to '/candidates', notice: 'Candidate updated!'
        else
            render :edit
        end
    end

    def destroy
        @candidate.destroy

        redirect_to '/candidates', notice: 'Candidate deleted!'
    end

    def vote

        #VoteLog.create(candidate: @candidate, ip_address: request.remote_ip)

        @candidate.vote_logs.create(ip_address: request.remote_ip)

        # send mail
        VoteMailer.vote_notify('eddie@5xruby.tw').deliver

        #@candidate.votes = @candidate.votes + 1
        #@candidate.increment(:votes)
        #@candidate.save

        redirect_to '/candidates', notice: 'Voted!'
    end

    private #此方法只有此檔案內部使用，所以定義為私有方法
    def candidate_params
        params.require(:candidate).permit(:name, :party, :age, :politics)
    end

    def find_candidate
        @candidate = Candidate.find_by(id: params[:id])
    end
end