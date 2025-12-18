ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)
ENV["BOOTSNAP_CACHE_DIR"] ||= File.expand_path("../tmp/cache", __dir__)

require "fileutils"
FileUtils.mkdir_p(ENV["BOOTSNAP_CACHE_DIR"])

require "bundler/setup" # Set up gems listed in the Gemfile.
require "bootsnap/setup" # Speed up boot time by caching expensive operations.
