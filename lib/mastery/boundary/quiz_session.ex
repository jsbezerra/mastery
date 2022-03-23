defmodule Mastery.Boundary.QuizSession do
  @moduledoc """
    A GenericServer implementation to manage quiz sessions.
  """

  alias Mastery.Core.{Quiz, Response}
  use GenServer

  @impl GenServer
  def init({quiz, email}) do
    {:ok, {quiz, email}}
  end

  @impl GenServer
  def handle_call(:select_question, _from, {quiz, email}) do
    quiz = Quiz.select_question(quiz)
    {:reply, quiz.current_question.asked, {quiz, email}}
  end

  @impl GenServer
  def handle_call({:answer_question, answer}, _from, {quiz, email}) do
    quiz
    |> Quiz.answer_question(Response.new(quiz, email, answer))
    |> Quiz.select_question()
    |> maybe_finish(email)
  end

  defp maybe_finish(nil, _email), do: {:stop, :normal, :finished, nil}

  defp maybe_finish(quiz, email) do
    {
      :reply,
      {quiz.current_question.asked, quiz.last_response.correct},
      {quiz, email}
    }
  end
end