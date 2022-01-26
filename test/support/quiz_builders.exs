defmodule QuizBuilders do
  defmacro __using__(_options) do
    quote do
      alias Mastery.Core.{Quiz, Response, Template}
      import QuizBuilders, only: :functions
    end
  end

  alias Mastery.Core.{Quiz, Response, Template}

  def template_fields(overrides \\ []) do
    Keyword.merge(
      [
        name: :single_digit_addition,
        category: :addition,
        instructions: "Add the numbers",
        raw: "<%= @left %> + <%= @right %>",
        generators: addition_generators(single_digits()),
        checker: &addition_checker/2
      ],
      overrides
    )
  end
end
