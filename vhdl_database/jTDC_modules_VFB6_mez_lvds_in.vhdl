-------------------------------------------------------------------------
----                                                                 ----
---- Engineer: Ph. Hoffmeister                                       ----
---- Company : ELB-Elektroniklaboratorien Bonn UG                    ----
----           (haftungsbeschränkt)                                  ----
----                                                                 ----
---- Target Devices: ELB_LVDS_INPUT_MEZ v1.0                         ----
---- Description   : Component for LVDS input adapter                ----
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

library UNISIM;
use UNISIM.VComponents.all;


entity mez_lvds_in is
    Port ( data : out  STD_LOGIC_VECTOR (31 downto 0) := (others => '0');
           MEZ : inout  STD_LOGIC_VECTOR (73 downto 0));
end mez_lvds_in;

architecture Behavioral of mez_lvds_in is

   signal MEZ_buffer : std_logic_vector (73 downto 0);
	
begin

	buffers: for i in 0 to 73 generate
		IBUF_MEZ : IBUF   generic map ( IOSTANDARD => "LVCMOS33") port map ( I => MEZ(i), O => MEZ_buffer(i) );			
   end generate buffers;

	data (16) <= not MEZ_buffer (1);
	data (0) <= not MEZ_buffer (0);
	data (17) <= not MEZ_buffer (3);
	data (1) <= not MEZ_buffer (2);
	data (18) <= not MEZ_buffer (5);
	data (2) <= not MEZ_buffer (4);
	data (19) <= not MEZ_buffer (7);
	data (3) <= not MEZ_buffer (6);
	data (20) <= not MEZ_buffer (9);
	data (4) <= not MEZ_buffer (8);
	data (21) <= not MEZ_buffer (11);
	data (5) <= not MEZ_buffer (10);
	data (22) <= not MEZ_buffer (13);
	data (6) <= not MEZ_buffer (12);
	data (23) <= not MEZ_buffer (15);
	data (7) <= not MEZ_buffer (14);

	data (24) <= not MEZ_buffer (41);
	data (8) <= not MEZ_buffer (40);
	data (25) <= not MEZ_buffer (43);
	data (9) <= not MEZ_buffer (42);
	data (26) <= not MEZ_buffer (45);
	data (10) <= not MEZ_buffer (44);
	data (27) <= not MEZ_buffer (47);
	data (11) <= not MEZ_buffer (46);
	data (28) <= not MEZ_buffer (49);
	data (12) <= not MEZ_buffer (48);
	data (29) <= not MEZ_buffer (51);
	data (13) <= not MEZ_buffer (50);
	data (30) <= not MEZ_buffer (53);
	data (14) <= not MEZ_buffer (52);
	data (31) <= not MEZ_buffer (55);
	data (15) <= not MEZ_buffer (54);

	--defined as inputs, simply leave them open
	--MEZ(39 downto 16) <= (others=>'0');
	--MEZ(73 downto 56) <= (others=>'0');

end Behavioral;
