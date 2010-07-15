User.find(:all).each do |user|
  user.plugins.create(:name => "system_tables",
                      :position => (user.plugins.maximum(:position) || -1) +1)
end
