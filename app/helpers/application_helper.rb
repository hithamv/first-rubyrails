module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    icon = (column == sort_column) ? (sort_direction == "asc" ? " ▲" : " ▼") : ""
    link_to "#{title}#{icon}".html_safe, { sort: column, direction: direction }
  end

  def sort_column
    Movie.column_names.include?(params[:sort]) ? params[:sort] : "title"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def highlight_column(column)
    if column == sort_column
      "background-color: #ff9800; color: white; border-bottom: 2px solid #dddddd;"
    else
      "background-color: #007bff; color: white; border-bottom: 2px solid #dddddd;"
    end
  end
end
