----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:45:27 01/31/2011 
-- Design Name: 
-- Module Name:    NMS - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity NMS is
port(
		inp11, inp12, inp13, inp14, inp15, inp16, inp17 : in std_logic_vector(12 downto 0);
		inp21, inp22, inp23, inp24, inp25, inp26, inp27 : in std_logic_vector(12 downto 0);
		inp31, inp32, inp33, inp34, inp35, inp36, inp37 : in std_logic_vector(12 downto 0);
		inp41, inp42, inp43, inp44, inp45, inp46, inp47 : in std_logic_vector(12 downto 0);
		inp51, inp52, inp53, inp54, inp55, inp56, inp57 : in std_logic_vector(12 downto 0);
		inp61, inp62, inp63, inp64, inp65, inp66, inp67 : in std_logic_vector(12 downto 0);
		inp71, inp72, inp73, inp74, inp75, inp76, inp77 : in std_logic_vector(12 downto 0);
		x_coord_in, y_coord_in : in std_logic_vector(9 downto 0);
		x_coord_out, y_coord_out : out std_logic_vector(9 downto 0);
		iscorner, clk, EN : in std_logic;
		corner_out : out std_logic
);
end NMS;

architecture Behavioral of NMS is

signal comp11, comp12, comp13, comp14, comp15, comp16, comp17 : std_logic;
signal comp21, comp22, comp23, comp24, comp25, comp26, comp27 : std_logic;
signal comp31, comp32, comp33, comp34, comp35, comp36, comp37 : std_logic;
signal comp41, comp42, comp43, comp45, comp46, comp47 : std_logic;
signal comp51, comp52, comp53, comp54, comp55, comp56, comp57 : std_logic;
signal comp61, comp62, comp63, comp64, comp65, comp66, comp67 : std_logic;
signal comp71, comp72, comp73, comp74, comp75, comp76, comp77 : std_logic;

signal iscorner_d : std_logic;
signal x_coord_d, y_coord_d : std_logic_vector(9 downto 0);

begin

compare : process(clk)
begin
	
	if clk='1' and clk'event then
		if EN='1' then 

			if unsigned(inp44)>unsigned(inp11) then comp11<='1'; else comp11<='0'; end if;
			if unsigned(inp44)>unsigned(inp12) then comp12<='1'; else comp12<='0'; end if;
			if unsigned(inp44)>unsigned(inp13) then comp13<='1'; else comp13<='0'; end if;
			if unsigned(inp44)>unsigned(inp14) then comp14<='1'; else comp14<='0'; end if;
			if unsigned(inp44)>unsigned(inp15) then comp15<='1'; else comp15<='0'; end if;
			if unsigned(inp44)>unsigned(inp16) then comp16<='1'; else comp16<='0'; end if;
			if unsigned(inp44)>unsigned(inp17) then comp17<='1'; else comp17<='0'; end if;

			if unsigned(inp44)>unsigned(inp21) then comp21<='1'; else comp21<='0'; end if;
			if unsigned(inp44)>unsigned(inp22) then comp22<='1'; else comp22<='0'; end if;
			if unsigned(inp44)>unsigned(inp23) then comp23<='1'; else comp23<='0'; end if;
			if unsigned(inp44)>unsigned(inp24) then comp24<='1'; else comp24<='0'; end if;
			if unsigned(inp44)>unsigned(inp25) then comp25<='1'; else comp25<='0'; end if;
			if unsigned(inp44)>unsigned(inp26) then comp26<='1'; else comp26<='0'; end if;
			if unsigned(inp44)>unsigned(inp27) then comp27<='1'; else comp27<='0'; end if;

			if unsigned(inp44)>unsigned(inp31) then comp31<='1'; else comp31<='0'; end if;
			if unsigned(inp44)>unsigned(inp32) then comp32<='1'; else comp32<='0'; end if;
			if unsigned(inp44)>unsigned(inp33) then comp33<='1'; else comp33<='0'; end if;
			if unsigned(inp44)>unsigned(inp34) then comp34<='1'; else comp34<='0'; end if;
			if unsigned(inp44)>unsigned(inp35) then comp35<='1'; else comp35<='0'; end if;
			if unsigned(inp44)>unsigned(inp36) then comp36<='1'; else comp36<='0'; end if;
			if unsigned(inp44)>unsigned(inp37) then comp37<='1'; else comp37<='0'; end if;
				
			if unsigned(inp44)>unsigned(inp41) then comp41<='1'; else comp41<='0'; end if;
			if unsigned(inp44)>unsigned(inp42) then comp42<='1'; else comp42<='0'; end if;
			if unsigned(inp44)>unsigned(inp43) then comp43<='1'; else comp43<='0'; end if;
			if unsigned(inp44)>unsigned(inp45) then comp45<='1'; else comp45<='0'; end if;
			if unsigned(inp44)>unsigned(inp46) then comp46<='1'; else comp46<='0'; end if;
			if unsigned(inp44)>unsigned(inp47) then comp47<='1'; else comp47<='0'; end if;

			if unsigned(inp44)>unsigned(inp51) then comp51<='1'; else comp51<='0'; end if;
			if unsigned(inp44)>unsigned(inp52) then comp52<='1'; else comp52<='0'; end if;
			if unsigned(inp44)>unsigned(inp53) then comp53<='1'; else comp53<='0'; end if;
			if unsigned(inp44)>unsigned(inp54) then comp54<='1'; else comp54<='0'; end if;
			if unsigned(inp44)>unsigned(inp55) then comp55<='1'; else comp55<='0'; end if;
			if unsigned(inp44)>unsigned(inp56) then comp56<='1'; else comp56<='0'; end if;
			if unsigned(inp44)>unsigned(inp57) then comp57<='1'; else comp57<='0'; end if;

			if unsigned(inp44)>unsigned(inp61) then comp61<='1'; else comp61<='0'; end if;
			if unsigned(inp44)>unsigned(inp62) then comp62<='1'; else comp62<='0'; end if;
			if unsigned(inp44)>unsigned(inp63) then comp63<='1'; else comp63<='0'; end if;
			if unsigned(inp44)>unsigned(inp64) then comp64<='1'; else comp64<='0'; end if;
			if unsigned(inp44)>unsigned(inp65) then comp65<='1'; else comp65<='0'; end if;
			if unsigned(inp44)>unsigned(inp66) then comp66<='1'; else comp66<='0'; end if;
			if unsigned(inp44)>unsigned(inp67) then comp67<='1'; else comp67<='0'; end if;

			if unsigned(inp44)>unsigned(inp71) then comp71<='1'; else comp71<='0'; end if;
			if unsigned(inp44)>unsigned(inp72) then comp72<='1'; else comp72<='0'; end if;
			if unsigned(inp44)>unsigned(inp73) then comp73<='1'; else comp73<='0'; end if;
			if unsigned(inp44)>unsigned(inp74) then comp74<='1'; else comp74<='0'; end if;
			if unsigned(inp44)>unsigned(inp75) then comp75<='1'; else comp75<='0'; end if;
			if unsigned(inp44)>unsigned(inp76) then comp76<='1'; else comp76<='0'; end if;
			if unsigned(inp44)>unsigned(inp77) then comp77<='1'; else comp77<='0'; end if;
			
			iscorner_d<=iscorner;
			x_coord_d <= x_coord_in;
			y_coord_d <= y_coord_in;
			
			corner_out<=	comp11 and comp12 and comp13 and comp14 and comp15 and comp16 and comp17 and
								comp21 and comp22 and comp23 and comp24 and comp25 and comp26 and comp27 and
								comp31 and comp32 and comp33 and comp34 and comp35 and comp36 and comp37 and
								comp41 and comp42 and comp43 and comp45 and comp46 and comp47 and
								comp51 and comp52 and comp53 and comp54 and comp55 and comp56 and comp57 and
								comp61 and comp62 and comp63 and comp64 and comp65 and comp66 and comp67 and
								comp71 and comp72 and comp73 and comp74 and comp75 and comp76 and comp77 and
								iscorner_d;


			x_coord_out <= x_coord_d;
			y_coord_out <= y_coord_d;
		
		end if;
	end if;
	
end process compare;


end Behavioral;

