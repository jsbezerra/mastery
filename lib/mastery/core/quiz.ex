defmodule Mastery.Core.Quiz do
  @moduledoc """
    A `Mastery` quiz will ask questions until a user achieves mastery.
  """

  defstruct title: nil,
            mastery: 3,
            templates: %{},
            used: [],
            current_question: nil,
            last_response: nil,
            record: %{},
            mastered: []
end
