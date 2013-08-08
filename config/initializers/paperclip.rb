Paperclip.interpolates :random_name do |style, attachment|
  extension = File.extname(filename).downcase
  "#{SecureRandom.hex(16)}#{extension}"
end
