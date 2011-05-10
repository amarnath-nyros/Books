class Sendmail < ActionMailer::Base
  
  def passwordforgot(to, name, pass,user_id)
    @subject   = "Your password is ..."
    @body['name']=name
    @body['pass']=pass
    @body['user_id']=user_id
    @recipients = to
    @from  = 'support@yourdomain.com'
     @content_type    = "text/html"
  end
  
 
  
  
end
