module PageHelper

  def calendar(month , year)

    #mon = Integer(month)
    #yr  = Integer(year)
    current_date = Date.new( year , month , 1)

    prev_month = month-1
    prev_year  = year
    if(prev_month <= 0)
      prev_month = 12
      prev_year  = year -1
    end

    #"/page/calendar?month=#{prev_month}&year=#{prev_year}"
    cal = link_to "Prev",calendar_path(:month => prev_month , :year => prev_year)

    cal += current_date.strftime("%B")
    day_of_week = current_date.strftime("%w").to_i
    cal += "<table border = '1'>\n\t <tr>\n"
    days = %w(Sun Mon Tue Wed Thu Fri Sat)
    days.each do | day |
      cal+= "\t\t<td> #{day} </td>\n"

    end
    cal += "<tr>"
    day_of_week.times do |day|
      cal += "<td>&nbsp;</td>"
    end
    # print the days of week starting with 1
    (7-day_of_week).times do |day|
      cal += "<td>#{day+1}</td>"
    end
    cal += "</tr>"
    cal +=  "\t</tr>\n</table>\n"
    cal += "Month: #{month} <br/> Year: #{year}<br/>"
    cal += "Date: #{current_date}<br/>"
    cal += day_of_week.to_s


    return cal.html_safe
    end
  end
