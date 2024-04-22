-- CPU, RAM, ROM and address decoder for Atari Dominos
-- Based upon work done previously for Sprint 2
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
			CLK12				: in  	 std_logic;
			CLK6				: in  	 std_logic; -- 6MHz on schematic
			Reset_I				: in  	 std_logic;
			Reset_n				: buffer std_logic;
			VCount				: in 	 std_logic_vector(7 downto 0);
			HCount				: in  	 std_logic_vector(8 downto 0);
			Vblank_s			: in  	 std_logic; -- Vblank* on schematic
			Vreset				: in 	 std_logic;
			Hsync_n				: in  	 std_logic;
			Test_n				: in  	 std_logic;
			Attract				: buffer std_logic;
			Tumble 				: out	 std_logic;
			Lamp1				: out 	 std_logic;
			Lamp2				: out 	 std_logic;
			PHI1_O				: out 	 std_logic;
			PHI2_O				: out 	 std_logic;
			DISPLAY				: out	 std_logic_vector(7 downto 0);
			IO_Adr				: out 	 std_logic_vector(9 downto 0);
			Inputs				: in  	 std_logic_vector(1 downto 0)
			);
end CPU_mem;

architecture rtl of CPU_mem is

signal cpu_clk			: std_logic;
signal PHI1			: std_logic;
signal PHI2			: std_logic;
signal Q5			: std_logic;
signal Q6			: std_logic;
signal A7_2			: std_logic;
signal A7_5			: std_logic;
signal A7_7			: std_logic;

signal A8_6			: std_logic;

signal H256			: std_logic;
signal H256_n			: std_logic;
signal H128			: std_logic;
signal H64			: std_logic;
signal H32			: std_logic;
signal H16			: std_logic;
signal H8			: std_logic;
signal H4			: std_logic;

signal V128			: std_logic;
signal V64			: std_logic;
signal V32			: std_logic;
signal V16			: std_logic;
signal V8			: std_logic;

signal IRQ_n			: std_logic;
signal NMI_n			: std_logic;
signal RW_n			: std_logic;
signal RnW 			: std_logic;
signal A			: std_logic_vector(15 downto 0);
signal ADR			: std_logic_vector(9 downto 0);
signal cpuDin			: std_logic_vector(7 downto 0);
signal cpuDout			: std_logic_vector(7 downto 0);
signal DBUS_n			: std_logic_vector(7 downto 0);
signal DBUS			: std_logic_vector(7 downto 0);

signal ROM3_dout		: std_logic_vector(7 downto 0);
signal ROM4_dout		: std_logic_vector(7 downto 0);
signal ROM_dout		        : std_logic_vector(7 downto 0);

signal ROM1 			: std_logic;
signal ROM2			: std_logic;
signal ROM3			: std_logic;
signal ROM4			: std_logic;
signal ROM_ce			: std_logic;
signal ROM_mux_in		: std_logic_vector(3 downto 0);

signal cpuRAM_dout	        : std_logic_vector(7 downto 0);
signal Vram_dout		: std_logic_vector(7 downto 0);
signal RAM_addr		        : std_logic_vector(9 downto 0) := (others => '0');
signal Vram_addr		: std_logic_vector(9 downto 0) := (others => '0');
signal Scanbus			: std_logic_vector(9 downto 0) := (others => '0');
signal RAM_dout		        : std_logic_vector(7 downto 0);
signal RAM_we			: std_logic := '0';
signal RAM_RW_n 		: std_logic := '1';
signal RAM_ce_n		        : std_logic := '1';
signal WRAM			: std_logic := '0';
signal WRITE_n			: std_logic := '1';

signal F2_in			: std_logic_vector(3 downto 0) := "0000";
signal F2_out			: std_logic_vector(9 downto 0) := "1111111111";
signal D2_in			: std_logic_vector(3 downto 0) := "0000";
signal D2_out			: std_logic_vector(9 downto 0) := "1111111111";
signal E8_in			: std_logic_vector(3 downto 0) := "0000";
signal E8_out			: std_logic_vector(9 downto 0) := "1111111111";
signal P3_8		        : std_logic := '0';

signal Sync_n			: std_logic := '1';
signal Switch_n		        : std_logic := '1';
signal Display_n		: std_logic := '1';
signal Addec_bus		: std_logic_vector(7 downto 0);

signal Timer_Reset_n	        : std_logic := '1';

signal J6_5			: std_logic := '0';
signal J6_9			: std_logic := '0';

signal Coin1			: std_logic := '0';
signal Coin2			: std_logic := '0';
signal Input_mux 		: std_logic := '0';
signal A8_8			: std_logic := '0';
signal H9_Q_n			: std_logic := '1';
signal J9_out			: std_logic_vector(7 downto 0);
signal H8_en			: std_logic := '0';

signal WDog_Clear		: std_logic := '0';
signal WDog_count		: std_logic_vector(3 downto 0) := "0000";

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
		Enable => '1',
		Mode => "00",
		Res_n => reset_n,
		Clk => phi1,
		Rdy => '1',
		Abort_n => '1',
		IRQ_n => '1',
		NMI_n => NMI_n,
		SO_n => '1',
		R_W_n => RW_n,
		A(15 downto 0) => A,
		DI => cpuDin,
		DO => cpuDout
		);
		
DBUS_n <= (not cpuDout); -- Data bus to video RAM is inverted
ADR(9 downto 7) <= (A(9) or WRAM) & (A(8) or WRAM) & (A(7) or WRAM);
ADR(6 downto 0) <= A(6 downto 0);
RnW <= (not RW_n);
IO_Adr <= Adr;
NMI_n <= not (Vblank_s and Test_n);

		
-- CPU clock
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

D1: entity work.sprom
generic map(
	widthad_a => 11,
	width_a => 8,
   init_file =>"roms/7352-02.d1.mif"
	)
port map(
	address => A(10) & ADR(9 downto 0),
	clock => clk6,
	q => rom3_dout
	);
	
E1: entity work.sprom
generic map(
	widthad_a => 11,
	width_a => 8,
   init_file =>"roms/7438-02.e1.mif"
	)
port map(
	address => A(10) & ADR(9 downto 0),
	clock => clk6,
	q => rom4_dout
	);	
	
-- ROM data mux
ROM_mux_in <= (ROM1 & ROM2 & ROM3 & ROM4);
ROM_mux: process(ROM_mux_in, rom3_dout, rom4_dout)
begin
	ROM_dout <= (others => '0');
 case ROM_mux_in is
	when "0010" => rom_dout <= rom3_dout;
	when "0001" => rom_dout <= rom4_dout;
	when others => null;
 end case;
end process;

-- RAM 
-- The original hardware multiplexes access to the RAM between the CPU and video hardware. Here we are 
-- just using dual-ported RAM
	
RAM: entity work.dpram
generic map(
	widthad_a => 10,
	width_a => 8)
port map(
	clock_a => clk6,
-- CPU side	
	address_a => adr(9 downto 0),
	wren_a => ram_we,
	data_a => DBUS_n,
	q_a=> CPUram_dout,
-- Video side
	clock_b => clk6,
	address_b => Vram_addr,
	wren_b => '0',
	data_b => x"FF",
	q_b => Vram_dout
	);
	

Vram_addr <= (V128 or H256_n) & (V64 or H256_n) & (V32 or H256_n) & (V16 and H256) & 	(V8 and H256) & H128 & H64 & H32 & H16 & H8;

-- Real hardware has both WE and CE which are selected by K2 according to the state of the phase 2 clock
-- Altera block RAM has active high WE, original RAM had active low WE
ram_we <= (not Write_n) and (not Display_n) and Phi2;
	
-- Rising edge of phi2 clock latches inverted output of VRAM data bus 	
F5: process(phi2)
begin
	if rising_edge(phi2) then
		display <= not Vram_dout;
	end if;
end process;

E2: entity work.sprom
generic map(
	widthad_a => 5,
	width_a => 8,
   init_file =>"roms/6401-01.e2.mif"
	)
port map(
	address => A(13 downto 9),
	clock => clk12,
	q => addec_bus
	);	

F2_in <= addec_bus(0) & addec_bus(1) & addec_bus(2) & addec_bus(3);	
WRAM <= addec_bus(4);
D2_in <= RnW & addec_bus(5) & addec_bus(6) & addec_bus(7);
	
-- Decoder code could be cleaned up a bit, unused decoder states are not explicitly implemented
F2: process(F2_in)
begin
	case F2_in is
      when "0000" =>
         F2_out <= "1111111110";
      when "0001" =>
         F2_out <= "1111111101";
      when "0010" =>
         F2_out <= "1111111011";
      when "0011" =>
         F2_out <= "1111110111";
      when "0100" =>
         F2_out <= "1111101111";
      when "0101" =>
         F2_out <= "1111011111";
      when "0110" =>
         F2_out <= "1110111111";
      when "0111" =>
         F2_out <= "1101111111";
      when others =>
         F2_out <= "1111111111";
      end case;
end process;

ROM1 <= (F2_out(0) nand F2_out(1));
ROM2 <= (F2_out(2) nand F2_out(3));
ROM3 <= (F2_out(4) nand F2_out(5));
ROM4 <= (F2_out(6) nand F2_out(7));
ROM_ce <= (ROM1 or ROM2 or ROM3 or ROM4);

D2: process(D2_in)
begin
	case D2_in is
		when "0000" =>
         D2_out <= "1111111110";
		when "0001" =>
         D2_out <= "1111111101";
      when "0010" =>
         D2_out <= "1111111011";
      when "0011" =>
         D2_out <= "1111110111";
      when "0100" =>
         D2_out <= "1111101111";
      when "1000" =>
         D2_out <= "1011111111";
      when "1001" =>
         D2_out <= "0111111111";
      when others =>
         D2_out <= "1111111111";
      end case;
end process;	


SYNC_n <= D2_out(1);
SWITCH_n <= D2_out(2);
DISPLAY_n <= (D2_out(0) and D2_out(8));
P3_8 <= (D2_out(9) or WRITE_n);

E8_in <= P3_8 & ADR(9 downto 7);

E8: process(E8_in)
begin
	case E8_in is
		when "0000" =>
         E8_out <= "1111111110";
		when "0001" =>
         E8_out <= "1111111101";
		when "0010" =>
         E8_out <= "1111111011";
		when "0011" =>
         E8_out <= "1111110111";
      when "0100" =>
         E8_out <= "1111101111";
      when "0101" =>
         E8_out <= "1111011111";
      when "0110" =>
         E8_out <= "1110111111";
      when others =>
         E8_out <= "1111111111";
      end case;
end process;

H8_en <= E8_out(0);
Timer_Reset_n <= E8_out(1);


-- H8 9334 
H8_dec: process(clk6, Adr)
begin
if rising_edge(clk6) then
	if (H8_en = '0') then
	  case Adr(6 downto 4) is
		 when "000" => Attract <= Adr(0);
		 when "001" => Tumble <= Adr(0);
		 when "010" => null;
		 when "011" => LAMP1 <= Adr(0);
		 when "100" => LAMP2 <= Adr(0);
		 when "101" => null; 
		 when "110" => null;
		 when "111" => null;
		 when others => null;
	  end case;
	end if;
 end if;
end process;		


-- CPU Din mux
cpuDin <= 	ROM_dout when rom_ce = '1' else 
				(not CPUram_dout) when Display_n = '0' else -- Remember RAM data is inverted
				VCount(7) & VBlank_s & Vreset & Attract & "1111" when Sync_n = '0' else -- Using V128 (VCount(7)) in place of 60Hz mains reference
				Inputs & "111111" when SWITCH_n = '0' else
				x"FF";
	
end rtl;
