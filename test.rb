require "langchain"

wikipedia = Langchain::Tool::Wikipedia.new
calculator = Langchain::Tool::Calculator.new
chat = Langchain::LLM::OpenAI.new(api_key: ENV["OPENAI_API_KEY"])

agent = Langchain::Agent::ReActAgent.new(
    llm: chat,
    tools: [wikipedia, calculator]
  )

# output = agent.run(question: "WHo won the 2022 world cup?")
# puts output
pdf = Langchain::Loader.load('https://cabmakassar.org/wp-content/uploads/2020/05/The-Philosophy-Book-DK.pdf')
all_text = ""
pdf.pages.each do |page|
    all_text << page.text
end
puts all_text