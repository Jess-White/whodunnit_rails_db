class Api::UgQuestionsController < ApplicationController

    def index
      @ug_questions = UgQuestion.all
      @ug_questions = @ug_questions.order(id: :desc)
      render "index.json.jb"
    end

    def create
      @ug_question = UgQuestion.new(
        title: params[:title],
        correct: params[:correct],
      )
      if @ug_question.save
        render "show.json.jb"
      else
        render json: { errors: @question.errors.full_messages }, status: :bad_request
      end
    end

    def show
      @ug_question = UgQuestion.find(params[:id])
      render "show.json.jb"
    end

    def update
      @ug_question = UgQuestion.find(params[:id])
      @ug_question.title = params[:title] || @ug_question.title
      @ug_question.correct = params[:correct] || @ug_question.correct
      if @ug_question.save
        render "show.json.jb"
      else
        render json: { errors: @ug_question.errors.full_messages }, status: :unprocessable_entity
      end
    end

    def destroy
      ug_question = UgQuestion.find(params[:id])
      ug_question.destroy
      render json: { message: "user generated question successfully destroyed!" }
    end

end
