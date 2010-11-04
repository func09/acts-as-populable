require 'active_record'

$LOAD_PATH.unshift(File.dirname(__FILE__))
require "acts_as_populable/acts_as_populable"
require "acts_as_populable/ranking"
$LOAD_PATH.shift

if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend ActsAsPopulable::Populable
end
