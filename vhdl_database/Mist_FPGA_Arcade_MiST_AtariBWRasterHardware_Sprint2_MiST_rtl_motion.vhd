-- Motion object generation circuitry for Kee Games Sprint 2
-- This generates the four cars which are the only moving objects in the game
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
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity motion is 
port(		
			CLK6			: in  std_logic; -- 6MHz* on schematic
			CLK12			: in  std_logic;
			PHI2			: in  std_logic;
			DISPLAY		: in  std_logic_vector(7 downto 0);
			H256_s		: in  std_logic; -- 256H* on schematic
			VCount		: in  std_logic_vector(7 downto 0);
			HCount		: in  std_logic_vector(8 downto 0);
			Crash_n		: out std_logic;
			Motor1_n		: out std_logic;
			Motor2_n		: out std_logic;
			Car1  		: out std_logic;
			Car1_n  		: out std_logic;
			Car2  		: out std_logic;
			Car2_n  		: out std_logic;
			Car3_4_n  	: out std_logic
			);
end motion;

architecture rtl of motion is

signal phi0			: std_logic;

signal LDH1_n		: std_logic;
signal LDH2_n		: std_logic;
signal LDH3_n		: std_logic;
signal LDH4_n		: std_logic;

signal LDV1A_n		: std_logic;
signal LDV2A_n		: std_logic;
signal LDV3A_n		: std_logic;
signal LDV4A_n		: std_logic;

signal LDV1B_n		: std_logic;
signal LDV2B_n		: std_logic;
signal LDV3B_n		: std_logic;
signal LDV4B_n		: std_logic;

signal Car1_Inh	: std_logic;
signal Car2_Inh	: std_logic;
signal Car3_Inh	: std_logic;
signal Car4_Inh	: std_logic;

signal LM4_sum		: std_logic_vector(7 downto 0) := x"00";
signal N4_8			: std_logic;

signal H256_n		: std_logic;
signal H256			: std_logic;
signal H64 			: std_logic;
signal H32			: std_logic;
signal H16			: std_logic;
signal H8			: std_logic;
signal H4			: std_logic;

signal L5_reg		: std_logic_vector(3 downto 0);

signal J8_3			: std_logic;
signal J8_6			: std_logic;

signal K8_in		: std_logic_vector(3 downto 0);
signal K8_out		: std_logic_vector(9 downto 0);
signal P7_in		: std_logic_vector(3 downto 0);
signal P7_out		: std_logic_vector(9 downto 0);

signal Car1_Hpos	    : std_logic_vector(7 downto 0) := x"00";
signal Car2_Hpos	    : std_logic_vector(7 downto 0) := x"00";
signal Car3_Hpos	    : std_logic_vector(7 downto 0) := x"00";
signal Car4_Hpos	    : std_logic_vector(7 downto 0) := x"00";

signal Car1_reg	: std_logic_vector(15 downto 0) := x"0000";
signal Car2_reg	: std_logic_vector(15 downto 0) := x"0000";
signal Car3_reg 	: std_logic_vector(15 downto 0) := x"0000";
signal Car4_reg 	: std_logic_vector(15 downto 0) := x"0000";

signal Vid			: std_logic_vector(7 downto 0);


begin
phi0 <= phi2;

H4 <= Hcount(2);
H8 <= Hcount(3);
H16 <= Hcount(4);
H32 <= Hcount(5);
H64 <= Hcount(6);
H256 <= Hcount(8);
H256_n <= not(Hcount(8));

-- Vertical line comparator
LM4_sum <= Display + VCount; 
N4_8 <= not(LM4_sum(7) and LM4_sum(6) and LM4_sum(5) and LM4_sum(4) and LM4_sum(3) and H256_n and H64 and H8);


-- D type flip-flops in L5
L5: process(phi2, N4_8, LM4_sum(2 downto 0))
begin
	if rising_edge(phi2) then
		L5_reg <= N4_8 & LM4_sum(2 downto 0);
	end if;
end process;


-- Motion object PROMs - These contain the car images for all 32 possible orientations
J6: entity work.sprom
generic map(
		init_file => "rtl/roms/6399-01j6.hex",
		widthad_a => 9,
		width_a => 4)
port map(
		clock => clk6,
		address => Display(7 downto 3) & L5_reg(2 downto 0) & phi2,
		q => Vid(7 downto 4)
		);
		
--J6: entity work.j6_prom
--port map(
--	clock => clk6,
--	address => Display(7 downto 3) & L5_reg(2 downto 0) & phi2,
--	q => Vid(7 downto 4)
--	);

K6: entity work.sprom
generic map(
		init_file => "rtl/roms/6398-01k6.hex",
		widthad_a => 9,
		width_a => 4)
port map(
		clock => clk6,
		address => Display(7 downto 3) & L5_reg(2 downto 0) & phi2,
		q => Vid(3 downto 0)
		);
		
--K6: entity work.k6_prom
--port map(
--	clock => clk6,
--	address => Display(7 downto 3) & L5_reg(2 downto 0) & phi2,
--	q => Vid(3 downto 0)
--	);


	
-- Some glue logic
J8_3 <= (H4 or L5_reg(3));
J8_6 <= (H256 or H64 or H4);


-- Decoders
-- Making K8 synchronous fixes weird problem with ghost artifacts of motion objects
K8_in <= J8_3 & H32 & H16 & phi0;
K8: process(clk6, K8_in)
begin
	if rising_edge(clk6) then
		case K8_in is
			when "0000" =>
				K8_out <= "1111111110";
			when "0001" =>
				K8_out <= "1111111101"; 
			when "0010" =>
				K8_out <= "1111111011"; 
			when "0011" =>
				K8_out <= "1111110111";
			when "0100" =>
				K8_out <= "1111101111"; 
			when "0101" =>
				K8_out <= "1111011111";
			when "0110" =>
				K8_out <= "1110111111"; 
			when "0111" =>
				K8_out <= "1101111111";
			when "1000" =>
				K8_out <= "1011111111";
			when "1001" =>
				K8_out <= "0111111111";
			when others =>
				K8_out <= "1111111111";
			end case;
		end if;
end process;
LDV3B_n <= K8_out(7);
LDV3A_n <= K8_out(6);
LDV2B_n <= K8_out(5);
LDV2A_n <= K8_out(4);
LDV1B_n <= K8_out(3);
LDV1A_n <= K8_out(2);
LDV4B_n <= K8_out(1);
LDV4A_n <= K8_out(0);

P7_in <= J8_6 & H32 & H16 & H8;
P7: process(P7_in)
begin
	case P7_in is
		when "0000" =>
         P7_out <= "1111111110";
		when "0001" =>
         P7_out <= "1111111101";
      when "0010" =>
         P7_out <= "1111111011";
      when "0011" =>
         P7_out <= "1111110111";
      when "0100" =>
         P7_out <= "1111101111";
      when "0101" =>
         P7_out <= "1111011111";
      when "0110" =>
         P7_out <= "1110111111";
      when "0111" =>
         P7_out <= "1101111111";
      when "1000" =>
         P7_out <= "1011111111";
      when "1001" =>
         P7_out <= "0111111111";
      when others =>
         P7_out <= "1111111111";
      end case;
end process;
Crash_n <= P7_out(7);
Motor2_n <= P7_out(6);
Motor1_n <= P7_out(5);	
LDH4_n <= P7_out(4);
LDH3_n <= P7_out(3); 
LDH2_n <= P7_out(2);
LDH1_n <= P7_out(1);


-- Car 1 Horizontal position counter
-- This combines two 74163s at locations R5 and R6 on the PCB 
R5_6: process(clk6, H256_s, LDH1_n, Display)
begin
	if rising_edge(clk6) then
		if LDH1_n = '0' then -- preload the counter
			Car1_Hpos <= Display;
		elsif H256_s = '1' then -- increment the counter
			Car1_Hpos <= Car1_Hpos + '1';		
		end if;
		if Car1_Hpos(7 downto 3) = "11111" then
			Car1_Inh <= '0';
		else
			Car1_Inh <= '1';
		end if;
	end if;
end process;

-- Car 1 video shift register
-- This combines two 74165s at locations M7 and N7 on the PCB
M_N7: process(clk12, Car1_Inh, LDV1A_n, LDV1B_n, Vid)
begin
	if LDV1A_n = '0' then
			Car1_reg(7 downto 0) <= Vid(7 downto 1) & '0'; -- Preload the LSB register
	elsif LDV1B_n = '0' then
			Car1_reg(15 downto 8) <= Vid(7 downto 0); -- Preload the MSB register
	elsif rising_edge(clk12) then
		if Car1_Inh = '0' then
			Car1_reg <= '0' & Car1_reg(15 downto 1);
		end if;
	end if;
end process;
Car1 <= Car1_reg(0);
Car1_n <= not Car1_reg(0);


-- Car 2 Horizontal position counter
-- This combines two 74LS163s at locations P5 and P6 on the PCB 
P5_6: process(clk6, H256_s, LDH2_n, Display)
begin
	if rising_edge(clk6) then
		if LDH2_n = '0' then -- preload the counter
			Car2_Hpos <= Display;
		elsif H256_s = '1' then -- increment the counter
			Car2_Hpos <= Car2_Hpos + '1';
		end if;
		if Car2_Hpos(7 downto 3) = "11111" then
			Car2_Inh <= '0';
		else
			Car2_Inh <= '1';
		end if;
	end if;
end process;

-- Car 2 video shift register
K_L7: process(clk12, Car2_Inh, LDV2A_n, LDV2B_n, Vid)
begin
	if LDV2A_n = '0' then
			Car2_reg(7 downto 0) <= Vid(7 downto 1) & '0'; -- Preload the LSB register
	elsif LDV2B_n = '0' then
			Car2_reg(15 downto 8) <= Vid(7 downto 0); -- Preload the MSB register
	elsif rising_edge(clk12) then
		if Car2_Inh = '0' then
			Car2_reg <= '0' & Car2_reg(15 downto 1);
		end if;
	end if;
end process;
Car2 <= Car2_reg(0);
Car2_n <= not Car2_reg(0);


-- Car 3 Horizontal position counter
-- This combines two 74LS163s at locations N5 and N6 on the PCB 
N5_6: process(clk6, H256_s, LDH3_n, Display)
begin
	if rising_edge(clk6) then
		if LDH3_n = '0' then -- preload the counter
			Car3_Hpos <= Display;
		elsif H256_s = '1' then -- increment the counter
			Car3_Hpos <= Car3_Hpos + '1';
		end if;
		if Car3_Hpos(7 downto 3) = "11111" then
			Car3_Inh <= '0';
		else
			Car3_Inh <= '1';
		end if;
	end if;
end process;

-- Car 3 video shift register
H_J7: process(clk12, Car3_Inh, LDV3A_n, LDV3B_n, Vid)
begin
	if LDV3A_n = '0' then
			Car3_reg(7 downto 0) <= Vid(7 downto 1) & '0'; -- Preload the LSB register
	elsif LDV3B_n = '0' then
			Car3_reg(15 downto 8) <= Vid(7 downto 0); -- Preload the MSB register
	elsif rising_edge(clk12) then
		if Car3_Inh = '0' then
			Car3_reg <= '0' & Car3_reg(15 downto 1);
		end if;
	end if;
end process;


-- Car 4 Horizontal position counter
-- This combines two 74LS163s at locations M5 and M6 on the PCB 
M5_6: process(clk6, H256_s, LDH4_n, Display)
begin
	if rising_edge(clk6) then
		if LDH4_n = '0' then -- preload the counter
			Car4_Hpos <= Display;
		elsif H256_s = '1' then -- increment the counter
			Car4_Hpos <= Car4_Hpos + '1';
		end if;
		if Car4_Hpos(7 downto 3) = "11111" then
			Car4_Inh <= '0';
		else
			Car4_Inh <= '1';
		end if;
	end if;
end process;

-- Car 4 video shift register
E_F7: process(clk12, Car4_Inh, LDV4A_n, LDV4B_n, Vid)
begin
	if LDV4A_n = '0' then
			Car4_reg(7 downto 0) <= Vid(7 downto 1) & '0'; -- Preload the LSB register
	elsif LDV4B_n = '0' then
			Car4_reg(15 downto 8) <= Vid(7 downto 0); -- Preload the MSB register
	elsif rising_edge(clk12) then
		if Car4_Inh = '0' then
			Car4_reg <= '0' & Car4_reg(15 downto 1);
		end if;
	end if;
end process;
Car3_4_n <= not (Car3_reg(0) or Car4_reg(0));

end rtl;
