-- Motion Car generation circuitry for Atari Sprint 4
-- This generates the four cars, the only motion objects in the game
-- (c) 2017 James Sweet
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
			Car			: out std_logic_vector(4 downto 1);
			Car_n			: out std_logic_vector(4 downto 1)
			);
end motion;

architecture rtl of motion is

signal phi1			: std_logic;

signal H256_n			: std_logic;
signal H64 				: std_logic;
signal H32				: std_logic;
signal H16				: std_logic;
signal H8				: std_logic;

signal P6_R5sum		: std_logic_vector(7 downto 0);
signal Match_n			: std_logic := '1';
signal R6_8				: std_logic := '1';

signal P7_in			: std_logic_vector(3 downto 0) := (others => '0');
signal P7_out			: std_logic_vector(9 downto 0) := (others => '1');
signal R4_in			: std_logic_vector(3 downto 0) := (others => '0');
signal R4_out			: std_logic_vector(9 downto 0) := (others => '1');

signal Car1_Hpos	: std_logic_vector(7 downto 0) := (others => '0');
signal Car2_Hpos	: std_logic_vector(7 downto 0) := (others => '0');
signal Car3_Hpos	: std_logic_vector(7 downto 0) := (others => '0');
signal Car4_Hpos	: std_logic_vector(7 downto 0) := (others => '0');

signal Car1_reg	: std_logic_vector(15 downto 0) := (others => '0');
signal Car2_reg	: std_logic_vector(15 downto 0) := (others => '0');
signal Car3_reg 	: std_logic_vector(15 downto 0) := (others => '0');
signal Car4_reg 	: std_logic_vector(15 downto 0) := (others => '0');

signal Car1_Inh	: std_logic := '1';
signal Car2_Inh	: std_logic := '1';
signal Car3_Inh	: std_logic := '1';
signal Car4_Inh	: std_logic := '1';

signal Vid			: std_logic_vector(12 downto 1) := (others => '0');


begin
phi1 <= (not phi2);

H8 <= Hcount(3);
H16 <= Hcount(4);
H32 <= Hcount(5);
H64 <= Hcount(6);
H256_n <= not(Hcount(8));

-- Vertical line comparator
P6_R5sum <= DMA_n + VCount; 

-- Motion Object PROMs
N6: entity work.ROM_N6
port map(
	clk => clk6,
	addr => H16 & PRAM(7 downto 3) & P6_R5sum(3 downto 0),
	data => Vid(4 downto 1)
	);

M6: entity work.ROM_M6
port map(
	clk => clk6,
   addr => H16 & PRAM(7 downto 3) & P6_R5sum(3 downto 0),
	data => Vid(8 downto 5)
	);

L6: entity work.ROM_L6
port map(
	clk => clk6,
	addr => H16 & PRAM(7 downto 3) & P6_R5sum(3 downto 0),
	data => Vid(12 downto 9)
	);

	
-- Some glue logic
Match_n <= not(P6_R5sum(7) and P6_R5sum(6) and P6_R5sum(5) and P6_R5sum(4));
R6_8 <= not(H256_n and H8 and Phi1 and (H64 nand Match_n));


R4_in <= R6_8 & H64 & H32 & H16;
R4: process(clk6, R4_in)
begin
	case R4_in is
		when "0000" =>
			R4_out <= "1111111110";
		when "0001" =>
			R4_out <= "1111111101"; 
		when "0010" =>
			R4_out <= "1111111011"; 
		when "0011" =>
			R4_out <= "1111110111";
		when "0100" =>
			R4_out <= "1111101111"; 
		when "0101" =>
			R4_out <= "1111011111";
		when "0110" =>
			R4_out <= "1110111111"; 
		when "0111" =>
			R4_out <= "1101111111";
		when others =>
			R4_out <= "1111111111";
		end case;
end process;
Load_n(8) <= R4_out(7);
Load_n(7) <= R4_out(6);
Load_n(6) <= R4_out(5);
Load_n(5) <= R4_out(4);
Load_n(4) <= R4_out(3);
Load_n(3) <= R4_out(2);
Load_n(2) <= R4_out(1);
Load_n(1) <= R4_out(0);


-- Car 1 Horizontal position counter
-- This combines two 74163s at locations P5 and P6 on the PCB 
P5_4: process(clk6, H256_s, Load_n, DMA_n)
begin
	if rising_edge(clk6) then
		if Load_n(1) = '0' then -- preload the counter
			Car1_Hpos <= DMA_n;
		elsif H256_s = '1' then -- increment the counter
			Car1_Hpos <= Car1_Hpos + '1';		
		end if;
		if Car1_Hpos(7 downto 4) = "1111" then
			Car1_Inh <= '0';
		else
			Car1_Inh <= '1';
		end if;
	end if;
end process;

-- Car 1 video shift register
-- This combines two 74165s at locations N7 and N8 on the PCB
N7_8: process(clk6, Car1_Inh, Load_n, Vid)
begin
	if Load_n(5) = '0' then
			Car1_reg <= "000" & Vid & '0'; -- Preload the register
	elsif rising_edge(clk6) then
		if Car1_Inh = '0' then
			Car1_reg <= '0' & Car1_reg(15 downto 1);
		end if;
	end if;
end process;
Car(1) <= Car1_reg(0);
Car_n(1) <= (not Car1_reg(0));


-- Car 2 Horizontal position counter
-- This combines two 74LS163s at locations P5 and P6 on the PCB 
P5_6: process(clk6, H256_s, Load_n, DMA_n)
begin
	if rising_edge(clk6) then
		if Load_n(2) = '0' then -- preload the counter
			Car2_Hpos <= DMA_n;
		elsif H256_s = '1' then -- increment the counter
			Car2_Hpos <= Car2_Hpos + '1';
		end if;
		if Car2_Hpos(7 downto 4) = "1111" then
			Car2_Inh <= '0';
		else
			Car2_Inh <= '1';
		end if;
	end if;
end process;

-- Car 2 video shift register
M7_8: process(clk6, Load_n, Vid)
begin
	if Load_n(6) = '0' then
			Car2_reg <= "000" & Vid & '0'; -- Preload the register
	elsif rising_edge(clk6) then
		if Car2_Inh = '0' then
			Car2_reg <= '0' & Car2_reg(15 downto 1);
		end if;
	end if;
end process;
Car(2) <= Car2_reg(0);
Car_n(2) <= (not Car2_reg(0));


-- Car 3 Horizontal position counter
-- This combines two 74LS163s at locations M5 and M4 on the PCB 
M5_4: process(clk6, H256_s, Load_n, DMA_n)
begin
	if rising_edge(clk6) then
		if Load_n(3) = '0' then -- preload the counter
			Car3_Hpos <= DMA_n;
		elsif H256_s = '1' then -- increment the counter
			Car3_Hpos <= Car3_Hpos + '1';
		end if;
		if Car3_Hpos(7 downto 4) = "1111" then
			Car3_Inh <= '0';
		else
			Car3_Inh <= '1';
		end if;
	end if;
end process;

-- Car 3 video shift register
L7_8: process(clk6, Car3_Inh, Load_n, Vid)
begin
	if Load_n(7) = '0' then
			Car3_reg <= "000" & Vid & '0'; -- Preload the register
	elsif rising_edge(clk6) then
		if Car3_Inh = '0' then
			Car3_reg <= '0' & Car3_reg(15 downto 1);
		end if;
	end if;
end process;
Car(3) <= Car3_reg(0);
Car_n(3) <= (not Car3_reg(0));


-- Car 4 Horizontal position counter
-- This combines two 74LS163s at locations L5 and L4on the PCB 
L5_4: process(clk6, H256_s, Load_n, DMA_n)
begin
	if rising_edge(clk6) then
		if Load_n(4) = '0' then -- preload the counter
			Car4_Hpos <= DMA_n;
		elsif H256_s = '1' then -- increment the counter
			Car4_Hpos <= Car4_Hpos + '1';
		end if;
		if Car4_Hpos(7 downto 4) = "1111" then
			Car4_Inh <= '0';
		else
			Car4_Inh <= '1';
		end if;
	end if;
end process;

-- Car 4 video shift register
K7_8: process(clk6, Car4_Inh, Load_n, Vid)
begin
	if Load_n(8) = '0' then
			Car4_reg <= "000" & Vid & '0'; -- Preload the register
	elsif rising_edge(clk6) then
		if Car4_Inh = '0' then
			Car4_reg <= '0' & Car4_reg(15 downto 1);
		end if;
	end if;
end process;
Car(4) <= Car4_reg(0);
Car_n(4) <= (not Car4_reg(0));

end rtl;
