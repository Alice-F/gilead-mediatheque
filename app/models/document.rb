class Document < ApplicationRecord
  # require 'roo'
  # require 'roo-xls'
  # require 'roo-google'

  include DatetimeHelper

  LANGUAGES = %w[FR EN]

  validates :title, presence: true
  validates :language, presence: true, inclusion: { in: LANGUAGES }
  validates :attachment, presence: true

  before_save :set_format

  scope :validated, -> { where.not(validation_at: nil) }

  has_one_attached :attachment

  def validated?
    validation_at.present?
  end

  private

  def content_type
    self.attachment.blob.content_type
  end

  def main_content_type
    content_type.split("/").first
  end

  def set_format
    case main_content_type
    when "image"
      self.format = "image"
    when "video"
      self.format = "video"
    when "application"
      case content_type
      when "application/pdf"
        self.format = "pdf"
      when "application/vnd.ms-powerpoint", "application/vnd.openxmlformats-officedocument.presentationml.presentation"
        self.format = "ppt"
      when "application/vnd.ms-excel", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        self.format = "xls"
      when "application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
        self.format = "word"
      else
        self.format = "other"
      end
    else
      self.format = "other"
    end
  end
end
