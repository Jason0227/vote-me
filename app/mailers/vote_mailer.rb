class VoteMailer < ApplicationMailer
    def vote_notify(email)
        mail to: mail, subject: 'hi'
    end
end
