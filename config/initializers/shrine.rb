require "shrine"
require "shrine/storage/file_system"

if Rails.env.development?
  require "shrine/storage/file_system"
  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
    store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store")
  }
elsif Rails.env.test?
  require 'shrine/storage/memory'
  Shrine.storages = {
    cache: Shrine::Storage::Memory.new,
    store: Shrine::Storage::Memory.new
  }
else
  require "shrine/storage/s3"
  s3_options = {
    access_key_id:     ENV['AWS_ACCESS_KEY'], 
    secret_access_key: ENV['AWS_SECRET_KEY'], 
    region:            ENV['S3_REGION'],
    bucket:            ENV['S3_BUCKET'] 
  }
  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
    store: Shrine::Storage::S3.new(prefix: "store", **s3_options)
  }
end
Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data