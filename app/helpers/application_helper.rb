module ApplicationHelper
  def time_to_string(time)
    if time.nil?
      "Не оценена"
    else
      h = time/60
      m = time%60

      "#{h} #{Russian::pluralize(h, 'час', 'часа', 'часов')} #{m} #{Russian::pluralize(m,'минута','минуты','минут')}"
    end

  end
end
