-------------------------------------------------------------------------
----                                                                 ----
---- Engineer: A. Winnebeck                                          ----
---- Company:  ELB-Elektroniklaboratorien Bonn UG                    ----
----           (haftungsbeschränkt)                                  ----
----                                                                 ----
-------------------------------------------------------------------------
----                                                                 ----
---- Copyright (C) 2015 ELB                                          ----
----                                                                 ----
---- This program is free software; you can redistribute it and/or   ----
---- modify it under the terms of the GNU General Public License as  ----
---- published by the Free Software Foundation; either version 3 of  ----
---- the License, or (at your option) any later version.             ----
----                                                                 ----
---- This program is distributed in the hope that it will be useful, ----
---- but WITHOUT ANY WARRANTY; without even the implied warranty of  ----
---- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the    ----
---- GNU General Public License for more details.                    ----
----                                                                 ----
---- You should have received a copy of the GNU General Public       ----
---- License along with this program; if not, see                    ----
---- <http://www.gnu.org/licenses>.                                  ----
----                                                                 ----
-------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;


entity bus_interface_vfb6 is
    Port (
       board_databus : inout STD_LOGIC_VECTOR(31 downto 0); 
       board_address : in STD_LOGIC_VECTOR(15 downto 0);
       board_read : in STD_LOGIC;
       board_write : in STD_LOGIC;
       board_dtack : out STD_LOGIC := '0';
       CLK : in  STD_LOGIC;
       statusregister : in STD_LOGIC_VECTOR(31 downto 0);
       internal_databus : inout STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
       internal_address : out STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
       internal_read : out STD_LOGIC := '0';
       internal_write : out STD_LOGIC := '0');
end bus_interface_vfb6;



architecture Behavioral of bus_interface_vfb6 is

	---- Signals for VME-Interface ----
	signal test_register : STD_LOGIC_VECTOR(31 downto 0):=X"DEADBEEF";
	signal le_write_int	: STD_LOGIC;
	signal board_read_sync	: STD_LOGIC;
	signal board_read_pre_sync	: STD_LOGIC;


	---- Component declaration ----
	COMPONENT leading_edge_clipper
	PORT(
		input : IN std_logic;
		CLK : IN std_logic;          
		output : OUT std_logic
		);
	END COMPONENT;
	
begin

	---- Instantiation of Pulseclipper ----
	le_w_int: leading_edge_clipper 
	PORT MAP( input => board_write,
				 CLK => CLK,
				 output => le_write_int);


	---- Sync board read 
	synchronize_read_int: Process (CLK) is
	begin
		if rising_edge(CLK) then
			board_read_pre_sync <= board_read;
			board_read_sync <= board_read_pre_sync;
		end if;
	end process;



	process (CLK) is
	begin
		if rising_edge(CLK) then
			if (le_write_int = '1') then
				case board_address is
					when X"0014" => test_register <= board_databus;
					when others => NULL;
				end case;
			elsif (board_read_sync = '1') then
				case board_address is
					when X"0010" => board_databus <= statusregister;
					when X"0014" => board_databus <= test_register;
					when others => board_databus <= (others => 'Z');
				end case;	
			else
				board_databus <= (others=>'Z');
			end if;
		end if;
	end process;




	dtack_process: process (CLK) is
	begin
		if rising_edge(CLK) then
			-- generate Data Acknowlege, if Module is addressed, but CPLD registers are not addressed
			if ((board_read_sync = '1' OR board_write = '1') AND (NOT(board_address = X"0000" OR board_address = X"0004" OR board_address = X"0008")))then
				board_dtack <= '1';
			else
				board_dtack <= '0';
			end if;
		end if;
	end process;


  internal_write <= le_write_int;
  internal_read <= board_read_sync;
  internal_address <= board_address(15 downto 2) & "00";
  internal_databus <= board_databus;

end Behavioral;
