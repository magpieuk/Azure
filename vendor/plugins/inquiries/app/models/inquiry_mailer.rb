class InquiryMailer < ActionMailer::Base

  def confirmation(inquiry, request)
    email_to = get_target_staff_member(inquiry)
    subject     InquirySetting.confirmation_subject.value
    recipients  inquiry.email
    from        "\"#{RefinerySetting[:site_name]}\" <no-reply@#{request.domain(RefinerySetting.find_or_set(:tld_length, 1))}>"    
    reply_to    email_to || InquirySetting.notification_recipients.value.split(',').first
    sent_on     Time.now
    body        :inquiry => inquiry
  end

  def notification(inquiry, request)
    email_to = get_target_staff_member(inquiry)
    subject     InquirySetting.notification_subject.value
    recipients  email_to || InquirySetting.notification_recipients.value
    from        "\"#{RefinerySetting[:site_name]}\" <no-reply@#{request.domain(RefinerySetting.find_or_set(:tld_length, 1))}>"
    sent_on     Time.now
    body        :inquiry => inquiry
  end

  def get_target_staff_member(inquiry)
   target_service = Service.find(:first, :conditions => ["category_id = ? and location_id = ?", inquiry.category_id, inquiry.location_id])
   email_to = target_service.staff.email rescue nil
   if email_to.blank?
     target_service = Service.find(:first, :conditions => ["category_id = ?", inquiry.category_id])
     email_to = target_service.staff.email rescue nil
   end
   return nil if email_to.blank?
   return email_to
  end

end
