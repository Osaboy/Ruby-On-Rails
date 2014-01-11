<<-DOC
  Angry boss. Write an angry boss program that rudely asks what you want.
  Whatever you answer, the angry boss should yell it back to you and then
  fire you. For example, if you type in I want a raise, it should yell back like
  this:
  WHADDAYA MEAN "I WANT A RAISE"?!? YOU'RE FIRED!!
DOC

bosses_question = "What do you want?"
puts bosses_question
workers_response = gets.chomp
puts "WHADDAYA MEAN \"" + workers_response.upcase + "\"?!? YOU\'RE FIRED!!" 

