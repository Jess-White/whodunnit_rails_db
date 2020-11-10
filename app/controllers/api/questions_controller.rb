class Api::QuestionsController < ApplicationController

    def index
      @questions = Question.all
      @questions = @questions.order(id: :desc)
      render "index.json.jb"
    end

    def create
      @question = Question.new(
        title: params[:title],
        correct: params[:correct],
      )
      if @question.save
        render "show.json.jb"
      else
        render json: { errors: @question.errors.full_messages }, status: :bad_request
      end
    end

    def show
      @question = Question.find(params[:id])
      render "show.json.jb"
    end

    def update
      @question = Question.find(params[:id])
      @question.title = params[:title] || @question.title
      @question.correct = params[:correct] || @question.correct
      if @question.save
        render "show.json.jb"
      else
        render json: { errors: @question.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      question = Question.find(params[:id])
      question.destroy
      render json: { message: "question successfully destroyed!" }
    end

end
