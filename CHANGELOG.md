# 1.1.2

- Relax the required ruby version to accommodate additional rubies
- Switched the rubygems source to https
- Removed the Gemfile.lock from version control
- Expanded the range of dependencies to test, trying to isolate a Rails 3.1 issue

# 1.1.1

- Do not set default value if the value has already been set (even if it was set to nil)

# 1.1.0

- Create `getter?` methods for attributes with default boolean values

# 1.0.2

- Allow attributes to be set during initialization
- Adds support for multiple activerecord 3 versions

# 1.0.0

- Drop support for Ruby 1.8.7
- Clean up gemspec and Gemfile
