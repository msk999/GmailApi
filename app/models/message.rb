class Message
  attr_reader :id, :date, :from, :to, :subject, :url
  attr_accessor :body
   def initialize(params = {})
    @id = params.fetch(:id, nil)
    @date = params.fetch(:date, DateTime.now)
    @from = params.fetch(:from, 'user@fake_email.com')
    @to = params.fetch(:to, 'user@fake_email.com')
    @subject = params.fetch(:subject, 'subject')
    @body = params.fetch(:body, '')
    @url = url
  end

  def url
    "http://localhost:3000/api/v1/messages/#{@id}"
  end

  def html
    return '' unless @body.length > 0
    start_index = @body.index('<!') || 0  
    @body[start_index, @body.length].html_safe
  end
end