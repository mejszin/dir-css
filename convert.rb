# Return if no arguments given
return if ARGV.length <= 1
# Get arguments
input_path = ARGV[0]
export_path = ARGV[1]
title = ARGV.length > 2 ? ARGV[2] : ""
# Return if invalid file path
return unless File.exist?(input_path)
# Set values
lines = File.readlines(input_path)
columns = lines.last.split(",").length
# Create HTML title table
html_title = title == "" ? "" : "<table class=\"title\"><tr><td>#{title}</td></tr></table>"
# Create HTML content table
html_table = "<table class=\"dir\">"
lines.each_with_index do |line, row|
    tag = (row == 0) ? "thead" : "tbody"
    cells = line.chomp.split(",")
    html_row = cells.map.with_index do |cell, column| 
        if ((column == 0) && (row > 0))
            "<td><a href=\"#{cells.last}\">#{cell}</a></td>"
        elsif (column != columns - 1)
            "<td>#{cell}</td>"
        end
    end
    html_table += "<#{tag}><tr>#{html_row.join}</tr></#{tag}>"
end
html_table += "</table>"
# Construct HTML
html_head = "<head><title>#{title}</title><link rel=\"stylesheet\" type=\"text/css\" href=\"dir.css\"></head>"
html_body = "<body>#{html_title}#{html_table}</body>"
html = "<!DOCTYPE html><html>#{html_head}#{html_body}</html>"
# Write to file
File.write(export_path, html)