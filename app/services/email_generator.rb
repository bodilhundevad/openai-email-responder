class EmailGenerator
  def initialize(email)
    @email = email
  end

  def email_message
    call.dig("choices", 0, "text")
  end

  def client
    OpenAI::Client.new
  end

  def call #calls api endpoint to get the response
    parameters = get_openai_parameters(@email)
    client.completions(parameters: parameters)
  end

  def get_openai_parameters(email)
    {
      model: "text-davinci-001",
      prompt: generate_prompt(email),
      max_tokens: 150
    }
  end

  # Logic for prompt generation based on email instance
  def generate_prompt(email)
    "Generate an email example for sending a job application"
  end
end
