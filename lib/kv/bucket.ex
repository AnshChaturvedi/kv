defmodule KV.Bucket do
  use Agent

  @doc """
  Starts a new bucket
  """
  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  @doc """
  Gets a value from the `bucket` by `key`
  """
  def get(bucket, key) do
    Agent.get(bucket, fn cur_map -> Map.get(cur_map, key) end)
  end

  @doc """
  Puts the `value` for the given `key` in `bucket`
  """
  def put(bucket, key, value) do
    Agent.update(bucket, fn cur_map -> Map.put(cur_map, key, value) end)
  end

  @doc """
  Deletes `key` from `bucket`, and returns the current value of `key` if it exists
  """
  def delete(bucket, key) do
    Agent.get_and_update(bucket, &Map.pop(&1, key))
  end
end
