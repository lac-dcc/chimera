library	IEEE;
use	IEEE.STD_LOGIC_1164.ALL;
use	IEEE.NUMERIC_STD.ALL;

use	work.json.all;


entity Boards is
	Generic (
		C_PROJECT_DIR: string := "D:\git\GitHub\JSON-for-VHDL"
	);
	Port (
		Clock	: in	STD_LOGIC;
		Reset	: in	STD_LOGIC;
		LED		: out	STD_LOGIC_VECTOR (7 downto 0)
	);
end entity;


architecture rtl of Boards is
	-- define a json file and parse its content
	constant ConfigFile		: STRING		:= C_PROJECT_DIR & "/Data/Boards0.json";
	constant JSONContent	: T_JSON		:= jsonLoadFile(ConfigFile);

	constant CounterSize	: INTEGER		:= jsonGetInteger(JSONContent, "1/2");

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

	-- dummy signal so the entity is not empty for synthesis
	signal Counter_us	: UNSIGNED(CounterSize - 1 downto 0)		:= (others => '0');

begin
	-- report a JSON parser error if one occured
	assertMessage(jsonNoParserError(JSONContent), "JSON parser error: " & jsonGetErrorMessage(JSONContent));

	-- dump the internal compressed STRING buffer
--	printMessage("JSONContent.Content: " & jsonTrim(JSONContent.Content));

	-- dump the internal index structure
	-- ===========================================================================
	-- for Vivado, because assert statements got removed from the VHDL feature list
--	process
--		variable StringBuffer		: STRING(1 to 2**15);
--		variable StringWriter		: T_UINT16;
--	begin
--		jsonStringClear(StringBuffer, StringWriter);
--		jsonReportIndex(JSONContent.Index(0 to JSONContent.IndexCount - 1), JSONContent.Content(1 to JSONContent.ContentCount), StringBuffer, StringWriter);
--		printMessage(StringBuffer(1 to StringWriter - 1));
--		wait;
--	end process;

	-- ===========================================================================
	-- for ISE, because wait; is not supported in synthesis
--	printMessage(transform);

	-- select a value from the data structure
	printMessage("jsonGetString(..., '1/2'):                       " & INTEGER'image(CounterSize));

	-- do something important
	process(Clock)
	begin
		if rising_edge(Clock) then
			Counter_us	<= Counter_us + 1;
		end if;
	end process;

	LED			<= (others => Counter_us(Counter_us'high));
end architecture;
