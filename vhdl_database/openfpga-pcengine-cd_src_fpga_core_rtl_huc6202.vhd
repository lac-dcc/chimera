--============================================================================
--  HUC6202
--  Copyright (C) 2018 Sorgelig
--
--  This program is free software; you can redistribute it and/or modify it
--  under the terms of the GNU General Public License as published by the Free
--  Software Foundation; either version 2 of the License, or (at your option)
--  any later version.
--
--  This program is distributed in the hope that it will be useful, but WITHOUT
--  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
--  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
--  more details.
--
--  You should have received a copy of the GNU General Public License along
--  with this program; if not, write to the Free Software Foundation, Inc.,
--  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
--============================================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity huc6202 is
	port (
		CLK 		: in std_logic;
		CLKEN		: in std_logic;
		RESET_N	: in std_logic;

		A			: in std_logic_vector(2 downto 0);
		WR_N		: in std_logic;
		DI			: in std_logic_vector(7 downto 0);
		DO 		: out std_logic_vector(7 downto 0);
		
		HS_F		: in std_logic;
		VDC0_IN	: in std_logic_vector(8 downto 0);
		VDC1_IN	: in std_logic_vector(8 downto 0);
		VDC_OUT	: out std_logic_vector(8 downto 0);

		SGX		: in std_logic;

		VDCNUM	: out std_logic
	);
end huc6202;

architecture rtl of huc6202 is

signal PRI0 : std_logic_vector(7 downto 0);
signal PRI1 : std_logic_vector(7 downto 0);
signal WIN1 : std_logic_vector(9 downto 0);
signal WIN2 : std_logic_vector(9 downto 0);
signal X    : std_logic_vector(9 downto 0);
signal PRIN : std_logic_vector(1 downto 0);
signal PRI  : std_logic_vector(3 downto 0);

signal VDC_PRI		: std_logic_vector(8 downto 0);
signal INMIX		: std_logic;

begin

PRIN(0) <= '1' when WIN1 < x"40" or X > WIN1 else '0';
PRIN(1) <= '1' when WIN2 < x"40" or X > WIN2 else '0';
PRI <= PRI0(3 downto 0) when PRIN = "00" else
		 PRI0(7 downto 4) when PRIN = "01" else
		 PRI1(3 downto 0) when PRIN = "10" else
		 PRI1(7 downto 4);

VDC_PRI <= VDC0_IN when VDC0_IN(3 downto 0) /= "0000" else VDC1_IN;

process( CLK )
	variable VDCDATA : std_logic_vector(8 downto 0);
begin
	if rising_edge(CLK) then
		if CLKEN = '1' then
			X <= X + 1;
			if HS_F = '1' then
				X <= (others => '0');
			end if;

			case PRI(1 downto 0) is
				when "00" =>
					VDCDATA := (others => '0');
				when "01" =>
					VDCDATA := VDC0_IN;
				when "10" =>
					VDCDATA := VDC1_IN;
				when others =>
					VDCDATA := VDC_PRI;
					case PRI(3 downto 2) is
						when "01" =>
							if VDC1_IN(8) = '1' and VDC0_IN(8) = '0' and VDC1_IN(3 downto 0) /= "0000" then
								VDCDATA := VDC1_IN;
							end if;
						when "10" =>
							if VDC1_IN(8) = '0' and VDC0_IN(8) = '1' and VDC1_IN(3 downto 0) /= "0000" then
								VDCDATA := VDC1_IN;
							end if;
						when others => null;
					end case;
			end case;

			if INMIX = '1' and PRI(1 downto 0) /= "00" and VDCDATA(7 downto 0) = x"00" then
				-- replace color 0 -> 256 if in mixing and one of VDC is enabled
				if SGX = '1' then
					VDC_OUT <= "000000000";
				else
					VDC_OUT <= "100000000";
				end if;
			else
				VDC_OUT <= VDCDATA;
			end if;
		end if;
	end if;
end process;

process( CLK ) begin
	if rising_edge(CLK) then
		if RESET_N = '0' then
			PRI0 <= "00010001";
			PRI1 <= "00010001";
			WIN1 <= (others => '0');
			WIN2 <= (others => '0');
			VDCNUM <= '0';
			INMIX <= '0';
			DO <= X"FF";
		else
			if WR_N = '0' then
				case A is
					when "000" => PRI0 <= DI; INMIX <= '1';
					when "001" => PRI1 <= DI; INMIX <= '1';
					when "010" => WIN1(7 downto 0) <= DI;
					when "011" => WIN1(9 downto 8) <= DI(1 downto 0);
					when "100" => WIN2(7 downto 0) <= DI;
					when "101" => WIN2(9 downto 8) <= DI(1 downto 0);
					when "110" => VDCNUM <= DI(0);
					when others => null;
				end case;
			end if;
			case A is
				when "000" => DO <= PRI0;
				when "001" => DO <= PRI1;
				when "010" => DO <= WIN1(7 downto 0);
				when "011" => DO <= "000000" & WIN1(9 downto 8);
				when "100" => DO <= WIN2(7 downto 0);
				when "101" => DO <= "000000" & WIN2(9 downto 8);
				when others => DO <= X"00";
			end case;
		end if;
	end if;
end process;

end rtl;
