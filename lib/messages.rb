module Messages

  def get_messages(page)
    response = self.class.get(api_url("/message_threads?page=#{page}"), headers: { "authorization" => @auth_token })
    @all_messages = JSON.parse(response.body)
  end
  
  def create_message(sender, recipient_id, token, subject, message)
    response = self.class.get(api_url("/messages"), body: { "sender": sender, "recipient_id": recipient_id, "token": token, "subject": subject, "stripped-text": message }, headers: { "authorization" => @auth_token })
    response.success? puts "Message sent"
  end

end