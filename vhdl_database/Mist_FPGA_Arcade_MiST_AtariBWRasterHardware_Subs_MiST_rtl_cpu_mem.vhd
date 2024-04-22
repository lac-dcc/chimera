-- CPU, RAM, ROM and address decoder for Atari Subs
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

entity CPU_mem is 
port(		
			Clk6					: in  	std_logic; -- 6MHz on schematic
			Ena_3k				: buffer	std_logic; -- 3kHz clock enable, used by sound circuit
			Reset_I				: in  	std_logic;
			Reset_n				: buffer	std_logic;
			VCount				: in 		std_logic_vector(7 downto 0);
			HCount				: in  	std_logic_vector(8 downto 0);
			Test_n				: in  	std_logic;
			DBus_in				: in  	std_logic_vector(7 downto 0);
			PRAM					: buffer std_logic_vector(7 downto 0);
			Adr					: out 	std_logic_vector(10 downto 0);
			Control_Read_n		: buffer	std_logic;
			Steer_Reset_n		: out 	std_logic;
			Options_Read_n		: buffer std_logic;
			Coin_Read_n			: buffer std_logic;
			LED1					: out 	std_logic;
			LED2					: out 	std_logic;
			SnrStart1			: out 	std_logic;
			SnrStart2			: out 	std_logic;
			Noise_Reset_n		: out 	std_logic;
			Crash					: out 	std_logic;
			Explode				: out 	std_logic;
			Invert1				: out 	std_logic;
			Invert2				: out 	std_logic;
			PHI1					: buffer std_logic;
			PHI2					: buffer std_logic;
			DMA					: out 	std_logic_vector(7 downto 0);
			DMA_n				   : out		std_logic_vector(7 downto 0)
			);
end CPU_mem;

architecture rtl of CPU_mem is

signal H2					: std_logic;
signal H4					: std_logic;
signal H8					: std_logic;
signal H16					: std_logic;
signal H32					: std_logic;
signal H64					: std_logic;
signal H128					: std_logic;
signal H256 				: std_logic;
signal H256_n				: std_logic;

signal V8					: std_logic;
signal V16					: std_logic;
signal V32					: std_logic;
signal V64					: std_logic;
signal V128					: std_logic;

signal ena_count        : std_logic_vector(10 downto 0) := (others => '0');
signal ena_750k			: std_logic;
signal ena_750k_2			: std_logic;

signal A 					: std_logic_vector(15 downto 0) := (others => '0');
signal BA					: std_logic_vector(10 downto 0);
signal WRAM					: std_logic;
signal RnW					: std_logic;
signal RAM_n				: std_logic;
signal RAM					: std_logic;
signal Write_n				: std_logic;
signal Display_n			: std_logic;

signal cpu_Din				: std_logic_vector(7 downto 0);
signal cpu_Dout			: std_logic_vector(7 downto 0);
signal DBuS_n				: std_logic_vector(7 downto 0);
signal NMI_n				: std_logic;
signal RW_n					: std_logic;

signal ROM0_n				: std_logic;
signal ROM1_n 				: std_logic;
signal ROM2_n   			: std_logic;
signal ROM3_n				: std_logic;

signal ROM0_dout			: std_logic_vector(7 downto 0);
signal ROM1_dout			: std_logic_vector(7 downto 0);
signal ROM2_dout			: std_logic_vector(7 downto 0);
signal ROM3_dout			: std_logic_vector(7 downto 0);

signal RAM_addr			: std_logic_vector(9 downto 0) := (others => '0');
signal Vram_addr			: std_logic_vector(9 downto 0);
signal Vram_dout			: std_logic_vector(7 downto 0);
signal RAM_dout			: std_logic_vector(7 downto 0);
signal ram_we				: std_logic;

signal Inputs_n			: std_logic := '1';
signal Timer_Reset_n		: std_logic := '1';

signal WDog_Clear			: std_logic;
signal WDog_count			: std_logic_vector(3 downto 0);


begin

-- In the original hardware the CPU is clocked directly by the 4H signal from the horizontal
-- line counter. This attemps to do thins in a manner that is more proper for a synchronous
-- FPGA design using the main 6MHz clock in conjunction with a 750kHz clock enable for the CPU.
-- This also creates a 3kHz clock enable used by filters in the sound module.
Clock_ena: process(Clk6) 
begin
	if rising_edge(Clk6) then
		ena_count <= ena_count + "1";
		ena_750k <= '0';
		ena_750k_2 <= '0';
		if (ena_count(2 downto 0) = "000") then
			ena_750k <= '1'; -- 750 kHz
		end if;
		if (ena_count(2 downto 0) = "100") then
			ena_750k_2 <= '1'; -- 750kHz phase 2
		end if;
		ena_3k <= '0';
		if (ena_count(10 downto 0) = "00000000000") then
			ena_3k <= '1';
		end if;
	end if;
end process;
  

H2 <= HCount(1);
H4 <= HCount(2);
H8 <= HCount(3);
H16 <= HCount(4);
H32 <= HCount(5);
H64 <= HCount(6);
H128 <= HCount(7);
H256 <= HCount(8);
H256_n <= (not HCount(8));

V8 <= VCount(3);
V16 <= VCount(4);
V32 <= VCount(5);
V64 <= VCount(6);
V128 <= VCount(7);


-- Watchdog timer, counts pulses from V128 and resets CPU if not cleared by Timer_Reset_n
Watchdog: process(V128, WDog_Clear, Reset_I)
begin
	if Reset_I = '0' then
		WDog_count <= "1111";
	elsif Wdog_Clear = '1' then
		WDog_count <= "0000";
	elsif rising_edge(V128) then
		WDog_count <= WDog_count + 1;
	end if;
end process;
WDog_Clear <= (Test_n nand Timer_Reset_n);
Reset_n <= (not WDog_count(3));
		

CPU: entity work.T65
port map(
		Enable => ena_750k,
		Mode => "00",
		Res_n => reset_n,
		Clk => clk6,
		Rdy => '1',
		Abort_n => '1',
		IRQ_n => '1',
		NMI_n => NMI_n,
		SO_n => '1',
		R_W_n => RW_n,
		A(15 downto 0) => A,
		DI => cpu_Din,
		DO => cpu_Dout
		);
BA(7 downto 0) <= A(7 downto 0);
BA(8) <= WRAM or A(8);
BA(9) <= WRAM or A(9);
BA(10) <= A(10);
Adr <= BA;
DBuS_n <= (not cpu_Dout);
RnW <= (not RW_n);
NMI_n <= V32 nand Test_n;

Write_n <= (Phi2 nand H2) or RW_n;

Phi2 <= (H4);
Phi1 <= not Phi2;


-- Program ROMs
-- E1 and E2 hold only French and Spanish text strings and may be omitted in English/German
-- boards, but causes ROM error in self test if they are missing
--E1: entity work.ProgROM0a
--port map(
--		clock => clk6,
--		address => BA(8 downto 0),
--		q => ROM0_dout(3 downto 0)
--		);

E1: entity work.ROM_E1
port map(
	clk => clk6,
	addr => BA(7 downto 0),
	data => ROM0_dout(3 downto 0)
);

--E2: entity work.ProgROM0b	
--port map(
--		clock => clk6,
--		address => BA(8 downto 0),
--		q => ROM0_dout(7 downto 4)
--		);

E2: entity work.ROM_E2
port map(
	clk => clk6,
	addr => BA(7 downto 0),
	data => ROM0_dout(7 downto 4)
);
		
--P1: entity work.ProgROM1
--port map(
--		clock => clk6,
--		address => BA(10 downto 0),
--		q => ROM1_dout
--		);
		
P1: entity work.ROM_P1
port map(
	clk => clk6,
	addr => BA(10 downto 0),
	data => ROM1_dout
);

--P2: entity work.ProgROM2
--port map(
--		clock => clk6,
--		address => BA(10 downto 0),
--		q => ROM2_dout
--		);
		
P2: entity work.ROM_P2
port map(
	clk => clk6,
	addr => BA(10 downto 0),
	data => ROM2_dout
);		
		
--N2: entity work.ProgROM3
--port map(
--		clock => clk6,
--		address => BA(10 downto 0),
--		q => ROM3_dout
--		);
		
N2: entity work.ROM_N2
port map(
	clk => clk6,
	addr => BA(10 downto 0),
	data => ROM3_dout
);		
		
-- Video RAM 
RAM1k: entity work.ram1k
port map(
	clock => clk6,
	address => RAM_addr,
	wren => ram_we,
	data => DBus_n,
	q => RAM_dout
	);


PRAM <= (not RAM_dout);
ram_we <= (not Write_n) and (not Display_n);
Vram_addr <= (V128 or H256_n) & (V64 or H256_n) & (V32 or H256_n) & (V16 and H256) & (V8 and H256) & H128 & H64 & H32 & H16 & H8;

-- Selects control of RAM address between CPU and video circuit
VRAM_mux: process(clk6)
begin	
	if rising_edge(clk6) then
		if phi2 = '0' then
			RAM_addr <= Vram_addr; 
		else
			RAM_addr <= BA(9 downto 0);
		end if;
	end if;
end process;

--Latches data from RAM bus on rising edge of Phi2 clock
D5_6: process(clk6) --fix
begin
	if rising_edge(phi2) then
		DMA_n <= RAM_dout;
		DMA <= (not RAM_dout);
	end if;
end process;


-- Address decoder
-- Using more of a behavioral modeling technique here rather than copying 
-- the whole original circuit as that caused some timing problems.
-- 74LS42 at B9 decodes ROM and RAM enable signals 
ROM0_n <= '0' when A(13 downto 11) = "100" else '1';
ROM1_n <= '0' when A(13 downto 11) = "101" else '1';
ROM2_n <= '0' when A(13 downto 11) = "110" else '1';
ROM3_n <= '0' when A(13 downto 11) = "111" else '1';
WRAM <= '1' when A(13 downto 11) = "000" and BA(7) = '1' else '0'; 
Display_n <= '0' when A(13 downto 11) = "001" or WRAM = '1' else '1';

RAM_n <= RnW or Display_n;
RAM <= (not RAM_n);

-- 74LS42 at D9 decodes IO enable signals
-- Write to outputs
Noise_Reset_n 	<= '0' when Write_n = '0' and A(13 downto 11) = "000" and BA(7 downto 5) = "000" else '1';
Steer_Reset_n 	<= '0' when Write_n = '0' and A(13 downto 11) = "000" and BA(7 downto 5) = "001" else '1';
Timer_Reset_n 	<= '0' when Write_n = '0' and A(13 downto 11) = "000" and BA(7 downto 5) = "010" else '1';

-- Read to inputs						
Control_Read_n <= '0' when Write_n = '1' and A(13 downto 11) = "000" and BA(7 downto 5) = "000" else '1';
Coin_Read_n 	<= '0' when Write_n = '1' and A(13 downto 11) = "000" and BA(7 downto 5) = "001" else '1';
Options_Read_n <= '0' when Write_n = '1' and A(13 downto 11) = "000" and BA(7 downto 5) = "011" else '1';
	
-- Combine these to simplify CPU data in mux
Inputs_n <= Control_Read_n and Coin_Read_n and Options_Read_n;


-- 74LS259 addressable latch at C9, this drives outputs
C9: process(clk6, Reset_n, Write_n) -- added write_n
begin
	if (Reset_n = '0') then
		LED1 <= '0'; 		-- Player 1 Start LED
		LED2 <= '0';		-- Player 2 Start LED
		SnrStart2 <= '0';	-- Player 1 Sonar ping trigger
		SnrStart1 <= '0'; -- Player 2 Sonar ping trigger
		Crash <= '0';		-- Crash sound enable
		Explode <= '0';	-- Explosion sound enable
		Invert1 <= '0';	-- Player 1 video invert
		Invert2 <= '0'; 	-- Player 2 video invert
		elsif rising_edge(clk6) then
		-- This next line models part of the address decoder that enables this latch
		if (Write_n = '0' and A(13 downto 11) = "000" and BA(7 downto 5) = "011") then 
		  case A(3 downto 1) is
			 when "000" => LED1 <= A(0);
			 when "001" => LED2 <= A(0);
			 when "010" => SnrStart2 <= A(0);
			 when "011" => SnrStart1 <= A(0);
			 when "100" => Crash <= A(0);
			 when "101" => Explode <= A(0);
			 when "110" => Invert1 <= A(0);
			 when "111" => Invert2 <= A(0);
			 when others => null;
		  end case;
		end if;
 end if;
end process;


-- CPU Data-in mux, selects whether CPU is reading RAM, ROM, or inputs
cpu_Din <= 	PRAM when (RAM_n or Display_n) = '0' else
				ROM0_dout when ROM0_n = '0' else
				ROM1_dout when ROM1_n = '0' else 
				ROM2_dout when ROM2_n = '0' else
				ROM3_dout when ROM3_n = '0' else
				DBus_in when Inputs_n = '0' else
				x"FF";

end rtl;