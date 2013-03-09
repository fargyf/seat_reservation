#https://github.com/railscasts/213-calendars-revised/blob/master/blog-after/app/helpers/calendar_helper.rb
module AtlasHelper
  # x,y for the matrix of n*n
  def atlas(x = 0, y = 0, seats = [], &block)
    Atlas.new(self, x, y, seats, block).table
  end

  class Atlas < Struct.new(:view, :x_max, :y_max, :seats, :callback)
    #http://api.rubyonrails.org/classes/Module.html#method-i-delegate
    delegate :content_tag, to: :view

    def table
      content_tag :table, class: "atlas" do
        #header + rows
        arraies
      end
    end

    #def header
      #content_tag :tr do
        #HEADER.map { |day| content_tag :th, day }.join.html_safe
      #end
    #end

    def rows
      seats.in_groups_of(x_max)
    end

    def arraies
      content_tag :tbody, id: 'sortable-items' do
        rows.map do |row|
          content_tag :tr do
            row.map { |cell| body_cell(cell) }.join.html_safe
          end
        end.join.html_safe
      end
    end

    def body_cell(cell)
      content_tag :td, view.capture(cell, &callback)
      #content_tag :td, view.capture(cell, &callback), class: cell_classes(cell)
    end

    #def cell_classes(cell)
      #classes = []
      #classes << "today" if day == Date.today
      #classes << "notmonth" if day.month != date.month
      #classes.empty? ? nil : classes.join(" ")
    #end
  end
end
