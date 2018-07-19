class AnswerControllerController < ApplicationController
  def answer
	@answer = Answer.new(:answer)
	@answer.save
  end
end
