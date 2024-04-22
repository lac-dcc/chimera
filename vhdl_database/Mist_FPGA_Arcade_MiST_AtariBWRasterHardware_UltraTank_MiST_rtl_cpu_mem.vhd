-- CPU, RAM, ROM and address decoder for Kee Games Ultra Tank
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

entity CPU_mem is 
port(		
			CLK12					: in  std_logic;
			CLK6					: in  std_logic; -- 6MHz on schematic
			Reset_n				: in  std_logic;
			VCount				: in 	std_logic_vector(7 downto 0);
			HCount				: in  std_logic_vector(8 downto 0);
			Vblank_n_s			: in  std_logic; -- Vblank* on schematic
			Test_n				: in  std_logic;
			Collision_n			: in  std_logic;
			DB_in					: in 	std_logic_vector(7 downto 0); -- CPU data bus
			DBus					: buffer std_logic_vector(7 downto 0);
			DBuS_n				: buffer std_logic_vector(7 downto 0);
			PRAM  				: buffer std_logic_vector(7 downto 0);
			ABus					: out std_logic_vector(15 downto 0);
			Attract				: buffer std_logic;
			Attract_n			: out std_logic;
			CollReset_n			: out std_logic_vector(4 downto 1);
			Barrier_Read_n		: out std_logic;		
			Throttle_Read_n	: out std_logic;
			Coin_Read_n			: out std_logic;
			Options_Read_n		: out std_logic;
			Wr_DA_Latch_n		: out std_logic;
			Wr_Explosion_n		: out std_logic;
			Fire1					: out std_logic;
			Fire2					: out std_logic;
			LED1					: out std_logic;
			LED2					: out std_logic;
			Lockout_n			: out std_logic;
			PHI1_O				: out std_logic;
			PHI2_O				: out std_logic;
			DMA					: out std_logic_vector(7 downto 0);
			DMA_n				   : out	std_logic_vector(7 downto 0)
			);
end CPU_mem;

architecture rtl of CPU_mem is
-- Clock signals
signal cpu_clk				: std_logic;
signal PHI1					: std_logic;
signal PHI2					: std_logic;

-- Video scan signals
signal H256					: std_logic;
signal H256_n				: std_logic;
signal H128					: std_logic;
signal H64					: std_logic;
signal H32					: std_logic;
signal H16					: std_logic;
signal H8					: std_logic;
signal H4					: std_logic;
signal H2					: std_logic;
signal H1					: std_logic;
signal V128					: std_logic;
signal V64					: std_logic;
signal V32					: std_logic;
signal V16					: std_logic;
signal V8					: std_logic;

-- CPU signals
signal NMI_n				: std_logic := '1';
signal RW_n					: std_logic;
signal RnW 					: std_logic;
signal A						: std_logic_vector(15 downto 0);
signal ADR					: std_logic_vector(15 downto 0);
signal cpuDin				: std_logic_vector(7 downto 0);
signal cpuDout				: std_logic_vector(7 downto 0);

-- Address decoder signals
signal N10_in				: std_logic_vector(3 downto 0) := (others => '0');
signal N10_out				: std_logic_vector(9 downto 0) := (others => '1');
signal M10_out_A			: std_logic_vector(3 downto 0) := (others => '1');
signal M10_out_B			: std_logic_vector(3 downto 0) := (others => '1');
signal B2_in				: std_logic_vector(3 downto 0) := (others => '0');
signal B2_out				: std_logic_vector(9 downto 0) := (others => '1');
signal R10_Q				: std_logic := '0';
signal D4_8					: std_logic := '1';

-- Buses and chip enables
signal cpuRAM_dout		: std_logic_vector(7 downto 0) := (others => '0');
signal AddRAM_dout		: std_logic_vector(7 downto 0) := (others => '0');
signal Vram_dout			: std_logic_vector(7 downto 0) := (others => '0');
signal RAM_din				: std_logic_vector(7 downto 0) := (others => '0');
signal RAM_addr			: std_logic_vector(9 downto 0) := (others => '0');
signal Vram_addr			: std_logic_vector(9 downto 0) := (others => '0');
signal RAM_dout			: std_logic_vector(7 downto 0) := (others => '0');
signal RAM_we				: std_logic;
signal RAM_n				: std_logic := '1'; 
signal WRAM					: std_logic;
signal WRITE_n				: std_logic := '1';
signal ROM_mux_in			: std_logic_vector(1 downto 0) := (others => '0');
signal ROM3_dout			: std_logic_vector(7 downto 0) := (others => '0');
signal ROM4_dout			: std_logic_vector(7 downto 0) := (others => '0');
signal ROM_dout			: std_logic_vector(7 downto 0) := (others => '0');
signal ROM3_n				: std_logic := '1';
signal ROM4_n				: std_logic := '1';
signal ROMCE_n				: std_logic := '1';
signal ADDRAM_n			: std_logic := '1';
signal Display_n			: std_logic := '1';
signal VBlank_Read_n		: std_logic := '1';
signal Timer_Reset_n		: std_logic := '1';
signal Collision_Read_n	: std_logic := '1';
signal Inputs_n			: std_logic := '1';
signal Test					: std_logic := '0';

begin

Test <= (not Test_n);

H1 <= HCount(0);
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
	
DBus_n <= (not cpuDout); -- Data bus to video RAM is inverted
DBus <= cpuDout;
ABus <= ADR;
ADR(15 downto 10) <= A(15 downto 10);
ADR(9 downto 8) <= (A(9) or WRAM) & (A(8) or WRAM);
ADR(7 downto 0) <= A(7 downto 0);
RnW <= (not RW_n);

NMI_n <= ((not V32) or Test);

-- DFF and logic used to generate the Write_n signal
R10: process(H1, H2)
begin
	if rising_edge(H1) then
		R10_Q <= (not H2);
	end if;
end process;
Write_n <= (phi2 and R10_Q) nand RnW;


-- CPU clock and phase 2 clock output
Phi2 <= H4;
Phi1 <= (not PHI2);
Phi1_O <= PHI1;
Phi2_O <= PHI2;

	
-- Program ROMs
N1: entity work.sprom
generic map(
		init_file => "rtl/roms/030180n1.hex",
		widthad_a => 11,
		width_a => 4)
port map(
		clock => clk6,
		address => ADR(10 downto 0),
		q => rom3_dout(3 downto 0)
		);

K1: entity work.sprom
generic map(
		init_file => "rtl/roms/030181k1.hex",
		widthad_a => 11,
		width_a => 4)
port map(
		clock => clk6,
		address => ADR(10 downto 0),
		q => rom3_dout(7 downto 4)
		);
		
M1: entity work.sprom
generic map(
		init_file => "rtl/roms/030182m1.hex",
		widthad_a => 11,
		width_a => 4)
port map(
		clock => clk6,
		address => ADR(10 downto 0),
		q => rom4_dout(3 downto 0)
		);		

L1: entity work.sprom
generic map(
		init_file => "rtl/roms/030183l1.hex",
		widthad_a => 11,
		width_a => 4)
port map(
		clock => clk6,
		address => ADR(10 downto 0),
		q => rom4_dout(7 downto 4)
		);

-- ROM data mux
ROM_mux_in <= (ROM4_n & ROM3_n);
ROM_mux: process(ROM_mux_in, rom3_dout, rom4_dout)
	begin
	ROM_dout <= (others => '0');
 case ROM_mux_in is
	when "10" => rom_dout <= rom3_dout;
	when "01" => rom_dout <= rom4_dout;
	when others => null;
 end case;
end process;
ROMCE_n <= (ROM3_n and ROM4_n);


-- Additional CPU RAM - Many earlier games use only a single RAM as both CPU and video RAM. This hardware has a separate 128 byte RAM
A1: entity work.spram
generic map(
	widthad_a => 7,
	width_a => 8)
port map(
	clock => clk6,
	address => Adr(6 downto 0),
	wren => (not Write_n) and (not ADDRAM_n) and (not Adr(7)),
	data => cpuDout,
	q => AddRAM_dout
	);
	
--A1: entity work.ram128
--port map(
--	clock => clk6,
--	address => Adr(6 downto 0),
--	wren => (not Write_n) and (not ADDRAM_n) and (not Adr(7)),
--	data => cpuDout,
--	q => AddRAM_dout
--	);
	
	
-- Video RAM 
RAM: entity work.spram
generic map(
	widthad_a => 10,
	width_a => 8)
port map(
	clock => clk6,
	address => RAM_addr,
	wren => RAM_we,
	data => DBus_n,
	q => RAM_dout
	);
	
--RAM: entity work.ram1k
--port map(
--	clock => clk6,
--	address => RAM_addr,
--	wren => RAM_we,
--	data => DBus_n,
--	q => RAM_dout
--	);

	
-- Altera block RAM has active high WE, original RAM had active low WE
ram_we <= (not Write_n) and (not Display_n);

Vram_addr <= (V128 or H256_n) & (V64 or H256_n) & (V32 or H256_n) & (V16 and H256) & (V8 and H256) & H128 & H64 & H32 & H16 & H8;

RAM_addr <= Vram_addr when phi2 = '0' else Adr(9 downto 0);
	
PRAM <= (not RAM_dout);


-- Rising edge of phi2 clock latches inverted and non-inverted output of VRAM data bus into DMA and DMA_n complementary buses
F5: process(phi2, PRAM)
begin
	if rising_edge(phi2) then
			DMA <= PRAM;
			DMA_n <= (not PRAM);
	end if;
end process;


-- Address decoder
B2_in <= '0' & Adr(13 downto 11); -- AND gate C4 is involved with Adr(15), function unknown
B2: process(B2_in)
begin
	case B2_in is
      when "0000" =>
         B2_out <= "1111111110";
      when "0001" =>
         B2_out <= "1111111101";
      when "0010" =>
         B2_out <= "1111111011";
      when "0011" =>
         B2_out <= "1111110111";
      when "0100" =>
         B2_out <= "1111101111";
      when "0110" =>
         B2_out <= "1110111111";
      when "0111" =>
         B2_out <= "1101111111";
      when others =>
         B2_out <= "1111111111";
      end case;
end process;
ADDRAM_n <= B2_out(0);
VBlank_Read_n <= B2_out(2);
Barrier_Read_n <= B2_out(3);
ROM3_n <= B2_out(6);
ROM4_n <= B2_out(7);
WRAM <= not ((not Adr(7)) or B2_out(0));
Display_n <= (not WRAM) and B2_out(1);
RAM_n <= (Display_n or RnW);


D4_8 <= not ( (not B2_out(4)) and (not Adr(7)) and (Write_n nand (Phi2 nand RW_n)));

N10_in <= D4_8 & RnW & Adr(6 downto 5);
N10: process(N10_in)
begin
	case N10_in is
		when "0000" =>
         N10_out <= "1111111110";
		when "0001" =>
         N10_out <= "1111111101";
      when "0010" =>
         N10_out <= "1111111011";
      when "0011" =>
         N10_out <= "1111110111";
      when "0100" =>
         N10_out <= "1111101111";
		when "0101" =>
         N10_out <= "1111011111";
		when "0110" =>
         N10_out <= "1110111111";
		when "0111" =>
         N10_out <= "1101111111";
      when "1000" =>
         N10_out <= "1011111111";
      when "1001" =>
         N10_out <= "0111111111";
      when others =>
         N10_out <= "1111111111";
      end case;
end process;	
Throttle_Read_n <= N10_out(0);
Coin_Read_n <= N10_out(1);
Collision_Read_n <= N10_out(2);
Options_Read_n <= N10_out(3);

-- Used for CPU data-in mux, asserts to read inputs 
Inputs_n <= B2_out(3) and N10_out(0) and N10_out(1) and N10_out(2) and N10_out(3) and B2_out(3);

-- DFF that creates the Attract and Attract_n signals
R_10: process(N10_out, DBus_n, Attract)
begin
	if rising_edge(N10_out(4)) then 
		Attract <= DBus_n(0);                  
	end if;
	Attract_n <= (not Attract);
end process;

-- 9321 dual decoder at M10 creates collision reset, watchdog reset, explosion sound and input DA latch signals
M10: process(N10_out, Adr)
begin
	if N10_out(5) = '1' then
		M10_out_A <= "1111";
	else
		case Adr(2 downto 1) is
			when "00" => M10_out_A <= "1110";
			when "01" => M10_out_A <= "1101";
			when "10" => M10_out_A <= "1011";
			when "11" => M10_out_A <= "0111";
			when others => M10_out_A <= "1111";
		end case;
	end if;
	if N10_out(6) = '1' then
		M10_out_B <= "1111";
	else
		case Adr(2 downto 1) is
			when "00" => M10_out_B <= "1110";
			when "01" => M10_out_B <= "1101";
			when "10" => M10_out_B <= "1011";
			when "11" => M10_out_B <= "0111";
			when others => M10_out_B <= "1111";
		end case;
	end if;			
end process;
CollReset_n <= M10_out_A;
Timer_Reset_n <= M10_out_B(2);
Wr_Explosion_n <= M10_out_B(1);
Wr_DA_Latch_n <= M10_out_B(0);


-- E11 9334 addressable latch drives shell fire sound triggers, player start button LEDs and coin mech lockout coil
E11: process(clk6, N10_out, Adr)
begin
if rising_edge(clk6) then
	if (N10_out(7) = '0') then
	  case Adr(3 downto 1) is
		 when "000" => null;
		 when "001" => null;
		 when "010" => null;
		 when "011" => Lockout_n <= Adr(0);
		 when "100" => LED1 <= Adr(0);
		 when "101" => LED2 <= Adr(0);
		 when "110" => Fire2 <= Adr(0);
		 when "111" => Fire1 <= Adr(0);
		 when others => null;
	  end case;
	end if;
 end if;
end process;		


-- CPU Din mux, no tristate logic in modern FPGAs so this mux is used to select the source to the CPU data-in bus
cpuDin <=  	
				PRAM when (RAM_n = '0') and (Display_n = '0') else 				-- Video RAM
				AddRAM_dout when (ADDRAM_n or Adr(7)) = '0' else 					-- Additional RAM
				ROM_dout when ROMCE_n = '0' else 										-- Program ROM
				VBlank_n_s & Test_n & "111111" when Vblank_Read_n = '0' else 	-- VBlank and Self Test switch
				Collision_n & "1111111" when Collision_Read_n = '0' else			-- Collision Detection
				DB_in when Inputs_n = '0' else 											-- Inputs
				x"FF";
end rtl;

