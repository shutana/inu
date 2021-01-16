module ApplicationHelper
  #def simple_time(time)
    #time.strftime("%Y-%m-%d<br />%H:%M:%S")
  #end

  def anniversary_date(dating_start_date)
    today = Date.current
    dead_line = Date.new(dating_start_date.strftime("%Y").to_i, dating_start_date.strftime("%m").to_i ,dating_start_date.strftime("%d").to_i)
    remain = (today - dead_line).to_i
  end
end
