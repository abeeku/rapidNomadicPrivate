Paperclip::Attachment.default_options.update({
  :path => ":class/:attachment/:hash/:style.:extension",
  :hash_secret => "SOME_RANDOM_SECRET"
})