defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = KV.Bucket.start_link([])
    KV.Bucket.put(bucket, "milk", 3)
    %{bucket: bucket}
  end

  test "stores values by key", %{bucket: bucket} do
    # {:ok, bucket} = KV.Bucket.start_link([])
    # assert KV.Bucket.get(bucket, "milk") == nil

    # KV.Bucket.put(bucket, "milk", 3)
    assert KV.Bucket.get(bucket, "milk") == 3
  end

  test "removes values by key", %{bucket: bucket} do
    # KV.Bucket.put(bucket, "milk", 3)
    assert KV.Bucket.delete(bucket, "milk") == 3
  end


end
