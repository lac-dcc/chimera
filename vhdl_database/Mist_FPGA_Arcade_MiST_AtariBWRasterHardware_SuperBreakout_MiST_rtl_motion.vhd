-- Motion object generation circuitry for Atari Super Breakout
-- This generates the motion objects, three balls in the case of Super Breakout
-- 2017 James Sweet
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
			Clk6			: in  std_logic; -- 6MHz on schematic
			Phi2			: in  std_logic;
			Display		: in  std_logic_vector(7 downto 0);
			H256_s		: in  std_logic; -- 256H* on schematic
			VCount		: in  std_logic_vector(7 downto 0);
			HCount		: in  std_logic_vector(8 downto 0);
			Tones_n		: out std_logic; -- Used by sound circuit, comes from decoder here
			Ball1_n  	: out std_logic; 
			Ball2_n  	: out std_logic; -- Ball video outputs, summed by video output circuit
			Ball3_n  	: out std_logic
			);
end motion;

architecture rtl of motion is

signal A			: std_logic;
signal B			: std_logic;
signal C			: std_logic;
signal D			: std_logic;
signal E			: std_logic;
signal F			: std_logic;
signal G			: std_logic;
signal H			: std_logic;
signal I			: std_logic;
signal J 		: std_logic;
signal K			: std_logic;
signal L			: std_logic;
signal M			: std_logic;
signal N			: std_logic;

signal phi0		: std_logic;

signal LDH1_n	: std_logic;
signal LDH2_n	: std_logic;
signal LDH3_n	: std_logic;

signal LDV1A_n		: std_logic;
signal LDV2A_n		: std_logic;
signal LDV3A_n		: std_logic;

signal Ball1_Inh	: std_logic;
signal Ball2_Inh	: std_logic;
signal Ball3_Inh	: std_logic;

signal LM4_sum		: std_logic_vector(7 downto 0) := (others => '0');

signal N4_8			: std_logic;

signal H256_n		: std_logic;
signal H256			: std_logic;
signal H64 			: std_logic;
signal H32			: std_logic;
signal H16			: std_logic;
signal H8			: std_logic;
signal H4			: std_logic;

signal L5_reg		: std_logic_vector(4 downto 0) := (others => '0');

signal J8_3			: std_logic;
signal J8_6			: std_logic;

signal K8_in		: std_logic_vector(3 downto 0) := (others => '0');
signal K8_out		: std_logic_vector(9 downto 0) := (others => '0');
signal D7_in		: std_logic_vector(3 downto 0) := (others => '0');
signal D7_out		: std_logic_vector(9 downto 0) := (others => '0');

signal Ball1_Hpos	: std_logic_vector(7 downto 0) := (others => '0');
signal Ball2_Hpos	: std_logic_vector(7 downto 0) := (others => '0');
signal Ball3_Hpos	: std_logic_vector(7 downto 0) := (others => '0');

signal Ball1_reg	: std_logic_vector(7 downto 0) := (others => '0');
signal Ball2_reg	: std_logic_vector(7 downto 0) := (others => '0');
signal Ball3_reg 	: std_logic_vector(7 downto 0) := (others => '0');

signal Vid			: std_logic_vector(7 downto 0) := (others => '0');


begin
phi0 <= phi2;

H4 <= Hcount(2);
H8 <= Hcount(3);
H16 <= Hcount(4);
H32 <= Hcount(5);
H64 <= Hcount(6);
H256 <= Hcount(8);
H256_n <= not(Hcount(8));

LM4_sum <= Display + VCount; -- Binary adder and wide NAND gate forms the motion object comparator
N4_8 <= not(LM4_sum(7) and LM4_sum(6) and LM4_sum(5) and LM4_sum(4) and H256_n and H64 and H8);

-- D type latches in L5 and M9 clocked by phi2
L5: process(phi2, N4_8, LM4_sum(3 downto 0))
begin
	if rising_edge(phi2) then
		L5_reg <= N4_8 & LM4_sum(3 downto 0);
	end if;
end process;
	
K6: entity work.sprom
generic map(
		init_file => "rtl/roms/033282_k6.hex",
		widthad_a => 5,
		width_a => 8)
port map(
		clock => clk6,
		address => Display(7) & L5_reg(3 downto 0),
		q => Vid
		);
		
--K6: entity work.k6_prom
--port map(
--	clock => clk6,
--	address => Display(7) & L5_reg(3 downto 0),
--	q => Vid
--	);
	

J8_3 <= (H4 or L5_reg(4));

J8_6 <= (H256 or H64 or H4);

-- Decoder code could be cleaned up a bit
K8_in <= J8_3 & H32 & H16 & not phi0;
K8: process(clk6, K8_in)
begin
	if rising_edge(clk6) then
		case K8_in is
			when "0000" => K8_out <= "1111111110";
			when "0001" => K8_out <= "1111111101"; 
			when "0010" => K8_out <= "1111111011"; 
			when "0011" => K8_out <= "1111110111";
			when "0100" => K8_out <= "1111101111"; 
			when "0101" => K8_out <= "1111011111";
			when "0110" => K8_out <= "1110111111"; 
			when "0111" => K8_out <= "1101111111";
			when "1000" => K8_out <= "1011111111";
			when "1001" => K8_out <= "0111111111";
			when others => K8_out <= "1111111111";
			end case;
		LDV3A_n <= K8_out(6);
		LDV2A_n <= K8_out(4);
		LDV1A_n <= K8_out(2);
		end if;
end process;


D7_in <= J8_6 & H32 & H16 & H8;
D7: process(D7_in)
begin
	case D7_in is
		when "0000" => D7_out <= "1111111110";
		when "0001" => D7_out <= "1111111101";
		when "0010" => D7_out <= "1111111011";
      when "0011" => D7_out <= "1111110111";
      when "0100" => D7_out <= "1111101111";
      when "0101" => D7_out <= "1111011111";
      when "0110" => D7_out <= "1110111111";
      when "0111" => D7_out <= "1101111111";
      when "1000" => D7_out <= "1011111111";
      when "1001" => D7_out <= "0111111111";
      when others => D7_out <= "1111111111";
      end case;
end process;
	
Tones_n <= D7_out(2);
LDH1_n <= D7_out(1);
LDH2_n <= D7_out(3); 
LDH3_n <= D7_out(5);


-- Ball 1 Horizontal ball position counter
-- This combines two 74LS163s at locations R5 and R6 on the PCB 
R5_6: process(clk6, H256_s, LDH1_n, Display)
begin
	if rising_edge(clk6) then
		if LDH1_n = '0' then -- preload the counter
			Ball1_Hpos <= Display;
		elsif H256_s = '1' then -- increment the counter
			Ball1_Hpos <= Ball1_Hpos + '1';
		end if;
	end if;
end process;
D <= Ball1_Hpos(7);
C <= Ball1_Hpos(6);
B <= Ball1_Hpos(5);
A <= Ball1_Hpos(4);
Ball1_Inh <= not(A and B and C and D);

-- Ball 1 video shift register
N7: process(clk6, Ball1_Inh, LDV1A_n, Vid)
begin
	if LDV1A_n = '0' then
			Ball1_reg <= Vid; -- Preload the register with a line from the motion object PROM
	elsif rising_edge(clk6) then
		if Ball1_Inh = '0' then
			Ball1_reg <= '0' & Ball1_reg(7 downto 1);
		end if;
	end if;
end process;
Ball1_n <= not Ball1_reg(0);


-- Ball 2 Horizontal ball position counter
-- This combines two 74LS163s at locations P5 and P6 on the PCB 
P5_6: process(clk6, H256_s, LDH2_n, Display)
begin
	if rising_edge(clk6) then
		if LDH2_n = '0' then -- preload the counter
			Ball2_Hpos <= Display;
		elsif H256_s = '1' then -- increment the counter
			Ball2_Hpos <= Ball2_Hpos + '1';
		end if;
	end if;
end process;
J <= Ball2_Hpos(7);
H <= Ball2_Hpos(6);
F <= Ball2_Hpos(5);
E <= Ball2_Hpos(4);
Ball2_Inh <= not(E and F and H and J);

-- Ball 2 video shift register
L7: process(clk6, Ball2_Inh, LDV2A_n, Vid)
begin
	if LDV2A_n = '0' then
			Ball2_reg <= Vid; -- Preload the register with a line from the motion object PROM
	elsif rising_edge(clk6) then
		if Ball2_Inh = '0' then
			Ball2_reg <= '0' & Ball2_reg(7 downto 1);
		end if;
	end if;
end process;
Ball2_n <= not Ball2_reg(0);


-- Ball 3 Horizontal ball position counter
-- This combines two 74LS163s at locations N5 and N6 on the PCB 
N5_6: process(clk6, H256_s, LDH3_n, Display)
begin
	if rising_edge(clk6) then
		if LDH3_n = '0' then -- preload the counter
			Ball3_Hpos <= Display;
		elsif H256_s = '1' then -- increment the counter
			Ball3_Hpos <= Ball3_Hpos + '1';
		end if;
	end if;
end process;
N <= Ball3_Hpos(7);
M <= Ball3_Hpos(6);
L <= Ball3_Hpos(5);
K <= Ball3_Hpos(4);
Ball3_Inh <= not(K and L and M and N);

-- Ball 3 video shift register
J7: process(clk6, Ball3_Inh, LDV3A_n, Vid)
begin
	if LDV3A_n = '0' then
			Ball3_reg <= Vid; -- Preload the register with a line from the motion object PROM
	elsif rising_edge(clk6) then
		if Ball3_Inh = '0' then
			Ball3_reg <= '0' & Ball3_reg(7 downto 1);
		end if;
	end if;
end process;
Ball3_n <= not Ball3_reg(0);

end rtl;
