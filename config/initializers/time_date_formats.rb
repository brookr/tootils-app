
ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!(
  :default => "%m-%d-%Y %I:%M%p",
  :date_time12 => "%m-%d-%Y %I:%M%p",
  :date_time24 => "%m-%d-%Y %H:%M",
  :small => "%b %e, %l:%M %p",
  :gruber => lambda { |time| Date::DAYNAMES[time.strftime("%w").to_i] + time.strftime(", %e %b %Y") },
  :two_line => "<span>%b %e</span><br /><span>%l:%M %p</span>",
  :db => "%Y-%m-%d %H:%M:%S",
  :ymd => "%Y-%m-%d",
  :year => "%Y",
  :day => "%b %e, %Y",
  :time => "%I:%M %p",
  :HMS => "%H:%M:%S",
  :YqQ => lambda { |date| date.strftime("%Yq" + (date.month/3.0).ceil.to_s) }
)
ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS.merge!(
  :small => "%b %e",
  :md => lambda { |date| date.strftime("%b #{date.day.ordinalize}") },
  :Md => lambda { |date| date.strftime("%B #{date.day.ordinalize}") },
  :mdy => lambda { |date| date.strftime("%b #{date.day.ordinalize}, %Y") },
  :db => "%Y-%m-%d",
  :ymd => "%Y-%m-%d",
  :year => "%Y",
  :day => "%b %e, %Y",
  :YqQ => lambda { |date| date.strftime("%Yq" + (date.month/3.0).ceil.to_s) }
)
