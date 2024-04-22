-- CPU, RAM, ROM and address decoder for Atari Canyon Bomber
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
			CLK12				: in  	        std_logic;
			Ena_3k				: buffer     	std_logic; -- 3kHz clock enable, used by sound circuit
			Reset_I				: in  	     	std_logic;
			Reset_n				: buffer	std_logic;
			VBlank				: in		std_logic;
			VCount				: in 		std_logic_vector(7 downto 0);
			HCount				: in  		std_logic_vector(8 downto 0);
			Test_n				: in  		std_logic;
			Coin1_n				: in		std_logic;
			Coin2_n				: in		std_logic;
			Start1_n			: in		std_logic;
			Start2_n			: in		std_logic;
			Fire1_n				: in		std_logic;
			Fire2_n				: in		std_logic;
			Slam_n				: in		std_logic;
			DIP_Sw				: in		std_logic_vector(8 downto 1);
			Motor1_n			: out		std_logic;
			Motor2_n			: out		std_logic;
			Explode_n			: out		std_logic;
			Whistle1 			: out		std_logic;
			Whistle2			: out		std_logic;
			Player1Lamp			: out		std_logic;
			Player2Lamp			: out		std_logic;
			Attract1			: out		std_logic;
			Attract2			: out		std_logic;
			PHI1_O				: out 		std_logic;
			PHI2_O				: out 		std_logic;
			DBus				: buffer	std_logic_vector(7 downto 0);
			DISPLAY				: out		std_logic_vector(7 downto 0)
			);
end CPU_mem;

architecture rtl of CPU_mem is

signal PHI1		: std_logic;
signal PHI2		: std_logic;
signal Q5		: std_logic;
signal Q6		: std_logic;
signal A7_2		: std_logic;
signal A7_5		: std_logic;
signal A7_7		: std_logic;

signal A8_6		: std_logic;

signal H256		: std_logic;
signal H256_n		: std_logic;
signal H128		: std_logic;
signal H64		: std_logic;
signal H32		: std_logic;
signal H16		: std_logic;
signal H8		: std_logic;
signal H4		: std_logic;

signal V128_D : std_logic;
signal V128		: std_logic;
signal V64		: std_logic;
signal V32		: std_logic;
signal V16		: std_logic;
signal V8		: std_logic;

signal IRQ_n		: std_logic;
signal NMI_n		: std_logic;
signal RW_n		: std_logic;
signal RnW 		: std_logic;
signal ADR		: std_logic_vector(15 downto 0);
signal cpuDin		: std_logic_vector(7 downto 0);
signal cpuDout		: std_logic_vector(7 downto 0);

signal ROM1_dout	: std_logic_vector(7 downto 0);
signal ROM2_dout	: std_logic_vector(7 downto 0);
signal ROM3_dout	: std_logic_vector(7 downto 0);
signal ROM4_dout	: std_logic_vector(7 downto 0);
signal ROM_dout		: std_logic_vector(7 downto 0);

signal ROM1		: std_logic;
signal ROM2		: std_logic;
signal ROM3		: std_logic;
signal ROM4		: std_logic;
signal ROM_ce		: std_logic;

signal cpuRAM_dout	: std_logic_vector(7 downto 0);
signal Vram_dout	: std_logic_vector(7 downto 0);
signal RAM_addr		: std_logic_vector(9 downto 0) := (others => '0');
signal VraM_Din		: std_logic_vector(7 downto 0);
signal Vram_addr	: std_logic_vector(9 downto 0) := (others => '0');
signal RAM_dout		: std_logic_vector(7 downto 0);
signal addRAM_dout 	: std_logic_vector(7 downto 0);
signal RAM_we		: std_logic := '0';
signal RAM_RW_n 	: std_logic := '1';
signal RAM_ce_n		: std_logic := '1';
signal RAM_n		: std_logic := '1'; 
signal WRAM		: std_logic := '0';
signal WRAM_n 		: std_logic := '0';
signal WRITE_n		: std_logic := '1';

signal Display_n	: std_logic := '1';

signal Timer_Reset_n	: std_logic := '1';
signal Options_n	: std_logic;
signal Switch_n		: std_logic := '1';

signal WDog_Clear	: std_logic := '0';
signal WDog_count	: std_logic_vector(3 downto 0) := "0000";

signal Inputs 		: std_logic_vector(2 downto 0) := "111";
signal Switchmux1_n 	: std_logic := '1';
signal K8_y		: std_logic_vector(1 downto 0);

signal H7_y		: std_logic_vector(1 downto 0);

signal ena_count        : std_logic_vector(11 downto 0) := (others => '0');
signal ena_750k		: std_logic;


begin

H8 <= HCount(3);
H16 <=  HCount(4);
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



-- In the original hardware the CPU is clocked by a signal derived from 4H from the horizontal
-- line counter. This attemps to do things in a manner that is more proper for a synchronous
-- FPGA design using the main 6MHz clock in conjunction with a 750kHz clock enable for the CPU.
-- This also creates a 3kHz clock enable used by the sound module.
Clock_ena: process(Clk12) 
begin
	if rising_edge(Clk12) then
		ena_count <= ena_count + "1";
		ena_750k <= '0';
		if (ena_count(3 downto 0) = "0000") then --100
			ena_750k <= '1'; -- 750 kHz
		end if;
		ena_3k <= '0';
		if (ena_count(11 downto 0) = "000000000000") then
			ena_3k <= '1';
		end if;
	end if;
end process;


-- Watchdog timer, counts pulses from V128 and resets CPU if not cleared by Timer_Reset_n
Watchdog: process(clk12, WDog_Clear, Reset_I)
begin
	if Reset_I = '0' then
		WDog_count <= "1111";
	elsif rising_edge(clk12) then 
		V128_D <= V128;
		if Wdog_Clear = '1' then
			WDog_count <= "0000";
		elsif V128_D = '0' and V128 = '1' then
			WDog_count <= WDog_count + 1;
		end if;
	end if;
end process;
WDog_Clear <= (Test_n nand Timer_Reset_n);
Reset_n <= not WDog_count(3);


CPU: entity work.T65
port map(
		Enable => ena_750k,
		Mode => "00",
		Res_n => reset_n,
		Clk => Clk12,
		Rdy => '1',
		Abort_n => '1',
		IRQ_n => '1',
		NMI_n => NMI_n,
		SO_n => '1',
		R_W_n => RW_n,
		A(15 downto 0) => Adr,
		DI => cpuDin,
		DO => cpuDout
		);

		
	
DBUS <= cpuDout;

RnW <= (not RW_n);

NMI_n <= not (Vblank and Test_n);

		
-- CPU clock -- Using 750kHz enable now, should probably derive Phi2 signal from that
H4 <= Hcount(2);
CPU_clock: process(clk12, H4, Q5, Q6)
begin
	if rising_edge(clk12) then
		Q5 <= H4;
		Q6 <= Q5;
	end if;
	phi1 <= not (Q5 or Q6); --?
end process;

PHI2 <= (not PHI1);
PHI1_O <= PHI1;
PHI2_O <= PHI2;

	
A8_6 <= not(RnW and PHI2 and H4 and WRITE_n);
A7: process(clk12, A8_6) -- Shift register chain of 4 DFF's clocked by clk12, creates a delayed WRITE_n
begin
	if rising_edge(clk12) then
		A7_2 <= A8_6;
		A7_5 <= A7_2;
		A7_7 <= A7_5;
		WRITE_n <= A7_7;
	end if;
end process;
		

-- Program ROMs
J1: entity work.sprom
generic map(
		init_file => "./roms/9499-01.j1.mif",
		widthad_a => 10,
		width_a => 4)
port map(
		clock => clk12, 
		address => Adr(9 downto 0),
		q => rom3_dout(3 downto 0)
		);

P1: entity work.sprom
generic map(
		init_file => "./roms/9503-01.p1.mif",
		widthad_a => 10,
		width_a => 4)
port map(
		clock => clk12, 
		address => Adr(9 downto 0),
		q => rom3_dout(7 downto 4)
		);

D1: entity work.sprom
generic map(
		init_file => "./roms/9496-01.d1.mif",
		widthad_a => 11,
		width_a => 8)
port map(
		clock => clk12, 
		address => Adr(10 downto 0),
		q => rom4_dout
		);

-- ROM data mux
ROM_dout <= ROM3_dout when ROM3 = '1' and Adr(10) = '1' else
			ROM4_dout when ROM4 = '1' else
			x"FF";		

ED7: entity work.spram
generic map(
		addr_width_g => 8,
		data_width_g => 8)
port map(
		clock => Clk12,
		address => Adr(7 downto 0),
		wren => (not write_n) and (not WRAM_n),
		data => CPUDout,
		q => addRAM_dout
		);
		
-- Video RAM
-- Access is multiplexed between the CPU and video hardware depending on the state of Phi2	
Video_RAM: entity work.spram
generic map(
		addr_width_g => 10,
		data_width_g => 8)
port map(
		clock => Clk12,
		address => Vram_addr,
		wren => ram_we,
		data => CPUDout,
		q => VRAM_Dout
		);	

--Video RAM is addressed by video circuitry when Phi2 is low and by CPU when Phi2 is high
Vram_addr <= (V128 or H256_n) & (V64 or H256_n) & (V32 or H256_n) & (V16 or H256_n) & (V8 and H256) & H128 & H64 & H32 & H16 & H8
				when phi2 = '0' else Adr(9 downto 0);


-- Original RAM has both WE and CE which are selected by K2 according to the state of the phase 2 clock
-- Altera block RAM has active high WE, original RAM had active low WE
ram_we <= (not Write_n) and (not Display_n) and Phi2;


-- Rising edge of phi2 clock latches output of VRAM data bus 	
F5: process(phi2, VRam_Dout)
begin
	if rising_edge(phi2) then
		display <= Vram_dout;
	end if;
end process;
	
	
-- Address decoder
-- 9301 decoder at F6
Display_n <= '0' when Adr(13 downto 11) = "001" else '1';
Switch_n <= '0' when Adr(13 downto 11) = "010" else '1';
Options_n  <= '0' when Adr(13 downto 11) = "011" else '1';
ROM3  <= '1' when Adr(13 downto 11) = "110" else '0';
ROM4  <= '1' when Adr(13 downto 11) = "111" else '0';
RAM_n <= '0' when Adr(13 downto 11) = "001" and RnW = '0' else '1';
ROM_ce <= (ROM3 or ROM4);

-- 9321 Decoder at E6
WRAM_n <= '0' when Adr(13 downto 9) = "00000" else '1';
Motor1_n <= '0' when Write_n = '0' and Adr(13 downto 9) = "00010" and Adr(8) = '0' and Adr(0) = '0' else '1';
Motor2_n <= '0' when Write_n = '0' and Adr(13 downto 9) = "00010" and Adr(8) = '0' and Adr(0) = '1' else '1';
Explode_n <= '0' when Write_n = '0' and Adr(13 downto 9) = "00010" and Adr(8) = '1' and Adr(0) = '0' else '1';
Timer_Reset_n <= '0' when Write_n = '0' and Adr(13 downto 9) = "00010" and Adr(8) = '1' and Adr(0) = '1' else '1';

-- 9334 addressable latch at C7, this drives outputs
C7: process(clk12, Reset_n, Adr)
begin
	if (Reset_n = '0') then
		Whistle1 <= '0'; 		-- Shell whistle sound 1
		Whistle2 <= '0';		-- Shell whistle sound 2
		Player1Lamp <= '0';	-- Player 1 Start LED
		Player2Lamp <= '0'; 	-- Player 2 Start LED
		Attract1 <= '0';		-- Attract1 signal
		Attract2 <= '0';		-- Attract2 signal
		elsif rising_edge(clk12) then
		-- This next line models part of the address decoder that enables this latch
		if (Write_n = '0' and ADR(13 downto 9) = "00011") then 
		  case Adr(8 downto 7) & Adr(0) is
			 when "000" => Whistle1 <= Adr(1);
			 when "001" => Whistle2 <= Adr(1);
			 when "010" => Player1Lamp <= Adr(1);
			 when "011" => Player2Lamp <= Adr(1);
			 when "100" => Attract1 <= Adr(1);
			 when "101" => Attract2 <= Adr(1);
			 when others => null;
		  end case;
		end if;
 end if;
end process;


-- Input switches
J8: process(Adr, Coin1_n, Coin2_n, Start1_n, Start2_n, Test_n, VBlank, Slam_n)
begin
	case Adr(2 downto 0) is  -- Uses inverted output of mux
		when "000" => Switchmux1_n <= (not Coin1_n);
		when "001" => Switchmux1_n <= (not Coin2_n);
		when "010" => Switchmux1_n <= (not Start1_n);
		when "011" => Switchmux1_n <= (not Start2_n);
		when "100" => Switchmux1_n <= (not Test_n);
		when "101" => Switchmux1_n <= (not VBlank);
		when "110" => Switchmux1_n <= '0';
		when "111" => Switchmux1_n <= (not Slam_n);
		when others => Switchmux1_n <= '1';
	end case;
end process;

-- 74LS153 dual selector/multiplexer at H7 reads configuration DIP switches
H7: process(Adr, DIP_Sw)
begin
	case Adr(1 downto 0) is
		when "00" => H7_y <= DIP_Sw(8) & DIP_Sw(7); 
		when "01" => H7_y <= DIP_Sw(6) & DIP_Sw(5);
		when "10" => H7_y <= DIP_Sw(4) & DIP_Sw(3);
		when "11" => H7_y <= DIP_Sw(2) & DIP_Sw(1);
		when others => H7_y <= "11";
		end case;
end process;

-- 74LS153 dual selector/multiplexer at K8 reads Fire buttons
K8: process(Adr, Fire1_n, Fire2_n)
begin
	case Adr(1 downto 0) is
		when "00" => K8_y <= '1' & '1'; 
		when "01" => K8_y <= '1' & '1';
		when "10" => K8_y <= '1' & Fire1_n;
		when "11" => K8_y <= '1' & Fire2_n;
		when others => K8_y <= "11";
		end case;
end process;
-- Steer and Thrust inputs are shown on schematic connected to this selector but 
-- not used by Canyon Bomber. Listing here for completeness
-- Steer1A_n, Steer1B_n, Steer2A_n, Steer2B_n, Thrust1_n, Thrust2_n 


-- CPU Din mux
cpuDin <= 	ROM_dout when rom_ce = '1' else 
				Vram_dout when RAM_n = '0' and Display_n = '0' else 
				addRAM_dout when WRAM_n = '0' else
				Switchmux1_n & "11111" & K8_y(1 downto 0) when Switch_n = '0' else
				"111111" & H7_y when Options_n = '0' else
				x"FF";
	
end rtl;
