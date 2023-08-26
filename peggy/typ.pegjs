Document = Line*
Line = _? line:(SectionLine / PropertyLine / CommentLine / ValueLine)? _? EOL { return {
  "line": line
  } }
SectionLine = "[" sectionName:SectionName "]" { return {
  "location": location(),
  "type": "section",
  "sectionName": sectionName } }
PropertyLine = key:Key "=" value:Value { return {
  "location": location(),
  "type": "property",
  "key": key, 
  "value": value } }
ValueLine = value:Value { return {
  "location": location(),
  "type": "value",
  "value": value } }
CommentLine = ";" comment:Comment { return {
  "location": location(),
  "type": "comment",
  "comment": comment
  } }
SectionName = sectionName:([^\]]+) { return sectionName.join("") }
Key = key:([^\r\n=]+) { return key.join("") }
Value = value:([^\r\n]+) { return value.join("") }
Comment = comment:([^\r\n]+) { return comment.join("") }

_ = [ \t]+
EOL = [\r\n]
