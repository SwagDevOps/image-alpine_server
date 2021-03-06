# frozen_string_literal: true

require_relative '../boot'

# Almost a namespace.
module Boot::SSH
  autoload(:Pathname, 'pathname')

  # @formatter:off
  {
    Auth: 'auth',
  }.each { |s, fp| autoload(s, Pathname.new(__dir__).join("ssh/#{fp}")) }
  # @formatter:on
end
