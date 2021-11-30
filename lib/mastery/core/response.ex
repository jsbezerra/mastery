defmodule Mastery.Core.Response do
  @moduledoc """
    The response to a `Mastery.Core.Question` given by the user.
  """

  defstruct ~w[quiz_title template_name to email answer correct timestamp]a
end
