defmodule Mastery do
  @moduledoc """
    Defines the application.
  """

  alias Mastery.Boundary.{QuizManager, QuizSession}
  alias Mastery.Boundary.{QuizValidator, TemplateValidator}
  alias Mastery.Core.Quiz
  alias Mastery.Examples.Math

  def start_quiz_manager do
    GenServer.start_link(QuizManager, %{}, name: QuizManager)
    Mastery.build_quiz Math.quiz_fields
    Mastery.add_template Math.quiz.title, Math.template_fields
    Mastery.take_quiz Math.quiz.title, "mathy@email.com"
  end

  def build_quiz(fields) do
    with :ok <- QuizValidator.errors(fields),
         :ok <- QuizManager.build_quiz(fields),
         do: :ok,
         else: (error -> error)
  end

  def add_template(title, fields) do
    with :ok <- TemplateValidator.errors(fields),
         :ok <- QuizManager.add_template(title, fields),
         do: :ok,
         else: (error -> error)
  end

  def take_quiz(title, email) do
    with %Quiz{} = quiz <- QuizManager.lookup_quiz_by_title(title),
         {:ok, session} <- GenServer.start_link(QuizSession, {quiz, email}) do
      session
    else
      error -> error
    end
  end

  def select_question(session) do
    QuizSession.select_question(session)
  end

  def answer_question(session, answer) do
    QuizSession.answer_question(session, answer)
  end
end
