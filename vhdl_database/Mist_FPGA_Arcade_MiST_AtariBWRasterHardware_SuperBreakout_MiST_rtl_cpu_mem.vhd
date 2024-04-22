-- CPU, RAM, ROM and address decoder for Atari Super Breakout
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

entity CPU_mem is 
port(	
			Clk12				: in  std_logic;
			Clk6				: in  std_logic;
			Reset_n			: in  std_logic;
			NMI_n				: in  std_logic;
			VCount			: in 	std_logic_vector(7 downto 0);
			HCount			: in  std_logic_vector(8 downto 0);
			Hsync_n			: in  std_logic;
			Timer_Reset_n	: in  std_logic;
			IntAck_n			: in  std_logic;
			IO_wr				: out std_logic;
			PHI2_O			: out std_logic;
			Display			: out	std_logic_vector(7 downto 0);
			IO_Adr			: out std_logic_vector(9 downto 0);
			Inputs			: in	std_logic_vector(1 downto 0)
			);
end CPU_mem;

architecture rtl of CPU_mem is

signal cpu_clk			: std_logic;
signal PHI1				: std_logic;
signal PHI2				: std_logic;
signal Q5				: std_logic;
signal Q6				: std_logic;
signal A7_2				: std_logic;
signal A7_5				: std_logic;
signal A7_7				: std_logic;

signal A8_6				: std_logic;

signal H256				: std_logic;
signal H256_n			: std_logic;
signal H128				: std_logic;
signal H64				: std_logic;
signal H32				: std_logic;
signal H16				: std_logic;
signal H8				: std_logic;
signal H4				: std_logic;

signal V128				: std_logic;
signal V64				: std_logic;
signal V32				: std_logic;
signal V16				: std_logic;
signal V8				: std_logic;

signal CPU_Reset_n	: std_logic;
signal IRQ_n			: std_logic;
signal RW_n				: std_logic;
signal RnW 				: std_logic;
signal A					: std_logic_vector(15 downto 0);
signal Adr				: std_logic_vector(9 downto 0);
signal cpuDin			: std_logic_vector(7 downto 0);
signal cpuDout			: std_logic_vector(7 downto 0);
signal DBUS_n			: std_logic_vector(7 downto 0);
signal DBUS				: std_logic_vector(7 downto 0);

-- No ROM 0 or 1 on the EPROM based version
signal ROM2_dout		: std_logic_vector(7 downto 0);
signal ROM3_dout		: std_logic_vector(7 downto 0);
signal ROM4_dout		: std_logic_vector(7 downto 0);
signal ROM_dout		: std_logic_vector(7 downto 0);

signal ROM2				: std_logic;
signal ROM3				: std_logic;
signal ROM4				: std_logic;
signal ROM_ce			: std_logic;
signal ROM_mux_in		: std_logic_vector(2 downto 0);

signal cpuRAM_dout	: std_logic_vector(7 downto 0);
signal Vram_dout		: std_logic_vector(7 downto 0);
signal RAM_addr		: std_logic_vector(9 downto 0) := (others => '0');
signal Vram_addr		: std_logic_vector(9 downto 0) := (others => '0');
signal scanbus			: std_logic_vector(9 downto 0) := (others => '0');
signal RAM_dout		: std_logic_vector(7 downto 0);
signal RAM_we			: std_logic;
signal RAM_RW_n 		: std_logic;
signal RAM_ce_n		: std_logic;
signal RAM_n			: std_logic; 
signal WRAM				: std_logic;
signal WRITE_n			: std_logic;

signal F2_in			: std_logic_vector(3 downto 0);
signal F2_out			: std_logic_vector(9 downto 0);
signal D2_in			: std_logic_vector(3 downto 0);
signal D2_out			: std_logic_vector(9 downto 0);
signal E8_in			: std_logic_vector(3 downto 0);
signal E8_out			: std_logic_vector(9 downto 0);

signal Sync1			: std_logic;
signal Sync1_n			: std_logic;
signal Sync2_n			: std_logic;
signal Switch_n		: std_logic;
signal Display_n		: std_logic;
signal Addec_bus		: std_logic_vector(7 downto 0);

signal J6_5				: std_logic;
signal J6_9				: std_logic;

signal D7 				: std_logic; 


begin

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


CPU: entity work.T65
port map(
		Enable => '1',
		Mode => "00",
		Res_n => CPU_reset_n,
		Clk => phi1,
		Rdy => '1',
		Abort_n => '1',
		IRQ_n => IRQ_n,
		NMI_n => NMI_n,
		SO_n => '1',
		R_W_n => RW_n,
		A(15 downto 0) => A,
		DI => cpuDin,
		DO => cpuDout
		);
		
DBUS_n <= (not cpuDout); -- Data bus to video RAM is inverted
Adr(9 downto 7) <= (A(9) or WRAM) & (A(8) or WRAM) & (A(7) or WRAM);
Adr(6 downto 0) <= A(6 downto 0);
IO_Adr <= Adr;
RnW <= (not RW_n);


-- CPU Din mux
cpuDin <= 	ROM_dout when rom_ce = '1' else 
				(not CPUram_dout) when DISPLAY_n = '0' else -- Remember RAM data is inverted
				Vcount when Sync1_n = '0' else
				Inputs & "111111" when SWITCH_n = '0' else
				D7 & "1111111" when Sync2_n = '0' else
				x"FF";


-- Watchdog timer
-- need to implement for sake of completeness
CPU_reset_n <= Reset_n; -- Bypass it for now
  
		
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
PHI2_O <= PHI2;

-- IRQ, M9
CPU_IRQ: process(V16, INTACK_n)
begin
	if INTACK_n = '1' then -- asynchronous preset
		if rising_edge(V16) then
			IRQ_n <= '0';
		end if;
	else
		IRQ_n <= '1';
	end if;
end process;
		

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
-- Note that Super Breakout only uses three ROMs, there is no ROM 1
C1: entity work.sprom
generic map(
		init_file => "rtl/roms/033453_c1.hex",
		widthad_a => 11,
		width_a => 8)
port map(
		clock => clk6,
		address => A(10) & ADR(9 downto 0),
		q => rom2_dout
		);
		
--C1: entity work.prog_rom2
--port map(
--		clock => clk6,
--		address => A(10) & ADR(9 downto 0),
--		q => rom2_dout
--		);


D1: entity work.sprom
generic map(
		init_file => "rtl/roms/033454_d1.hex",
		widthad_a => 11,
		width_a => 8)
port map(
		clock => clk6,
		address => A(10) & ADR(9 downto 0),
		q => rom3_dout
		);

--D1: entity work.prog_rom3
--port map(
--		clock => clk6,
--		address => A(10) & ADR(9 downto 0),
--		q => rom3_dout
--		);


E1: entity work.sprom
generic map(
		init_file => "rtl/roms/033455_e1.hex",
		widthad_a => 11,
		width_a => 8)
port map(
		clock => clk6,
		address => A(10) & ADR(9 downto 0),
		q => rom4_dout
		);
		
--E1: entity work.prog_rom4
--port map(
--		clock => clk6,
--		address => A(10) & ADR(9 downto 0),
--		q => rom4_dout
--		);


-- ROM data mux
ROM_mux_in <= (ROM2 & ROM3 & ROM4);
ROM_mux: process(ROM_mux_in, rom2_dout, rom3_dout, rom4_dout)
begin
	ROM_dout <= (others => '0');
	case ROM_mux_in is
		when "100" => rom_dout <= rom2_dout;
		when "010" => rom_dout <= rom3_dout;
		when "001" => rom_dout <= rom4_dout;
		when others => null;
		end case;
end process;
  
-- RAM 
-- The original hardware multiplexes access to the RAM between the CPU and video hardware depending on the state of
-- the phi2 clock. In the FPGA it's easier to use dual-ported RAM which is less dependent on precise timing.
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
	
--RAM: entity work.ram1k_dp
--port map(
--	clock => clk6,
-- CPU side	
--	address_a => adr(9 downto 0),
--	wren_a => ram_we,
--	data_a => DBUS_n,
--	q_a=> CPUram_dout,

-- Video side
--	address_b => Vram_addr,
--	wren_b => '0',
--	data_b => x"FF",
--	q_b => Vram_dout
--	);

-- Data selectors at K2, J2 and H2 are not needed due to the use of dual ported RAM. Here is some glue logic that
-- drives the video side RAM address
Vram_addr <= (V128 or H256_n) & (V64 or H256_n) & (V32 or H256_n) & (V16 and H256) & (V8 and H256) & H128 & H64 & H32 & H16 & H8;

-- Real hardware has both WE and CE which are selected by K2 according to the state of the phase 2 clock
-- Altera block RAM has active high WE, original RAM had active low WE
ram_we <= (not Write_n) and (not Display_n) and Phi2;
	
-- Rising edge of phi2 clock latches inverted output of VRAM data bus. This is not strictly necessary with the dual ported RAM	
F5: process(phi2)
begin
	if rising_edge(phi2) then
		display <= not Vram_dout;
	end if;
end process;
	
	
-- Address decoder
-- A15 and A14 are not used
-- E2 PROM - Original circuit uses a 32 byte bipolar PROM in the address decoder, this could easily be replaced with combinational logic
E2: entity work.sprom
generic map(
		init_file => "rtl/roms/006401_e2.hex",
		widthad_a => 5,
		width_a => 8)
port map(
		clock => clk12,
	address => A(13 downto 9),
	q => addec_bus
	);
		
--E2: entity work.addec_prom
--port map(
--	clock => clk12,
--	address => A(13 downto 9),
--	q => addec_bus
--	);
	
WRAM <= addec_bus(4);

	
-- Address Decoder -unused decoder states are not explicitly implemented
F2_in <= addec_bus(0) & addec_bus(1) & addec_bus(2) & addec_bus(3);
F2: process(F2_in)
begin
	case F2_in is
      when "0010" => F2_out <= "1111111011";
      when "0011" => F2_out <= "1111110111";
      when "0100" => F2_out <= "1111101111";
      when "0101" => F2_out <= "1111011111";
      when "0110" => F2_out <= "1110111111";
      when "0111" => F2_out <= "1101111111";
      when others => F2_out <= "1111111111";
      end case;
end process;

ROM2 <= (F2_out(2) nand F2_out(3));
ROM3 <= (F2_out(4) nand F2_out(5));
ROM4 <= (F2_out(6) nand F2_out(7));
ROM_ce <= (ROM2 or ROM3 or ROM4);


D2_in <= RnW & addec_bus(5) & addec_bus(6) & addec_bus(7);
D2: process(clk6, D2_in)
begin
	if rising_edge(clk6) then
		case D2_in is
		when "0000" => D2_out <= "1111111110";
		when "0001" => D2_out <= "1111111101";
		when "0010" => D2_out <= "1111111011";
		when "0011" => D2_out <= "1111110111";
		when "1000" => D2_out <= "1011111111";
		when "1001" => D2_out <= "0111111111";
		when others => D2_out <= "1111111111";
		end case;
	end if;
end process;	

RAM_n <= D2_out(0);
SYNC1_n <= D2_out(1);
SYNC1 <= (not SYNC1_n);
SWITCH_n <= D2_out(2);
SYNC2_n <= D2_out(3);
DISPLAY_n <= (D2_out(0) and D2_out(8));
IO_wr <= (D2_out(9) or WRITE_n); -- IO_wr comes from P3_8



J6: process(H128, Hsync_n, Sync1_n, Sync2_n, J6_9)
begin
	if Hsync_n = '0' then -- asynchronous clear
		J6_5 <= '0';
	elsif rising_edge(H128) then
		J6_5 <= '1';
	end if;
	
	if rising_edge(Sync1_n) then
		J6_9 <= J6_5;
	end if;
   if sync2_n = '0' then
		D7 <= J6_9;
	else
		D7 <= '1';
	end if;
end process;
	
end rtl;