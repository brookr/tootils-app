$:.unshift "#{File.dirname(__FILE__)}/lib"
require 'active_record/acts/renderer'
ActiveRecord::Base.class_eval { include ActiveRecord::Acts::Renderer }
