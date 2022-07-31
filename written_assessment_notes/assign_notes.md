# assignment notes from LS website

— Explain your reasoning with reference to specific lines…
— Answer with extreme precision…
— Highlight any specific syntactical conventions or technical observations where relevant.
— Identify the key fundamental concept or concepts being demonstrated in the question.

    greeting = 'Hello'

    loop do
      greeting = 'Hi'
      break
    end

    puts greeting

Model answer: 
The local variable greeting is assigned to the String 'Hello' on line 1. The do..end alongside the loop method invocation on lines 3 to 6 defines a block, within which greeting is reassigned to the String Hi on line 4. The puts method is called on line 8 with the variable greeting passed to it as an argument; since greeting is now assigned to 'Hi', this is what is output. This example demonstrates local variable scoping rules in Ruby; specifically the fact that a local variable initialized outside of a block is accessible inside the block.

notes on this:
  - every line is described in this answer as well as what each line of code actually does
  - every method is explicitly named
  - higher-order concepts like scoping are explicity named and described

