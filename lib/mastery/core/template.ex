defmodule Mastery.Core.Template do
  @moduledoc """
    Templates are used to group, generate and check the responses of questions on a quiz.
  """
  defstruct ~w[name category instructions raw compiled generators check]a

end
