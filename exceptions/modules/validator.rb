# frozen_string_literal: true


module Validator
  def valid?
    validate!
    true
  rescue StandardError
    false
  end

  protected

  def validate!
    raise "Not implemented"
  end
end
