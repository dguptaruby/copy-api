module CopyMethods
  GREETING = 'greeting'.freeze
  GREETING_VIP = 'greetingVIP'.freeze
  INTRO_CREATED_AT = 'intro.created_at'.freeze
  INTRO_UPDATED_AT = 'intro.updated_at'.freeze
  TIME = 'time'.freeze

  def greeting
    copy = @copy_base['records'].select { |record| record['fields']['key'] == GREETING }.first['fields']['copy']
    copy.gsub!(/\{name\}/, params[:name]).gsub!(/\{app\}/, params[:app])
  end

  def greeting_vip
    value = greeting
    copy = @copy_base['records'].select { |record| record['fields']['key'] == GREETING_VIP }.first['fields']['copy']
    copy.gsub('{greeting}', value) if copy.present?
  end

  def intro_created_at
    copy = @copy_base['records'].select do |record|
             record['fields']['key'] == INTRO_CREATED_AT
           end.first['fields']['copy']
    time = Time.at(params[:created_at].to_i).to_datetime
    copy.gsub('{created_at, datetime}', time.to_s)
  end

  def intro_updated_at
    copy = @copy_base['records'].select do |record|
             record['fields']['key'] == INTRO_UPDATED_AT
           end.first['fields']['copy']
    time = Time.at(params[:created_at].to_i).to_datetime
    copy.gsub('{updated_at, datetime}', time.to_s) 
  end

  def time
    copy = @copy_base['records'].select do |record|
             record['fields']['key'] == TIME
           end.first['fields']['copy']
    time = Time.at(params[:time].to_i).to_datetime
    copy.gsub('{time, datetime}', time.to_s) 
  end
end
