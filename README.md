# dir-css
Stylesheet for displaying a HTML table list of files
## Using the converter Ruby script
As this stylesheet is for use with file directories, the converter script requires the last cells on each row (excluding header) of the imported CSV file to be a file path. Use the mockaroo.csv example as a reference.

Run the `convert.rb` script through the command line:
```
ruby ./convert.rb <input csv path> <export html path> <optional title>
```
Example:
```
ruby ./convert.rb ./mockaroo.csv ./index.html "Repository"
ruby ./convert.rb ./example.csv ./index.html
```