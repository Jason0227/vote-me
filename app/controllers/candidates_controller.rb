class CandidatesController < ApplicationController

    def index
    end

    def new
        @candidate = Candidate.new
    end

    def create
        @candidate = Candidate.new(params[:candidate])
        #上面的params[：candidate]是在debugger模式測出來的，利用params這個變數hash取得:candidate這包東西出來，然後透過new的方式丟給Candidate這個model
        if @candidate.save
            #如果成功，轉指導候選人列表列
            redirect_to '/candidates'
            #redirect_to是轉址的指令
        else
            #如果NG
        end
    end
end