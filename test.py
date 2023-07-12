from langchain.llms import OpenAI
from langchain import LLMMathChain
from langchain.chat_models import ChatOpenAI
from langchain.schema import HumanMessage
from langchain.agents import load_tools, initialize_agent, AgentType
import os

chat = ChatOpenAI(openai_api_key=os.environ['OPENAI_API_KEY'], model="gpt-4")
# output = chat([HumanMessage(content="What is 5 + 120 * 4 / 9?")])
llm_math = LLMMathChain.from_llm(chat, verbose=True)

output = llm_math.run("What is 12 * 3 / 8? A. 4.5 B. 3.5 C. 2.5 D. 1.5")
print(output)
