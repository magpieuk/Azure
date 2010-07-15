# save this as vendor/plugins/attachment_fu_hacks/init.rb

require 'aws/s3'

Technoweenie::AttachmentFu::Backends::S3Backend.module_eval do
  # Hacked to use new S3 addressing, which lets us use EU buckets.
  # Requires sauberia's fork of aws-3s: http://github.com/sauberia/aws-s3
  #
  # All public objects are accessible via a GET request to the S3 servers. You can generate a
  # url for an object using the s3_url method.
  #
  #   @photo.s3_url
  #
  # The resulting url is in the form: <tt>http(s)://:bucket_name.:server/:table_name/:id/:file</tt> where
  # the <tt>:server</tt> variable defaults to <tt>AWS::S3 URL::DEFAULT_HOST</tt> (s3.amazonaws.com) and can be
  # set using the configuration parameters in <tt>RAILS_ROOT/config/amazon_s3.yml</tt>.
  #
  # The optional thumbnail argument will output the thumbnail's filename (if any).
  def s3_url(thumbnail = nil)
    File.join(s3_protocol + bucket_name + '.' + s3_hostname + s3_port_string, full_filename(thumbnail))
  end
end