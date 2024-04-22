-- CPU, RAM, ROM and address decoder for Atari Sprint 4
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
			CLK12					: in  std_logic;
			CLK6					: in  std_logic; -- 6MHz on schematic
			Reset_I				: in  std_logic;
			Reset_n				: buffer	std_logic;
			VCount				: in 	std_logic_vector(7 downto 0);
			HCount				: in  std_logic_vector(8 downto 0);
			Vblank_n_s			: in  std_logic; -- Vblank* on schematic
			Test_n				: in  std_logic;
			DB_in					: in 	std_logic_vector(7 downto 0); -- CPU data bus
			DBus					: buffer std_logic_vector(7 downto 0);
			DBuS_n				: buffer std_logic_vector(7 downto 0);
			PRAM  				: buffer std_logic_vector(7 downto 0);
			ABus					: out std_logic_vector(15 downto 0);
			Attract				: buffer std_logic;
			Attract_n			: out std_logic;
			CollReset_n			: out std_logic_vector(4 downto 1);
			Trac_Sel_Read_n	: buffer std_logic;		
			AD_Read_n			: buffer std_logic;
			Gas_Read_n			: buffer std_logic;
			Coin_Read_n			: buffer std_logic;
			Options_Read_n		: buffer std_logic;
			Wr_DA_Latch_n		: out std_logic;
			Wr_CrashWord_n		: out std_logic;
			StartLamp			: out std_logic_vector(4 downto 1);
			Skid					: out std_logic_vector(4 downto 1);
			PHI1_O				: out std_logic;
			PHI2_O				: out std_logic;
			DMA					: buffer std_logic_vector(7 downto 0);
			DMA_n				   : out	std_logic_vector(7 downto 0);
			ADR : buffer std_logic_vector(15 downto 0)
			);
end CPU_mem;

architecture rtl of CPU_mem is
-- Clock signals
signal cpu_clk				: std_logic;
signal PHI1					: std_logic;
signal PHI2					: std_logic;
signal ena_count        : std_logic_vector(10 downto 0) := (others => '0');
signal ena_750k			: std_logic;
signal ena_3k				: std_logic;

-- Watchdog timer signals
signal WDog_Clear			: std_logic;
signal WDog_count			: std_logic_vector(3 downto 0);

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
--signal ADR					: std_logic_vector(15 downto 0);
signal cpuDin				: std_logic_vector(7 downto 0);
signal cpuDout				: std_logic_vector(7 downto 0);

-- Address decoder signals
signal N10_in				: std_logic_vector(3 downto 0); -- := (others => '0');
signal N10_out				: std_logic_vector(9 downto 0); -- := (others => '1');
signal M10_out_A			: std_logic_vector(3 downto 0); -- := (others => '1');
signal M10_out_B			: std_logic_vector(3 downto 0); -- := (others => '1');
signal B2_in				: std_logic_vector(3 downto 0); -- := (others => '0');
signal B2_out				: std_logic_vector(9 downto 0); -- := (others => '1');
signal R10_Q				: std_logic := '0';
signal D4_8					: std_logic := '1';

-- Buses and chip enables
signal cpuRAM_dout		: std_logic_vector(7 downto 0) := (others => '0');
signal Vram_dout			: std_logic_vector(7 downto 0) := (others => '0');
signal RAM_din				: std_logic_vector(7 downto 0) := (others => '0');
signal RAM_addr			: std_logic_vector(9 downto 0) := (others => '0');
signal Vram_addr			: std_logic_vector(9 downto 0) := (others => '0');
signal RAM_dout			: std_logic_vector(7 downto 0) := (others => '0');
signal RAM_we				: std_logic;
signal RAM_n				: std_logic := '1'; 
signal WRAM					: std_logic;
signal WRITE_n				: std_logic := '1';
signal ROM_mux_in			: std_logic_vector(2 downto 0) := (others => '0');
signal ROM2_dout			: std_logic_vector(7 downto 0) := (others => '0');
signal ROM3_dout			: std_logic_vector(7 downto 0) := (others => '0');
signal ROM4_dout			: std_logic_vector(7 downto 0) := (others => '0');
signal ROM_dout			: std_logic_vector(7 downto 0) := (others => '0');
--signal ROM1_n 				: std_logic;
signal ROM2_n				: std_logic;
signal ROM3_n				: std_logic;
signal ROM4_n				: std_logic;
signal ROMCE_n				: std_logic;
signal Display_n			: std_logic;
signal VBlank_Read_n		: std_logic;
signal Timer_Reset_n		: std_logic;
signal Inputs_n			: std_logic;
signal Test					: std_logic;


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


-- In the original hardware the CPU is clocked directly by the 4H signal from the horizontal
-- line counter. This attemps to do thins in a manner that is more proper for a synchronous
-- FPGA design using the main 6MHz clock in conjunction with a 750kHz clock enable for the CPU.
-- This also creates a 3kHz clock enable used by filters in the sound module.
Clock_ena: process(Clk6) 
begin
	if rising_edge(Clk6) then
		ena_count <= ena_count + "1";
		ena_750k <= '0';
		if (ena_count(2 downto 0) = "000") then
			ena_750k <= '1'; -- 750 kHz
		end if;
		ena_3k <= '0';
		if (ena_count(10 downto 0) = "00000000000") then
			ena_3k <= '1';
		end if;
	end if;
end process;


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
WDog_Clear <= '1'; -- temporarily disable (Test_n nand Timer_Reset_n);
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

--Write_n <= (Phi2 and H2) nand RnW;

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
Phi1 <= (not Phi2);
Phi1_O <= Phi1;
Phi2_O <= Phi2;

	
-- Program ROMs
C1: entity work.ROM_C1
port map(
		clk => clk6,
		addr => ADR(10 downto 0),
		data => rom2_dout
		);

N1: entity work.ROM_N1_Low
port map(
		clk => clk6,
		addr => ADR(10 downto 0),
		data => rom3_dout(3 downto 0)
		);
	
K1: entity work.ROM_K1_High	
port map(
		clk => clk6,
		addr => ADR(10 downto 0),
		data => rom3_dout(7 downto 4)
		);

E1: entity work.ROM_E1
port map(
		clk => clk6,
		addr => ADR(10 downto 0),
		data => rom4_dout
		);


-- ROM data mux
ROM_mux_in <= (ROM4_n & ROM3_n & ROM2_n);
ROM_mux: process(ROM_mux_in, rom2_dout, rom3_dout, rom4_dout)
	begin
	ROM_dout <= (others => '0');
 case ROM_mux_in is
	when "110" => rom_dout <= rom2_dout;
	when "101" => rom_dout <= rom3_dout;
	when "011" => rom_dout <= rom4_dout;
	when others => null;
 end case;
end process;
ROMCE_n <= (ROM2_n and ROM3_n and ROM4_n);


	
-- Video RAM 
RAM: entity work.ram1k
port map(
	clock => clk6,
	address => RAM_addr,
	wren => RAM_we,
	data => DBus_n,
	q => RAM_dout
	);

	
-- Altera block RAM has active high WE, original RAM had active low WE
ram_we <= (not Write_n) and (not Display_n);

Vram_addr <= (V128 or H256_n) & (V64 or H256_n) & (V32 or H256_n) & (V16 and H256) & (V8 and H256) & H128 & H64 & H32 & H16 & H8;


VRAM_mux: process(clk6)
begin	
	if rising_edge(clk6) then
		if phi2 = '0' then
			RAM_addr <= Vram_addr; 
		else
			RAM_addr <= Adr(9 downto 0);
		end if;
	end if;
end process;


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
B2_in <= '0' & Adr(13 downto 11); -- AND gate C4 is involved with Adr(15), used for test interface
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
      when "0101" =>
         B2_out <= "1111011111";
      when "0110" =>
         B2_out <= "1110111111";
      when "0111" =>
         B2_out <= "1101111111";
      when "1000" =>
         B2_out <= "1011111111";
      when others =>
         B2_out <= "1111111111";
      end case;
end process;
VBlank_Read_n <= B2_out(2);
Trac_Sel_Read_n <= B2_out(3);
--ROM1_n <= B2_out(4);
ROM2_n <= B2_out(5);
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
AD_Read_n <= N10_out(0);
Coin_Read_n <= N10_out(1);
Gas_Read_n <= N10_out(2);
Options_Read_n <= N10_out(3);

-- Used for CPU data-in mux, asserts to read inputs 
--Inputs_n <= B2_out(2) and B2_out(3) and N10_out(0) and N10_out(1) and N10_out(2) and N10_out(3);
--Inputs_n <= B2_out(3) and N10_out(0) and N10_out(1) and N10_out(2) and N10_out(3) and B2_out(3);

Inputs_n <= (AD_Read_n and Coin_Read_n and Gas_Read_n and options_Read_n and Trac_Sel_Read_n);

-- DFF that creates the Attract and Attract_n signals
R_10: process(N10_out, DBus_n, Attract)
begin
	if rising_edge(N10_out(4)) then 
		Attract <= DBus_n(0);                  
	end if;
end process;
Attract_n <= (not Attract);


-- 9321 dual decoder at M10 creates collision reset, watchdog reset, explosion sound and input DA latch signals
--M10: process(N10_out, Adr)
--begin
--	if N10_out(5) = '1' then
--		M10_out_A <= "1111";
--	else
--		case Adr(2 downto 1) is
--			when "00" => M10_out_A <= "1110";
--			when "01" => M10_out_A <= "1101";
--			when "10" => M10_out_A <= "1011";
--			when "11" => M10_out_A <= "0111";
--			when others => M10_out_A <= "1111";
--		end case;
--	end if;
--	if N10_out(6) = '1' then
--		M10_out_B <= "1111";
--	else
--		case Adr(2 downto 1) is
--			when "00" => M10_out_B <= "1110";
--			when "01" => M10_out_B <= "1101";
--			when "10" => M10_out_B <= "1011";
--			when "11" => M10_out_B <= "0111";
--			when others => M10_out_B <= "1111";
--		end case;
--	end if;			
--end process;
--CollReset_n <= M10_out_A;
--Timer_Reset_n <= M10_out_B(2);
--Wr_CrashWord_n <= M10_out_B(1);
--Wr_DA_Latch_n <= M10_out_B(0);


-- 9321 dual decoder at M10 creates collision reset, watchdog reset, explosion sound and input DA latch signals
M10: process(Clk6, Reset_n)
begin
--	if (Reset_n = '1') then	
		if rising_edge(clk6) then
			if (RW_n = '0' and ADR(13 downto 11) = "100" and ADR(7 downto 5) = "001") then
			 	case Adr(2 downto 1) is
					when "00" => CollReset_n <= "1110"; 
					when "01" => CollReset_n <= "1101";
					when "10" => CollReset_n <= "1011";
					when "11" => CollReset_n <= "0111";
					when others => CollReset_n <= "1111";
				end case;
			else
				CollReset_n <= "1111";
			end if;
			if (Write_n = '0' and ADR(13 downto 11) = "100" and ADR(7 downto 5) = "010") then
			 	case Adr(2 downto 1) is
					when "00" => Wr_DA_Latch_n <= '0'; 
					when "01" => Wr_CrashWord_n <= '0';
					when "10" => Timer_Reset_n <= '0';
					when others => null;
				end case;
			else
				Timer_Reset_n <= '1';
				Wr_CrashWord_n <= '1';
				Wr_DA_Latch_n <= '1';
			end if;
		end if;
--	end if;
end process;

-- E11 9334 addressable latch drives skid sound triggers and player start button LEDs
--E11: process(clk6, N10_out, Adr)
--begin
--if rising_edge(clk6) then
--	if (N10_out(7) = '0') then
--	  case Adr(3 downto 1) is
--		 when "000" => Skid(4) <= Adr(0);
--		 when "001" => Skid(3) <= Adr(0);
--		 when "010" => Skid(2) <= Adr(0);
--		 when "011" => Skid(1) <= Adr(0);
--		 when "100" => StartLamp(4) <= Adr(0);
--		 when "101" => StartLamp(3) <= Adr(0);
--		 when "110" => StartLamp(2) <= Adr(0);
--		 when "111" => StartLamp(1) <= Adr(0);
--		 when others => null;
--	  end case;
--	end if;
-- end if;
--end process;	


-- E11 9334 addressable latch drives skid sound triggers and player start button LEDs
E11: process(clk6, Reset_n)
begin
	if (Reset_n = '0') then
		Skid <= "0000";
		StartLamp <= "0000";
	elsif rising_edge(clk6) then
		-- Lazy way of implementing the address decoder is just look at the memory map 
		if (Write_n = '0' and ADR(13 downto 11) = "100" and ADR(7 downto 5) = "011") then 
			case A(3 downto 1) is
				when "000" => Skid(4) <= Adr(0);
				when "001" => Skid(3) <= Adr(0);
				when "010" => Skid(2) <= Adr(0);
				when "011" => Skid(1) <= Adr(0);
				when "100" => StartLamp(4) <= Adr(0);
				when "101" => StartLamp(3) <= Adr(0);
				when "110" => StartLamp(2) <= Adr(0);
				when "111" => StartLamp(1) <= Adr(0);
				when others => null;
			end case;
		end if;
 end if;
end process;	


-- CPU Din mux, no tristate logic in modern FPGAs so this mux is used to select the source to the CPU data-in bus
cpuDin <=  	
				PRAM when (RAM_n = '0') and (Display_n = '0') else 				-- Video RAM
				ROM_dout when ROMCE_n = '0' else 										-- Program ROM
				VBlank_n_s & Test_n & "111111" when Vblank_Read_n = '0' else 	-- VBlank and Self Test switch
				DB_in when Inputs_n = '0' else 											-- Inputs
				x"FF";
end rtl;



