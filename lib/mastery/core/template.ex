defmodule Mastery.Core.Template do
  @moduledoc """
    Templates are used to group, generate and check the responses of questions on a quiz.
  """
  defstruct ~w[name category instructions raw compiled generators check]a

  def new(fields) do
    raw = Keyword.fetch!(fields, :raw)

    struct!(
      __MODULE__,
      Keyword.put(fields, :compiled, EEx.compile_string(raw))
    )
  end
end
