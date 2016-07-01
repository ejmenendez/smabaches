class Notifier < ActionMailer::Base
  default from: "smabaches@gmail.com"

  def complaint_report(user, publication,report_author)
    @report_author = report_author
    @publication = publication
    @url  = publication_url(@publication)
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
