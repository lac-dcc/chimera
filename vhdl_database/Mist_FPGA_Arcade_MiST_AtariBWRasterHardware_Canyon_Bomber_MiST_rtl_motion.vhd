-- Motion object generation circuitry for Atari Canyon Bomber
-- This generates the two player ships (blimps or planes) and
-- the bomb shells dropped by the ships.
-- (c) 2018 James Sweet
--
-- This is free software: you can redistribute
-- it and/or modify it under the terms of the GNU General
-- Public License as published by the Free Software
-- Foundation, either version 3 of the License, or (at your
-- option) any later version.
--
-- This is distributed in the hope that it will
-- be useful, but WITHOUT ANY WARRANTY; without even the
-- implied warranty of MERCHANTABILITY or FITNESS FOR A
-- PARTICULAR PURPOSE. See the GNU General Public License
-- for more details.

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity motion is 
port(		
			CLK12			: in  std_logic;
			CLK6en    : in  std_logic;
			PHI2			: in  std_logic;
			DISPLAY		: in  std_logic_vector(7 downto 0);
			H256_s		: in  std_logic; -- 256H* on schematic
			HSync			: in  std_logic;
			VCount		: in  std_logic_vector(7 downto 0);
			HCount		: in  std_logic_vector(8 downto 0);
			Shell1_n  	: out std_logic;
			Shell2_n  	: out std_logic;
			Ship1_n  	: out std_logic;
			Ship2_n 		: out std_logic
			);
end motion;

architecture rtl of motion is

signal phi0				: std_logic;

signal LDH1_n			: std_logic;
signal LDH2_n			: std_logic;
signal LDH3_n			: std_logic;
signal LDH4_n			: std_logic;

signal LDV1A_n			: std_logic;
signal LDV1B_n			: std_logic;
signal LDV1C_n			: std_logic;
signal LDV1D_n			: std_logic;

signal LDV2A_n			: std_logic;
signal LDV2B_n			: std_logic;
signal LDV2C_n			: std_logic;
signal LDV2D_n			: std_logic;

signal VSL2_n 			: std_logic;
signal VSL1_n 			: std_logic;
signal VSP1_n 			: std_logic;
signal VSP2_n 			: std_logic;

signal KH5_sum			: std_logic_vector(7 downto 0) := x"00";
signal K4_8				: std_logic;

signal HSync_n 		: std_logic;

signal H256_n			: std_logic;
signal H256				: std_logic;
signal H64 				: std_logic;
signal H32				: std_logic;
signal H16				: std_logic;
signal H8				: std_logic;
signal H4				: std_logic;
signal H2				: std_logic;
signal H1				: std_logic;

signal L5_reg			: std_logic_vector(4 downto 0);

signal J8_3				: std_logic;
signal J8_6				: std_logic;

signal M9_in			: std_logic_vector(3 downto 0);
signal M9_out			: std_logic_vector(9 downto 0);

signal VidROMAdr		: std_logic_vector(9 downto 0);
signal VidROMdout		: std_logic_vector(7 downto 0);
signal Vid				: std_logic_vector(7 downto 0);

signal HShell1Win_n 	: std_logic;
signal HShell2Win_n 	: std_logic;
signal ShipWin1_n		: std_logic;
signal ShipWin2_n		: std_logic;
signal Ship1_Hpos	  	: std_logic_vector(7 downto 0) := x"00";
signal Ship2_Hpos	   : std_logic_vector(7 downto 0) := x"00";
signal Shell1_Hpos	: std_logic_vector(7 downto 0) := x"00";
signal Shell2_Hpos	: std_logic_vector(7 downto 0) := x"00";
signal Ship1_reg		: std_logic_vector(31 downto 0) := (others => '0');
signal Ship2_reg		: std_logic_vector(31 downto 0) := (others => '0');

signal J4_8 			: std_logic;
signal R9_Qa 			: std_logic;
signal R9_Qb 			: std_logic;

signal LDV1_dec		: std_logic_vector(3 downto 0);
signal LDV2_dec		: std_logic_vector(3 downto 0);



begin
phi0 <= phi2;

H1 <= HCount(0);
H2 <= HCount(1);
H4 <= Hcount(2);
H8 <= Hcount(3);
H16 <= Hcount(4);
H32 <= Hcount(5);
H64 <= Hcount(6);
H256 <= Hcount(8);

HSync_n <= (not Hsync);

-- Vertical line comparator
KH5_sum <= Display + VCount; 
K4_8 <= not(KH5_sum(7) and KH5_sum(6) and KH5_sum(5) and KH5_sum(4) and (not H256) and H8);


-- D type flip-flops in L3 and H4 latch data from vertical line comparator
L5: process(phi2, K4_8, KH5_sum(3 downto 0))
begin
	if rising_edge(phi2) then
		L5_reg <= K4_8 & KH5_sum(3 downto 0);
	end if;
end process;

J4_8 <= not ((not L5_reg(3)) and L5_reg(2) and L5_reg(1));


-- The shells are single pixels created by a pair of flip-flops 
-- rather than sprites stored in ROM.
-- Black shell
R9a: process(VSL1_n)
begin
	if rising_edge(VSL1_n) then
		R9_Qa <= J4_8;
	end if;
end process;

-- White shell
R9b: process(Hsync_n, VSL2_n)
begin
	if Hsync_n = '0' then
		R9_Qb <= '1';
	elsif rising_edge(VSL2_n) then
		R9_Qb <= J4_8;
	end if;
end process;
	
Shell1_n <= R9_Qa or HShell1Win_n;
Shell2_n <= R9_Qb or HShell2Win_n;



M9_in <= (L5_reg(4) or H4) & H64 & H32 & H16;
M9: process(clk12, M9_in)
begin
  if rising_edge(clk12) then
	case M9_in is
		when "0000" =>
			M9_out <= "1111111110";
		when "0001" =>
			M9_out <= "1111111101"; 
		when "0010" =>
			M9_out <= "1111111011"; 
		when "0011" =>
			M9_out <= "1111110111";
		when "0100" =>
			M9_out <= "1111101111"; 
		when "0101" =>
			M9_out <= "1111011111";
		when "0110" =>
			M9_out <= "1110111111"; 
		when "0111" =>
			M9_out <= "1101111111";
		when "1000" =>
			M9_out <= "1011111111";
		when "1001" =>
			M9_out <= "0111111111";
		when others =>
			M9_out <= "1111111111";
		end case;
end if;
end process;
VSL2_n <= M9_out(0);
LDH1_n <= M9_out(1);
LDH2_n <= M9_out(2);
LDH3_n <= M9_out(3);
LDH4_n <= M9_out(4);
VSP1_n <= M9_out(5);
VSP2_n <= M9_out(6);
VSL1_n <= M9_out(7);


VidROMAdr <= Display(0) 
				& Display(5 downto 3) 
				& (Display(7) xor H1) 
				& (Display(6) xor L5_reg(3)) 
				& (Display(6) xor L5_reg(2)) 
				& (Display(6) xor L5_reg(1)) 
				& (Display(6) xor L5_reg(0)) 
				& (Display(7) xor H2);

				
--Motion object ROMs
M5: entity work.sprom
generic map(
		init_file => "rtl/roms/9506-01.m5.mif",
		widthad_a => 8,
		width_a => 4)
port map(
		clock => clk12, 
		address => VidROMAdr(7 downto 0),
		q => VidROMdout(7 downto 4)
		);

N5: entity work.sprom
generic map(
		init_file => "./roms/9505-01.n5.mif",
		widthad_a => 8,
		width_a => 4)
port map(
		clock => clk12, 
		address => VidROMAdr(7 downto 0),
		q => VidROMdout(3 downto 0)
		);

	
--Flip bit order of motion object ROMs with state of Display(7) to horizontally mirror ships
Vid <= VidROMDout(4) & VidROMDout(5) & VidROMDout(6) & VidROMDout(7) & VidROMDout(0) & VidROMDout(1) & VidROMDout(2) & VidROMDout(3) 
		 when Display(7) = '0' else 
		 VidROMDout(3) & VidROMDout(2) & VidROMDout(1) & VidROMDout(0) & VidROMDout(7) & VidROMDout(6) & VidROMDout(5) & VidROMDout(4);
	

-- Decoders P8 and F8 generate the LDVxx signals
LDV_Decoder: process(clk12, VSP1_n, VSP2_n, HCount)
begin
	if rising_edge(clk12) then
		if VSP1_n = '0' and clk6en = '0' then
			case HCount(1 downto 0) is
			when "00" => LDV1_dec <= "1110";
			when "10" => LDV1_dec <= "1101";
			when "01" => LDV1_dec <= "1011";
			when "11" => LDV1_dec <= "0111";
			when others =>
				null;
			end case;
		else
			LDV1_dec <= "1111";
		end if;
		
		if VSP2_n = '0' and clk6en = '0' then
			case HCount(1 downto 0) is
			when "00" => LDV2_dec <= "1110";
			when "10" => LDV2_dec <= "1101";
			when "01" => LDV2_dec <= "1011";
			when "11" => LDV2_dec <= "0111";
			when others =>
				null;
			end case;
		else
			LDV2_dec <= "1111";
		end if;
	end if;
end process;
LDV1A_n <= LDV1_dec(0);
LDV1B_n <= LDV1_dec(1);
LDV1C_n <= LDV1_dec(2);
LDV1D_n <= LDV1_dec(3);
LDV2A_n <= LDV2_dec(0);
LDV2B_n <= LDV2_dec(1);
LDV2C_n <= LDV2_dec(2);
LDV2D_n <= LDV2_dec(3);


-- Ship 1 Horizontal position counter
-- This combines two 74163s at locations P3 and N3 on the PCB 
Ship1Count: process(clk12, H256_s, LDH1_n, Display)
begin
	if rising_edge(clk12) then
		if clk6en = '1' then
			if LDH1_n = '0' then -- preload the counter
				Ship1_Hpos <= Display;
			elsif H256_s = '1' then -- increment the counter
				Ship1_Hpos <= Ship1_Hpos + '1';		
			end if;
		end if;
	end if;
end process;
ShipWin1_n <= '0' when Ship1_Hpos(7 downto 5) = "111" else '1';

-- Ship 2 Horizontal position counter
-- This combines two 74163s at locations R3 and M3 on the PCB 
Ship2Count: process(clk12, H256_s, LDH2_n, Display)
begin
	if rising_edge(clk12) then
		if clk6en = '1' then
			if LDH2_n = '0' then -- preload the counter
				Ship2_Hpos <= Display;
			elsif H256_s = '1' then -- increment the counter
				Ship2_Hpos <= Ship2_Hpos + '1';		
			end if;
		end if;
	end if;
end process;
ShipWin2_n <= '0' when Ship2_Hpos(7 downto 5) = "111" else '1';

-- Shell 1 Horizontal position counter
-- This combines two 74163s at locations R4 and M4 on the PCB 
Shell1Count: process(clk12, H256_s, LDH3_n, Display)
begin
	if rising_edge(clk12) then
		if clk6en = '1' then
			if LDH3_n = '0' then -- preload the counter
				Shell1_Hpos <= Display;
			elsif H256_s = '1' then -- increment the counter
				Shell1_Hpos <= Shell1_Hpos + '1';		
			end if;
			if Shell1_Hpos(7 downto 1) = "1111111" then
				HShell1Win_n <= '0';
			else
				HShell1Win_n <= '1';
			end if;
		end if;
	end if;
end process;


-- Shell 2 Horizontal position counter
-- This combines two 74163s at locations P4 and N4 on the PCB 
Shell2Count: process(clk12, H256_s, LDH4_n, Display)
begin
	if rising_edge(clk12) then
		if clk6en = '1' then
			if LDH4_n = '0' then -- preload the counter
				Shell2_Hpos <= Display;
			elsif H256_s = '1' then -- increment the counter
				Shell2_Hpos <= Shell2_Hpos + '1';		
			end if;
			if Shell2_Hpos(7 downto 1) = "1111111" then
				HShell2Win_n <= '0';
			else
				HShell2Win_n <= '1';
			end if;
		end if;
	end if;
end process;



-- Ship 1 video shift register
-- This combines four 74165s at locations R7, P7, N7 and M7 on the PCB
Ship1Shift: process(clk12, ShipWin1_n, LDV1A_n, LDV1B_n, LDV1C_n, LDV1D_n, Vid)
begin
	if rising_edge(clk12) then
		if LDV1A_n = '0' then
			Ship1_reg(31 downto 24) <= Vid(7 downto 0); -- Load the register with data from the video ROMs
		elsif LDV1B_n = '0' then
			Ship1_reg(23 downto 16) <= Vid(7 downto 0); 
		elsif LDV1C_n = '0' then
			Ship1_reg(15 downto 8) <= Vid(7 downto 0);
		elsif LDV1D_n = '0' then
			Ship1_reg(7 downto 0) <= Vid(7 downto 0);
		elsif clk6en = '1' and ShipWin1_n = '0' then
			Ship1_reg <= '0' & Ship1_reg(31 downto 1);
		end if;
	end if;
end process;
Ship1_n <= (not Ship1_reg(0)) or ShipWin1_n;


-- Ship 2 video shift register
-- This combines four 74165s at locations R6, P6, N6 and M6 on the PCB
Ship2Shift: process(Clk12, ShipWin2_n, LDV2A_n, LDV2B_n, LDV2C_n, LDV2D_n, Vid)
begin
	if rising_edge(clk12) then
		if LDV2A_n = '0' then
			Ship2_reg(31 downto 24) <= Vid(7 downto 0); -- Load the register with data from the video ROMs
		elsif LDV2B_n = '0' then
			Ship2_reg(23 downto 16) <= Vid(7 downto 0); 
		elsif LDV2C_n = '0' then
			Ship2_reg(15 downto 8) <= Vid(7 downto 0);
		elsif LDV2D_n = '0' then
			Ship2_reg(7 downto 0) <= Vid(7 downto 0);
		elsif clk6en = '1' and ShipWin2_n = '0' then
			Ship2_reg <= '0' & Ship2_reg(31 downto 1);
		end if;
	end if;
end process;
Ship2_n <= (not Ship2_reg(0)) or ShipWin2_n;

end rtl;
