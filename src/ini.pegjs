IniFile = Line* EndOfFile
Line = (SectionDeclaration / Comment / PropertyAssignment)? EndOfLine
SectionDeclaration = "[" SectionName "]"
SectionName = (!"]" .)+
Comment = [#;] (!EndOfLine .)*
PropertyAssignment = PropertyName "=" PropertyValue
PropertyName = (!"=" .)+
PropertyValue = (!EndOfLine .)*
EndOfLine = "\r\n" / "\r" / "\n"
EndOfFile = !.
