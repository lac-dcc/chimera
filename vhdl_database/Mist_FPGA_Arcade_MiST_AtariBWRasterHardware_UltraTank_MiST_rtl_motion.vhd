-- Motion object generation circuitry for Kee Games Ultra Tank
-- This generates the four motion objects in the game consisting 
-- of two tanks and two shells
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
			Object		: out std_logic_vector(4 downto 1);
			Object_n		: out std_logic_vector(4 downto 1)
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

signal Object1_Hpos	: std_logic_vector(7 downto 0) := (others => '0');
signal Object2_Hpos	: std_logic_vector(7 downto 0) := (others => '0');
signal Object3_Hpos	: std_logic_vector(7 downto 0) := (others => '0');
signal Object4_Hpos	: std_logic_vector(7 downto 0) := (others => '0');

signal Object1_reg	: std_logic_vector(15 downto 0) := (others => '0');
signal Object2_reg	: std_logic_vector(15 downto 0) := (others => '0');
signal Object3_reg 	: std_logic_vector(15 downto 0) := (others => '0');
signal Object4_reg 	: std_logic_vector(15 downto 0) := (others => '0');

signal Object1_Inh	: std_logic := '1';
signal Object2_Inh	: std_logic := '1';
signal Object3_Inh	: std_logic := '1';
signal Object4_Inh	: std_logic := '1';

signal Vid				: std_logic_vector(15 downto 1) := (others => '0');


begin
phi1 <= (not phi2);

H8 <= Hcount(3);
H16 <= Hcount(4);
H32 <= Hcount(5);
H64 <= Hcount(6);
H256_n <= not(Hcount(8));

-- Vertical line comparator
P6_R5sum <= DMA_n + VCount; 

-- Motion object PROMs
N6: entity work.sprom
generic map(
		init_file => "rtl/roms/30174-01n6.hex",
		widthad_a => 10,
		width_a => 4)
port map(
		clock => clk6,
		address => PRAM(2) & PRAM(7 downto 3) & P6_R5sum(3 downto 0),
		q => Vid(4 downto 1)
		);
		
--N6: entity work.n6_prom
--port map(
--	clock => clk6,
--	address => PRAM(2) & PRAM(7 downto 3) & P6_R5sum(3 downto 0),
--	q => Vid(4 downto 1)
--	);

M6: entity work.sprom
generic map(
		init_file => "rtl/roms/30175-01m6.hex",
		widthad_a => 10,
		width_a => 4)
port map(
		clock => clk6,
		address => PRAM(2) & PRAM(7 downto 3) & P6_R5sum(3 downto 0),
		q => Vid(8 downto 5)
		);

--M6: entity work.m6_prom
--port map(
--	clock => clk6,
--   address => PRAM(2) & PRAM(7 downto 3) & P6_R5sum(3 downto 0),
--	q => Vid(8 downto 5)
--	);

L6: entity work.sprom
generic map(
		init_file => "rtl/roms/30176-01l6.hex",
		widthad_a => 10,
		width_a => 4)
port map(
		clock => clk6,
		address => PRAM(2) & PRAM(7 downto 3) & P6_R5sum(3 downto 0),
		q => Vid(12 downto 9)
		);

--L6: entity work.l6_prom
--port map(
--	clock => clk6,
--	address => PRAM(2) & PRAM(7 downto 3) & P6_R5sum(3 downto 0),
--	q => Vid(12 downto 9)
--	);

K6: entity work.sprom
generic map(
		init_file => "rtl/roms/30177-01k6.hex",
		widthad_a => 10,
		width_a => 4)
port map(
		clock => clk6,
	address => PRAM(2) & PRAM(7 downto 3) & P6_R5sum(3 downto 0),
	q(2 downto 0) => Vid(15 downto 13)
		);

--K6: entity work.k6_prom
--port map(
--	clock => clk6,
--	address => PRAM(2) & PRAM(7 downto 3) & P6_R5sum(3 downto 0),
--	q(2 downto 0) => Vid(15 downto 13)
--	);
	
-- Some glue logic
Match_n <= not(P6_R5sum(7) and P6_R5sum(6) and P6_R5sum(5) and P6_R5sum(4));
R6_8 <= not(H256_n and H8 and Phi1 and (H64 nand Match_n));


R4_in <= R6_8 & H64 & H32 & H16;
R4: process(R4_in)
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


-- Object 1 Horizontal position counter
-- This combines two 74163s at locations P5 and P6 on the PCB 
P5_4: process(clk6, H256_s, Load_n, DMA_n)
begin
	if rising_edge(clk6) then
		if Load_n(1) = '0' then -- preload the counter
			Object1_Hpos <= DMA_n;
		elsif H256_s = '1' then -- increment the counter
			Object1_Hpos <= Object1_Hpos + '1';		
		end if;
		if Object1_Hpos(7 downto 4) = "1111" then
			Object1_Inh <= '0';
		else
			Object1_Inh <= '1';
		end if;
	end if;
end process;

-- Object 1 video shift register
-- This combines two 74165s at locations N7 and N8 on the PCB
N7_8: process(clk6, Object1_Inh, Load_n, Vid)
begin
	if Load_n(5) = '0' then
			Object1_reg <= Vid & '0'; -- Preload the register
	elsif rising_edge(clk6) then
		if Object1_Inh = '0' then
			Object1_reg <= '0' & Object1_reg(15 downto 1);
		end if;
	end if;
end process;
Object(1) <= Object1_reg(0);
Object_n(1) <= (not Object1_reg(0));


-- Object 2 Horizontal position counter
-- This combines two 74LS163s at locations P5 and P6 on the PCB 
P5_6: process(clk6, H256_s, Load_n, DMA_n)
begin
	if rising_edge(clk6) then
		if Load_n(2) = '0' then -- preload the counter
			Object2_Hpos <= DMA_n;
		elsif H256_s = '1' then -- increment the counter
			Object2_Hpos <= Object2_Hpos + '1';
		end if;
		if Object2_Hpos(7 downto 4) = "1111" then
			Object2_Inh <= '0';
		else
			Object2_Inh <= '1';
		end if;
	end if;
end process;

-- Object 2 video shift register
M7_8: process(clk6, Load_n, Vid)
begin
	if Load_n(6) = '0' then
			Object2_reg <= Vid & '0'; -- Preload the register
	elsif rising_edge(clk6) then
		if Object2_Inh = '0' then
			Object2_reg <= '0' & Object2_reg(15 downto 1);
		end if;
	end if;
end process;
Object(2) <= Object2_reg(0);
Object_n(2) <= (not Object2_reg(0));


-- Object 3 Horizontal position counter
-- This combines two 74LS163s at locations M5 and M4 on the PCB 
M5_4: process(clk6, H256_s, Load_n, DMA_n)
begin
	if rising_edge(clk6) then
		if Load_n(3) = '0' then -- preload the counter
			Object3_Hpos <= DMA_n;
		elsif H256_s = '1' then -- increment the counter
			Object3_Hpos <= Object3_Hpos + '1';
		end if;
		if Object3_Hpos(7 downto 4) = "1111" then
			Object3_Inh <= '0';
		else
			Object3_Inh <= '1';
		end if;
	end if;
end process;

-- Object 3 video shift register
L7_8: process(clk6, Object3_Inh, Load_n, Vid)
begin
	if Load_n(7) = '0' then
			Object3_reg <= Vid & '0'; -- Preload the register
	elsif rising_edge(clk6) then
		if Object3_Inh = '0' then
			Object3_reg <= '0' & Object3_reg(15 downto 1);
		end if;
	end if;
end process;
Object(3) <= Object3_reg(0);
Object_n(3) <= (not Object3_reg(0));


-- Object 4 Horizontal position counter
-- This combines two 74LS163s at locations L5 and L4on the PCB 
L5_4: process(clk6, H256_s, Load_n, DMA_n)
begin
	if rising_edge(clk6) then
		if Load_n(4) = '0' then -- preload the counter
			Object4_Hpos <= DMA_n;
		elsif H256_s = '1' then -- increment the counter
			Object4_Hpos <= Object4_Hpos + '1';
		end if;
		if Object4_Hpos(7 downto 4) = "1111" then
			Object4_Inh <= '0';
		else
			Object4_Inh <= '1';
		end if;
	end if;
end process;

-- Object 4 video shift register
K7_8: process(clk6, Object4_Inh, Load_n, Vid)
begin
	if Load_n(8) = '0' then
			Object4_reg <= Vid & '0'; -- Preload the register
	elsif rising_edge(clk6) then
		if Object4_Inh = '0' then
			Object4_reg <= '0' & Object4_reg(15 downto 1);
		end if;
	end if;
end process;
Object(4) <= Object4_reg(0);
Object_n(4) <= (not Object4_reg(0));

end rtl;
