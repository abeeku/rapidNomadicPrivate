Paperclip::Attachment.default_options.update({
  :path => "/assets/uploads/:class/:attachment/:hash/:random_name_:style.:extension",
  :hash_secret => "spongetianabob"
})