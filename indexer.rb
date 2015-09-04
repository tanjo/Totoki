# encoding: utf-8
require 'redcarpet'

HEADER = <<-EOS
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Index</title>
  <link rel="stylesheet" type="text/css" href="github.css">
</head>
<body>
EOS

FOOTER = <<-EOS
</body>
</html>
EOS

markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
  autolink: true,
  tables: true,
  fenced_code_blocks:  true,
  highlight:           true,
  )

if ARGV[0] == nil then
  html = markdown.render File.read("README.md")
  File.open("index.html", "w:utf-8") { |f|f.print HEADER + html + FOOTER}
else

  path = ARGV[0].chomp('/')
  html = markdown.render File.read("#{path}/README.md")
  File.open("#{path}/index.html", "w:utf-8") { |f|f.print HEADER + html + FOOTER}
end
