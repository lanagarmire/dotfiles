# ruby 1.8.7 compatible
require 'rubygems'
require 'irb/completion'
require 'pp'

# configure irb
# IRB.conf[:PROMPT_MODE] = :SIMPLE

# irb history
IRB.conf[:EVAL_HISTORY] = 1000
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = File::expand_path("~/.irbhistory")

# load .railsrc in rails environments
railsrc_path = File.expand_path('~/.irbrc_rails')
if ( ENV['RAILS_ENV'] || defined? Rails ) && File.exist?( railsrc_path )
  begin
    load railsrc_path
  rescue Exception
    warn "Could not load: #{ railsrc_path } because of #{$!.message}"
  end
end

class Object
  def interesting_methods
    case self.class
    when Class
      self.public_methods.sort - Object.public_methods
    when Module
      self.public_methods.sort - Module.public_methods
    else
      self.public_methods.sort - Object.new.public_methods
    end
  end
end

def timed(&block)
  started_at = Time.now
  yield
ensure
  puts "Completed in #{((Time.now - started_at) * 1000).to_i}ms"
end
