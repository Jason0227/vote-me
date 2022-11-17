class CandidatesController < ApplicationController

    def index
    end

    def new
        @candidate = Candidate.new
    end

    def create

        @candidate = Candidate.new(candidate_params)
        #上面的params[：candidate]是在debugger模式測出來的，利用params這個變數hash取得:candidate這包東西出來，然後透過new的方式丟給Candidate這個model
        if @candidate.save
            flash[:notice] = "Candidate created!"
            #flash這個類似hash的快閃訊息，畫面呈現只出現一次，並且給他一個key叫notice(這個可在幾換名子，單通常提醒時都用這個英文)，然後帶入提醒的字串
            #如果成功，轉指導候選人列表列
            redirect_to '/candidates'
            #redirect_to是轉址的指令
        else
            #如果NG
        end
    end
    private #此方法只有此檔案內部使用，所以定義為私有方法
    def candidate_params
        params.require(:candidate).permit(:name, :party, :age, :politics)
    end
end