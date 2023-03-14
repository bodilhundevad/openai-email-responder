class EmailGenerator
  attr_reader :body

  def initialize(email)
    @email = email
    @body =  {
      model: "text-davinci-001",
      prompt: generate_prompt,
      max_tokens: 150
    }
  end

  def email_message
    call.dig("choices", 0, "text")
  end

  def client
    OpenAI::Client.new
  end

  def call #calls api endpoint to get the response
    client.completions(parameters: @body)
  end

  def generate_prompt
    # combine all the necessary fields to form a complete prompt
    prompt = "Write an email including Greeting and Salutation.\n"
    prompt += "The email should be a response from me to this email: '#{@email.received}'.\n" if @email.received.present?
    prompt += "It should say that #{@email.description}.\n" if @email.description.present?
    prompt += "The tonality of the email should be '#{@email.tonality}'."
    prompt
  end
end
