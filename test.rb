require "langchain"

calculator = Langchain::Tool::Calculator.new
chat = Langchain::LLM::OpenAI.new(api_key: ENV["OPENAI_API_KEY"])

agent = Langchain::Agent::ReActAgent.new(
    llm: chat,
    tools: [calculator]
  )

output = agent.run(question: "What is 5^0.567?")
puts output