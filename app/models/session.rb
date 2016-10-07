class Session < ApplicationRecord
 include Userable

  validates :token, presence: true
  validates :token, uniqueness: true

  before_validation :generate_token

  private

  def generate_token
    return if self.token.present?
    loop do
      token_candidate = SecureRandom.hex
      unless Session.where(token: token_candidate).exists?
        self.token = token_candidate
        break
      end
    end
  end
end
