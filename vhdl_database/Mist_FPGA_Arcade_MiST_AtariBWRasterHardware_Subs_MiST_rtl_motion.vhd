-- Motion object generation circuitry for Atari Subs
-- This generates the two submarines, two torpedos and explosions for the submarines and torpedos
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
			CLK6			: in  std_logic; -- 6MHz* on schematic
			PHI2			: in  std_logic;
			DMA_n			: in  std_logic_vector(7 downto 0);
			PRAM			: in  std_logic_vector(7 downto 0);
			H256_s		: in  std_logic; -- 256H* on schematic
			VCount		: in  std_logic_vector(7 downto 0);
			HCount		: in  std_logic_vector(8 downto 0);
			Load_n		: buffer std_logic_vector(8 downto 1);
			Sub1_n		: out std_logic;
			Sub2_n		: out std_logic;
			Torp1			: out std_logic;
			Torp2			: out std_logic
			);
end motion;

architecture rtl of motion is

signal phi0				: std_logic;
signal phi1				: std_logic;

signal Sub1_Inh		: std_logic;
signal Sub2_Inh		: std_logic;
signal Torp1_Inh		: std_logic;
signal Torp2_Inh		: std_logic;

signal VPos_sum		: std_logic_vector(7 downto 0);
signal Vcount_match	: std_logic;
signal Sum_H64 		: std_logic;
signal C5_8				: std_logic;

signal K9_in			: std_logic_vector(3 downto 0) := (others => '0');
signal K9_out			: std_logic_vector(9 downto 0) := (others => '0');		

signal H256_n			: std_logic;
signal H64 				: std_logic;
signal H32				: std_logic;
signal H16				: std_logic;
signal H8				: std_logic;

signal R6_6				: std_logic;
signal R6_8				: std_logic;

signal ROM_D7Q			: std_logic_vector(7 downto 0);
signal ROM_D8Q			: std_logic_vector(7 downto 0);
signal ROM_E7Q			: std_logic_vector(7 downto 0);
signal ROM_E8Q			: std_logic_vector(7 downto 0);


signal Sub1_Hpos		: std_logic_vector(7 downto 0) := x"00";
signal Sub2_Hpos		: std_logic_vector(7 downto 0) := x"00";
signal Torp1_Hpos		: std_logic_vector(7 downto 0) := x"00";
signal Torp2_Hpos		: std_logic_vector(7 downto 0) := x"00";

signal SubROM_dout	: std_logic_vector(14 downto 0);
signal TorpROM_dout	: std_logic_vector(14 downto 0);

signal Sub1_reg		: std_logic_vector(15 downto 0) := x"0000";
signal Sub2_reg		: std_logic_vector(15 downto 0) := x"0000";
signal Torp1_reg 		: std_logic_vector(15 downto 0) := x"0000";
signal Torp2_reg 		: std_logic_vector(15 downto 0) := x"0000";

signal Vid				: std_logic_vector(15 downto 1) := (others => '0');


begin

Phi0 <= Phi2;
Phi1 <= (not Phi2);

H8 <= Hcount(3);
H16 <= Hcount(4);
H32 <= Hcount(5);
H64 <= Hcount(6);
H256_n <= not(Hcount(8));


-- Vertical line comparator
VPos_sum <= DMA_n + VCount; 
VCount_match <= not (Vpos_sum(7) and Vpos_sum(6) and Vpos_sum(5) and Vpos_sum(4));
Sum_H64 <= VCount_match nand H64;
C5_8 <= not(H8 and phi1 and H256_n and Sum_H64); 


-- Load_n signal decoder
K9_in <= C5_8 & H64 & H32 & H16;
K9: process(K9_in)
begin
	case K9_in is
		when "0000" =>
			K9_out <= "1111111110";
		when "0001" =>
			K9_out <= "1111111101"; 
		when "0010" =>
			K9_out <= "1111111011"; 
		when "0011" =>
			K9_out <= "1111110111";
		when "0100" =>
			K9_out <= "1111101111"; 
		when "0101" =>
			K9_out <= "1111011111";
		when "0110" =>
			K9_out <= "1110111111"; 
		when "0111" =>
			K9_out <= "1101111111";
		when others =>
			K9_out <= "1111111111";
		end case;
end process;
Load_n(8) <= K9_out(7);
Load_n(7) <= K9_out(6);
Load_n(6) <= K9_out(5);
Load_n(5) <= K9_out(4);
Load_n(4) <= K9_out(3);
Load_n(3) <= K9_out(2);
Load_n(2) <= K9_out(1);
Load_n(1) <= K9_out(0);


-- Motion object ROMs
--D8: entity work.D8_ROM
--port map(
--		clock => Clk6,
--		address => PRAM(7 downto 3) & VPos_sum(3 downto 0),
--		q => ROM_D8Q
--		);

D8: entity work.ROM_D8
port map(
	clk => clk6,
	addr => PRAM(7 downto 3) & VPos_sum(3 downto 0),
	data => ROM_D8Q
);

--E8: entity work.E8_ROM
--port map(
--		clock => Clk6,
--		address => PRAM(7 downto 3) & VPos_sum(3 downto 0),
--		q => ROM_E8Q
--		);

E8: entity work.ROM_E8
port map(
	clk => clk6,
	addr => PRAM(7 downto 3) & VPos_sum(3 downto 0),
	data => ROM_E8Q
);

--D7: entity work.D7_ROM
--port map(
--		clock => Clk6,
--		address => PRAM(7 downto 3) & VPos_sum(3 downto 0),
--		q => ROM_D7Q
--		);
		
D7: entity work.ROM_D7
port map(
	clk => clk6,
	addr => PRAM(7 downto 3) & VPos_sum(3 downto 0),
	data => ROM_D7Q
);		

--E7: entity work.E7_ROM
--port map(
--		clock => Clk6,
--		address => PRAM(7 downto 3) & VPos_sum(3 downto 0),
--		q => ROM_E7Q
--		);

E7: entity work.ROM_E7
port map(
	clk => clk6,
	addr => PRAM(7 downto 3) & VPos_sum(3 downto 0),
	data => ROM_E7Q
);	

-- Motion object ROM mux
-- Sub images are held in D7 and D8, Torpedo images in E7 and E8 selected by PRAM0
-- Note the odd bit ordering of the ROM data outputs
SubROM_dout <= ROM_D7Q(2 downto 0) & ROM_D7Q(7 downto 4) & ROM_D8Q(3 downto 0) & ROM_D8Q(7 downto 4);
TorpROM_dout <= ROM_E7Q(2 downto 0) & ROM_E7Q(7 downto 4)& ROM_E8Q(3 downto 0) & ROM_E8Q(7 downto 4);
Vid <= SubROM_dout when PRAM(0) = '0' else
		 TorpROM_dout;
		
		
-- Submarine 1 Horizontal position counter
-- This combines two 74163s at locations K6 and K5 on the PCB 
K5_6: process(clk6, H256_s, Load_n, DMA_n)
begin
	if rising_edge(clk6) then
		if Load_n(1) = '0' then -- preload the counter
			Sub1_Hpos <= DMA_n;
		elsif H256_s = '1' then -- increment the counter
			Sub1_Hpos <= Sub1_Hpos + '1';		
		end if;
		if Sub1_Hpos(7 downto 4) = "1111" then
			Sub1_Inh <= '0';
		else
			Sub1_Inh <= '1';
		end if;
	end if;
end process;

-- Submarine 1 video shift register
-- This combines two 74165s at locations K7 and K8 on the PCB
K7_8: process(clk6, Sub1_Inh, Load_n, Vid)
begin
	if Load_n(5) = '0' then
			Sub1_reg <= Vid & '0'; -- Preload the register
	elsif rising_edge(clk6) then
		if Sub1_Inh = '0' then
			Sub1_reg <= '0' & Sub1_reg(15 downto 1);
		end if;
	end if;
end process;
Sub1_n <= not (Sub1_reg(0));


-- Submarine 2 Horizontal position counter
-- This combines two 74163s at locations J6 and J5 on the PCB 
J6_5: process(clk6, H256_s, Load_n, DMA_n)
begin
	if rising_edge(clk6) then
		if Load_n(2) = '0' then -- preload the counter
			Sub2_Hpos <= DMA_n;
		elsif H256_s = '1' then -- increment the counter
			Sub2_Hpos <= Sub2_Hpos + '1';		
		end if;
		if Sub2_Hpos(7 downto 4) = "1111" then
			Sub2_Inh <= '0';
		else
			Sub2_Inh <= '1';
		end if;
	end if;
end process;

-- Submarine 2 video shift register
-- This combines two 74165s at locations J7 and J8 on the PCB
J7_8: process(clk6, Sub2_Inh, Load_n, Vid)
begin
	if Load_n(6) = '0' then
			Sub2_reg <= Vid & '0'; -- Preload the register
	elsif rising_edge(clk6) then
		if Sub2_Inh = '0' then
			Sub2_reg <= '0' & Sub2_reg(15 downto 1);
		end if;
	end if;
end process;
Sub2_n <= not (Sub2_reg(0));


-- Torpedo 1 Horizontal position counter
-- This combines two 74163s at locations J6 and J5 on the PCB 
H6_5: process(clk6, H256_s, Load_n, DMA_n)
begin
	if rising_edge(clk6) then
		if Load_n(3) = '0' then -- preload the counter
			Torp1_Hpos <= DMA_n;
		elsif H256_s = '1' then -- increment the counter
			Torp1_Hpos <= Torp1_Hpos + '1';		
		end if;
		if Torp1_Hpos(7 downto 4) = "1111" then
			Torp1_Inh <= '0';
		else
			Torp1_Inh <= '1';
		end if;
	end if;
end process;

-- Torpedo 1 video shift register
-- This combines two 74165s at locations H7 and H8 on the PCB
H7_8: process(clk6, Torp1_Inh, Load_n, Vid)
begin
	if Load_n(7) = '0' then
			Torp1_reg <= Vid & '0'; -- Preload the register
	elsif rising_edge(clk6) then
		if Torp1_Inh = '0' then
			Torp1_reg <= '0' & Torp1_reg(15 downto 1);
		end if;
	end if;
end process;
Torp1 <= Torp1_reg(0);


-- Torpedo 2 Horizontal position counter
-- This combines two 74163s at locations F6 and F5 on the PCB 
F6_5: process(clk6, H256_s, Load_n, DMA_n)
begin
	if rising_edge(clk6) then
		if Load_n(4) = '0' then -- preload the counter
			Torp2_Hpos <= DMA_n;
		elsif H256_s = '1' then -- increment the counter
			Torp2_Hpos <= Torp2_Hpos + '1';		
		end if;
		if Torp2_Hpos(7 downto 4) = "1111" then
			Torp2_Inh <= '0';
		else
			Torp2_Inh <= '1';
		end if;
	end if;
end process;

-- Torpedo 2 video shift register
-- This combines two 74165s at locations F7 and F8 on the PCB
F7_8: process(clk6, Torp2_Inh, Load_n, Vid)
begin
	if Load_n(8) = '0' then
			Torp2_reg <= Vid & '0'; -- Preload the register
	elsif rising_edge(clk6) then
		if Torp2_Inh = '0' then
			Torp2_reg <= '0' & Torp2_reg(15 downto 1);
		end if;
	end if;
end process;
Torp2 <= Torp2_reg(0);

end rtl;