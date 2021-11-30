defmodule Mastery.Core.Response do
  @moduledoc """
    The response to a `Mastery.Core.Question` given by the user.
  """

  alias Mastery.Core.Quiz

  defstruct ~w[quiz_title template_name to email answer correct timestamp]a

  @doc """
  Creates a new response for the given `quiz`, `email` and `answer`.

  Returns `Response`.
  """
  @spec new(Quiz.t(), String.t(), String.t()) :: Response.t()
  def new(quiz, email, answer) do
    question = quiz.current_question
    template = question.template

    %__MODULE__{
      quiz_title: quiz.title,
      template_name: template.name,
      to: question.asked,
      email: email,
      answer: answer,
      correct: template.checker.(question.substitutions, answer),
      timestamp: DateTime.utc_now()
    }
  end
end
