xml.instruct!
xml.list do
  if rate.empty?
    xml.item
  else
    xml.item rate[40]['device_id']
  end
end