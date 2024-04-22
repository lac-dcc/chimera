library	IEEE;
use	IEEE.STD_LOGIC_1164.ALL;
use	IEEE.NUMERIC_STD.ALL;

use	work.json.all;


entity Boards2 is
	Generic (
		C_PROJECT_DIR: string := "D:\git\GitHub\JSON-for-VHDL"
	);
	Port (
		Clock	: in	STD_LOGIC;
		Reset	: in	STD_LOGIC;
		LED		: out	STD_LOGIC_VECTOR (7 downto 0)
	);
end entity;


architecture rtl of Boards2 is
	-- define a json file and parse its content
	constant ConfigFile		: STRING		:= C_PROJECT_DIR & "/data/Boards2.json";
	constant JSONContent	: T_JSON		:= jsonLoad(ConfigFile);

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
	signal Toggle	: STD_LOGIC		:= '0';

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
	printMessage(transform);

	-- select different values from data structure
	printMessage("jsonGetString(..., 'KC705/FPGADevice'):                       " & jsonGetString(JSONContent, "KC705/FPGADevice"));
	printMessage("jsonGetString(..., 'KC705/IIC/0/Devices/1/Type'):             " & jsonGetString(JSONContent, "KC705/IIC/0/Devices/1/Type"));
	printMessage("jsonGetString(..., 'DE4/Ethernet/2/PHY_ManagementInterface'): " & jsonGetString(JSONContent, "DE4/Ethernet/2/PHY_ManagementInterface"));

	-- printMessage("jsonGetString(..., 'DE4/Ethernet/2/PHY_ManagementInterface'): " & jsonGetString(JSONContent, "Boards/ML505/UART/Device"));
	-- printMessage("jsonGetString(..., 'DE4/Ethernet/2/PHY_ManagementInterface'): " & jsonGetString(JSONContent, "Boards/ML505/PHY"));
	-- printMessage("jsonGetString(..., 'DE4/Ethernet/2/PHY_ManagementInterface'): " & jsonGetString(JSONContent, "Boards/ML505/Eth/0/Device"));
	-- printMessage("jsonGetString(..., 'DE4/Ethernet/2/PHY_ManagementInterface'): " & jsonGetString(JSONContent, "Boards/KC705/Eth/1/Vendor"));
	-- printMessage("jsonGetString(..., 'DE4/Ethernet/2/PHY_ManagementInterface'): " & jsonGetString(JSONContent, "Boards/KC705/Eth/3/IIC/0/Devices/0/Name"));

	-- do something important
	Toggle	<= not Toggle when rising_edge(Clock);
	LED			<= (others => Toggle);
end architecture;
