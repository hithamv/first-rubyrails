module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    icon = (column == sort_column) ? (sort_direction == "asc" ? " ▲" : " ▼") : ""

    link_to "#{title}#{icon}".html_safe, { sort: column, direction: direction } # No need to merge params for session method
  end

  def sort_column
    Movie.column_names.include?(session[:sort]) ? session[:sort] : "title"
  end

  def sort_direction
    %w[asc desc].include?(session[:direction]) ? session[:direction] : "asc"
  end

  def highlight_column(column)
    if column == sort_column and sort_direction == 'asc'
      "background-color: #FFB74D; color: white; border-bottom: 2px solid #dddddd;"
    elsif column == sort_column and sort_direction == 'desc'
      "background-color: #FFFF00; color: white; border-bottom: 2px solid #dddddd;"
    else
      "background-color: #007bff; color: white; border-bottom: 2px solid #dddddd;"
    end
  end
end