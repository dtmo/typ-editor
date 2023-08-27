Document = Line*
Line = _? line:(SectionLine / PropertyLine / CommentLine / ValueLine)? _? EOL { return {
    "line": line
    } }
SectionLine = "[" sectionName:SectionName "]" { return {
    "type": "section",
    "location": location(),
    "sectionName": sectionName } }
PropertyLine = key:Key "=" value:Value { return {
    "type": "property",
    "location": location(),
    "key": key, 
    "value": value } }
ValueLine = value:Value { return {
    "type": "value",
    "location": location(),
    "value": value } }
CommentLine = ";" comment:Comment { return {
    "type": "comment",
    "location": location(),
    "comment": comment
    } }
SectionName = sectionName:([^\]]+) { return sectionName.join("") }
Key = key:([^\r\n=]+) { return key.join("") }
Value = value:([^\r\n]+) { return value.join("") }
Comment = comment:([^\r\n]+) { return comment.join("") }

_ = [ \t]+
EOL = [\r\n]
