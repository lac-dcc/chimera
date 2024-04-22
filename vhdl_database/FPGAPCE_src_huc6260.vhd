library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_TEXTIO.all;
library STD;
use STD.TEXTIO.ALL;

entity huc6260 is
	port (
		CLK 		: in std_logic;
		RESET_N		: in std_logic;

		-- CPU Interface
		A			: in std_logic_vector(2 downto 0);
		CE_N		: in std_logic;
		WR_N		: in std_logic;
		RD_N		: in std_logic;		
		DI			: in std_logic_vector(7 downto 0);
		DO 			: out std_logic_vector(7 downto 0);
		
		-- VDC Interface
		COLNO		: in std_logic_vector(8 downto 0);
		CLKEN		: out std_logic;
		
		-- NTSC/RGB Video Output
		R			: out std_logic_vector(2 downto 0);
		G			: out std_logic_vector(2 downto 0);
		B			: out std_logic_vector(2 downto 0);		
		VS_N		: out std_logic;
		HS_N		: out std_logic;
		
		-- VGA Video Output (Scandoubler)
		VGA_R		: out std_logic_vector(3 downto 0);
		VGA_G		: out std_logic_vector(3 downto 0);
		VGA_B		: out std_logic_vector(3 downto 0);
		VGA_VS_N	: out std_logic;
		VGA_HS_N	: out std_logic
	);
end huc6260;

architecture rtl of huc6260 is

-- CPU Interface
signal PREV_A	: std_logic_vector(2 downto 0);

type ctrl_t is ( CTRL_IDLE, CTRL_WAIT, CTRL_INCR );
signal CTRL		: ctrl_t;
signal DO_FF	: std_logic_vector(7 downto 0);
signal CR		: std_logic_vector(7 downto 0);

-- VCE Registers
signal BW		: std_logic;
signal DOTCLOCK	: std_logic_vector(1 downto 0);

-- CPU Color RAM Interface
signal RAM_A	: std_logic_vector(8 downto 0);
signal RAM_DI	: std_logic_vector(8 downto 0);
signal RAM_WE	: std_logic := '0';
signal RAM_DO	: std_logic_vector(8 downto 0);

-- Color RAM Output
signal COLOR	: std_logic_vector(8 downto 0);
-- Color RAM Output - after blanking
signal COLOR_BL	: std_logic_vector(8 downto 0);
signal BL_N		: std_logic;

-- NTSC/RGB Video Output
signal R_FF			: std_logic_vector(2 downto 0);
signal G_FF			: std_logic_vector(2 downto 0);
signal B_FF			: std_logic_vector(2 downto 0);
signal VS_N_FF		: std_logic;
signal HS_N_FF		: std_logic;

-- VGA Video Output (Scandoubler)
signal VGA_R_FF		: std_logic_vector(3 downto 0);
signal VGA_G_FF		: std_logic_vector(3 downto 0);
signal VGA_B_FF		: std_logic_vector(3 downto 0);
signal VGA_VS_N_FF	: std_logic;
signal VGA_HS_N_FF	: std_logic;

-- Video Counting
constant VGA_LINE_CLOCKS	: integer := 1364;
constant VGA_HS_CLOCKS		: integer := 162-40;	-- (3.77us * 21.477MHz * 2) http://www.epanorama.net/documents/pc/vga_timing.html
constant VGA_LEFT_BL_CLOCKS	: integer := 243-60;	-- ((3.77+1.89)us * 21.477MHz * 2) http://www.epanorama.net/documents/pc/vga_timing.html
constant VGA_DISP_CLOCKS	: integer := 1081;	-- (25.17us * 21.477MHz * 2) http://www.epanorama.net/documents/pc/vga_timing.html

constant HS_CLOCKS			: integer := 202;	-- (4.7us * 21.477MHz * 2) http://www.epanorama.net/documents/video/video_timing.html

constant VGA_VS_LINES		: integer := 2;		-- http://www.epanorama.net/documents/pc/vga_timing.html

constant VS_LINES			: integer := 3*2; 	-- pcetech.txt
constant TOP_BL_LINES		: integer := 14*2;	-- pcetech.txt
constant DISP_LINES			: integer := 242*2;	-- pcetech.txt
constant TOTAL_LINES		: integer := 526; -- 525

signal H_CNT		: std_logic_vector(10 downto 0);
signal VGA_H_CNT	: std_logic_vector(10 downto 0);
signal VGA_V_CNT	: std_logic_vector(9 downto 0);

-- Clock generation
signal CLKEN_FF		: std_logic;
signal CLKEN_CNT	: std_logic_vector(2 downto 0);

-- Scandoubler
signal SL0_WE		: std_logic;
signal SL1_WE		: std_logic;
signal SL0_DO		: std_logic_vector(8 downto 0);
signal SL1_DO		: std_logic_vector(8 downto 0);

begin

-- Color RAM
ram : entity work.colram port map(
	clock		=> CLK,
	
	address_a	=> RAM_A,
	data_a		=> RAM_DI,
	wren_a		=> RAM_WE,
	q_a			=> RAM_DO,
	
	address_b	=> COLNO,
	data_b		=> "000000000",
	wren_b		=> '0',
	q_b			=> COLOR
);
-- COLOR <= H_CNT(6 downto 4) & VGA_V_CNT(6 downto 4) & H_CNT(8 downto 6);

-- Scandoubler RAMs
sl0 : entity work.scanline port map(
	clock		=> CLK,
	data		=> COLOR_BL,
	wraddress	=> H_CNT,
	rdaddress	=> VGA_H_CNT,
	wren		=> SL0_WE,
	q			=> SL0_DO
);
sl1 : entity work.scanline port map(
	clock		=> CLK,
	data		=> COLOR_BL,
	wraddress	=> H_CNT,
	rdaddress	=> VGA_H_CNT,
	wren		=> SL1_WE,
	q			=> SL1_DO
);

process( CLK )
begin
	if rising_edge( CLK ) then
		if RESET_N = '0' then
			RAM_A <= (others => '0');
			RAM_DI <= (others => '0');
			RAM_WE <= '0';
			CR <= x"00";
			
			PREV_A <= (others => '0');
			CTRL <= CTRL_IDLE;
		else
			case CTRL is
			
			when CTRL_IDLE =>
				RAM_WE <= '0';
				if CE_N = '0' and WR_N = '0' then
					-- CPU Write
					PREV_A <= A;
					CTRL <= CTRL_WAIT;
					case A is
					when "000" =>
						CR <= DI;
					when "010" =>
						RAM_A(7 downto 0) <= DI;
					when "011" =>
						RAM_A(8) <= DI(0);
					when "100" =>
						RAM_WE <= '1';
						RAM_DI <= RAM_DO(8) & DI;
					when "101" =>
						RAM_WE <= '1';
						RAM_DI <= DI(0) & RAM_DO(7 downto 0);
						CTRL <= CTRL_INCR;
					when others => null;
					end case;
					
				elsif CE_N = '0' and RD_N = '0' then
					-- CPU Read
					PREV_A <= A;
					CTRL <= CTRL_WAIT;
					DO_FF <= x"FF";
					case A is
					when "100" =>
						DO_FF <= RAM_DO(7 downto 0);
					when "101" =>
						DO_FF <= "1111111" & RAM_DO(8);
						CTRL <= CTRL_INCR;
					when others => null;
					end case;
				end if;
			
			when CTRL_INCR =>
				RAM_WE <= '0';
				RAM_A <= RAM_A + 1;
				CTRL <= CTRL_WAIT;
			
			when CTRL_WAIT =>
				RAM_WE <= '0';
				-- Wait for the CPU to "release" the VCE.
				-- I don't know what happens in the case of an address change
				-- however it can be achieved only with addresses read/write cycles,
				-- so it seems unlikely. The case has been handled, though.
				-- HuC6280 Rmw instructions are safe, as there is a "dummy cycle"
				-- between the read cycle and the write cycle.
				CTRL <= CTRL_IDLE;
				if CE_N = '0' and (WR_N = '0' or RD_N = '0') and PREV_A = A then
					CTRL <= CTRL_WAIT;
				end if;
			
			when others => null;
			end case;
		end if;
	end if;
end process;

-- Video counting, register loading and clock generation
process( CLK )
begin
	if rising_edge( CLK ) then
		if RESET_N = '0' then
			H_CNT <= (others => '0');
			VGA_H_CNT <= (others => '0');
			VGA_V_CNT <= (others => '0');
			
			BW <= '0';
			-- DOTCLOCK <= "11";
			DOTCLOCK <= "00";
			
			CLKEN_FF <= '0';
			CLKEN_CNT <= (others => '0');
		else
			VGA_H_CNT <= VGA_H_CNT + 1;
			
			CLKEN_FF <= '0';
			CLKEN_CNT <= CLKEN_CNT + 1;
			if DOTCLOCK = "00" and CLKEN_CNT = "111" then
				CLKEN_CNT <= (others => '0');
				CLKEN_FF <= '1';
			elsif DOTCLOCK = "01" and CLKEN_CNT = "101" then
				CLKEN_CNT <= (others => '0');
				CLKEN_FF <= '1';				
			elsif (DOTCLOCK = "10" or DOTCLOCK = "11") and CLKEN_CNT = "011" then
				CLKEN_CNT <= (others => '0');
				CLKEN_FF <= '1';				
			end if;
			
			if VGA_H_CNT = VGA_LINE_CLOCKS-1 then
				VGA_H_CNT <= (others => '0');
				VGA_V_CNT <= VGA_V_CNT + 1;
				if VGA_V_CNT = TOTAL_LINES-1 then
					VGA_V_CNT <= (others => '0');
					-- Reload registers
					BW <= CR(7);
					DOTCLOCK <= CR(1 downto 0);
				end if;
			end if;
			if VGA_H_CNT(0) = '1' then
				H_CNT <= H_CNT + 1;
				if H_CNT = VGA_LINE_CLOCKS-1 then
					H_CNT <= (others => '0');
					CLKEN_CNT <= (others => '0');
				end if;				
			end if;
		end if;
	end if;
end process;

-- Horizontal Sync
process( CLK )
begin
	if rising_edge( CLK ) then
		if RESET_N = '0' then
			HS_N_FF <= '0';
			VGA_HS_N_FF <= '0';
		else
			if H_CNT = 0 then
				HS_N_FF <= '0';
			end if;
			if H_CNT = HS_CLOCKS-1 then
				HS_N_FF <= '1';
			end if;
			if VGA_H_CNT = 0 then
				VGA_HS_N_FF <= '0';
			end if;
			if VGA_H_CNT = VGA_HS_CLOCKS-1 then
				VGA_HS_N_FF <= '1';
			end if;		
		end if;
	end if;
end process;

-- Vertical Sync
process( CLK )
begin
	if rising_edge( CLK ) then
		if RESET_N = '0' then
			VS_N_FF <= '0';
			VGA_VS_N_FF <= '0';
		else
			if VGA_V_CNT = 0 then
				VS_N_FF <= '0';
			end if;
			if VGA_V_CNT = VS_LINES-1 then
				VS_N_FF <= '1';
			end if;
			if VGA_V_CNT = 0 then
				VGA_VS_N_FF <= '0';
			end if;
			if VGA_V_CNT = VGA_VS_LINES-1 then
				VGA_VS_N_FF <= '1';
			end if;
		end if;
	end if;
end process;

-- Blanking
-- It is performed "at the source" by clearing the input of the scanline RAMs
-- Based on VGA blanking periods
process( CLK )
begin
	if rising_edge( CLK ) then
		if RESET_N = '0' then
			COLOR_BL <= (others => '0');
			BL_N <= '0';
		else
			if H_CNT >= VGA_LEFT_BL_CLOCKS 
			and H_CNT < VGA_LEFT_BL_CLOCKS + VGA_DISP_CLOCKS 
			and VGA_V_CNT >= VS_LINES + TOP_BL_LINES
			and VGA_V_CNT < VS_LINES + TOP_BL_LINES + DISP_LINES
			then
				COLOR_BL <= COLOR;
				BL_N <= '1';
			else
				COLOR_BL <= (others => '0');
				BL_N <= '0';
			end if;
		end if;
	end if;
end process;
G_FF <= COLOR_BL(8 downto 6);
R_FF <= COLOR_BL(5 downto 3);
B_FF <= COLOR_BL(2 downto 0);

-- 15 KHz writes
process( CLK )
begin
	if rising_edge( CLK ) then
		if RESET_N = '0' then
			SL0_WE <= '0';
			SL1_WE <= '0';
		else
			SL0_WE <= '0';
			SL1_WE <= '0';
			if VGA_H_CNT(0) = '1' then
				if VGA_V_CNT(1) = '0' then
					SL0_WE <= '1';
				else
					SL1_WE <= '1';
				end if;
			end if;
		end if;
	end if;
end process;

-- 31 KHz reads
VGA_G_FF <= SL0_DO(8 downto 6) & SL0_DO(8) when VGA_V_CNT(1) = '1'
	else SL1_DO(8 downto 6) & SL1_DO(8);
VGA_R_FF <= SL0_DO(5 downto 3) & SL0_DO(5) when VGA_V_CNT(1) = '1'
	else SL1_DO(5 downto 3) & SL1_DO(5);
VGA_B_FF <= SL0_DO(2 downto 0) & SL0_DO(2) when VGA_V_CNT(1) = '1'
	else SL1_DO(2 downto 0) & SL1_DO(2);

-- Outputs
DO <= DO_FF;

R <= R_FF;
G <= G_FF;
B <= B_FF;
VS_N <= VS_N_FF;
HS_N <= HS_N_FF;

VGA_R <= VGA_R_FF;
VGA_G <= VGA_G_FF;
VGA_B <= VGA_B_FF;
VGA_VS_N <= VGA_VS_N_FF;
VGA_HS_N <= VGA_HS_N_FF;

CLKEN <= CLKEN_FF;

----------------------------------------------------------------
-- Video debug
----------------------------------------------------------------
-- synthesis translate_off
process( CLKEN_FF )
	file F		: text open write_mode is "video.txt";
	variable L	: line;
	variable R	: std_logic_vector(2 downto 0);
	variable G	: std_logic_vector(2 downto 0);
	variable B	: std_logic_vector(2 downto 0);
begin
	if rising_edge( CLKEN_FF ) then
		if VS_N_FF = '0' then
			write(L, string'("#VS"));
		elsif HS_N_FF = '0' then
			write(L, string'("#HS"));
		else
			hwrite(L, R_FF & '0' & G_FF & '0' & B_FF & '0');
		end if;
		writeline(F,L);
	end if;
end process;
-- synthesis translate_on

end rtl;
