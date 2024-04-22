library	IEEE;
use	IEEE.STD_LOGIC_1164.ALL;
use	IEEE.NUMERIC_STD.ALL;

library json;
use	json.json.all;


entity TopLevel is
end entity;


architecture rtl of TopLevel is
	-- define a json file and parse its content
	constant JSONContent	: T_JSON		:= jsonLoadFile(C_JSON_FILE);

	procedure assertMessage(cond : BOOLEAN; msg : STRING) is
	begin
		if (cond = FALSE) then report msg severity NOTE; end if;
	end procedure;

	procedure printMessage(msg : STRING) is
	begin
		report msg severity NOTE;
	end procedure;

	function transform return STRING is
		variable StringBuffer		: STRING(1 to 2**15);
		variable StringWriter		: T_UINT16;
	begin
		jsonStringClear(StringBuffer, StringWriter);
		jsonReportIndex(JSONContent.Index(0 to JSONContent.IndexCount - 1), JSONContent.Content(1 to JSONContent.ContentCount), StringBuffer, StringWriter);
		return StringBuffer(1 to StringWriter - 1);
	end function;

begin
	-- report a JSON parser error if one occured
	assertMessage(jsonNoParserError(JSONContent), "JSON parser error: " & jsonGetErrorMessage(JSONContent));

	-- dump the internal compressed STRING buffer
	-- printMessage("JSONContent.Content: " & jsonTrim(JSONContent.Content));

	-- Undocumented
	-- printMessage(transform);

	-- select a value from the data structure (JSONPath expression)
	-- printMessage("jsonGetString(..., '1/2'):                       " & INTEGER'image(jsonGetInteger(JSONContent, "1/2")));
end architecture;
