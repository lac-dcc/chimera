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
		RESET_N	: in std_logic;

		-- CPU Interface
		A			: in std_logic_vector(2 downto 0);
		CE_N		: in std_logic;
		WR_N		: in std_logic;
		RD_N		: in std_logic;
		DI			: in std_logic_vector(7 downto 0);
		DO 		: out std_logic_vector(7 downto 0);

		-- VDC Interface
		COLNO		: in std_logic_vector(8 downto 0);
		CLKEN		: out std_logic;
		CLKEN_FS	: out std_logic;
		RVBL		: in std_logic;
		DCC		: out std_logic_vector(1 downto 0);
		
		GRID_EN	: in std_logic_vector(1 downto 0);
		BORDER_EN: in std_logic;
		BORDER	: in std_logic;
		GRID		: in std_logic_vector(1 downto 0);

		-- NTSC/RGB Video Output
		R			: out std_logic_vector(2 downto 0);
		G			: out std_logic_vector(2 downto 0);
		B			: out std_logic_vector(2 downto 0);
		BW			: out std_logic;

		VS_N		: out std_logic;
		HS_N		: out std_logic;
		HBL		: out std_logic;
		VBL		: out std_logic;
		
		HS_F		: out std_logic;
		HS_R		: out std_logic;
		VS_F		: out std_logic;
		VS_R		: out std_logic
	);
end huc6260;

architecture rtl of huc6260 is

-- CPU Interface
signal PREV_A	: std_logic_vector(2 downto 0);

type ctrl_t is ( CTRL_IDLE, CTRL_WAIT, CTRL_INCR );
signal CTRL		: ctrl_t;
signal CR		: std_logic_vector(7 downto 0);

-- VCE Registers
signal DOTCLOCK	: std_logic_vector(1 downto 0);

-- CPU Color RAM Interface
signal RAM_A	: std_logic_vector(8 downto 0);
signal RAM_DI	: std_logic_vector(8 downto 0);
signal RAM_WE	: std_logic := '0';
signal RAM_DO	: std_logic_vector(8 downto 0);

-- CPU conflict color latching
signal R_FF	: std_logic_vector(2 downto 0);
signal G_FF	: std_logic_vector(2 downto 0);
signal B_FF	: std_logic_vector(2 downto 0);
signal CE_N_FF : std_logic := '1';

-- Color RAM Output
signal COLOR	: std_logic_vector(8 downto 0);

constant LEFT_BL_CLOCKS	: integer := 456;
constant DISP_CLOCKS	   : integer := 2160;
constant LINE_CLOCKS	   : integer := 2730;
constant HS_CLOCKS		: integer := 192;
constant HS_OFF			: integer := 46;

constant TOTAL_LINES		: integer := 263;  -- 525
constant VS_LINES			: integer := 3; 	 -- pcetech.txt
constant TOP_BL_LINES_E	: integer := 19;   -- pcetech.txt (must include VS_LINES in current implementation)
constant DISP_LINES_E	: integer := 242;	 -- same as in mednafen
signal TOP_BL_LINES		: integer;
signal DISP_LINES			: integer;
signal END_LINE			: integer := TOTAL_LINES;

signal H_CNT	: std_logic_vector(11 downto 0);
signal V_CNT	: std_logic_vector(9 downto 0);

signal HBL_FF, HBL_FF2	: std_logic;
signal VBL_FF, VBL_FF2	: std_logic;

-- Clock generation
signal CLKEN_CNT	: std_logic_vector(2 downto 0);
signal CLKEN_FS_CNT: std_logic_vector(2 downto 0);
signal CLKEN_FF	: std_logic;
signal MULTIRES_FF : std_logic;
signal MULTIRES   : std_logic;

begin

TOP_BL_LINES <= TOP_BL_LINES_E when RVBL = '1' else TOP_BL_LINES_E+4;
DISP_LINES   <= DISP_LINES_E   when RVBL = '1' else DISP_LINES_E-11;

-- Color RAM
ram : entity work.dpram generic map (addr_width => 9, data_width => 9, mem_init_file =>"huc6260_palette_init.mif")
port map(
	clock			=> CLK,

	address_a	=> RAM_A,
	data_a		=> RAM_DI,
	wren_a		=> RAM_WE,
	q_a			=> RAM_DO,
	
	address_b	=> COLNO,
	q_b			=> COLOR
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
					DO <= x"FF";
					case A is
					when "100" =>
						DO <= RAM_DO(7 downto 0);
					when "101" =>
						DO <= "1111111" & RAM_DO(8);
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
		H_CNT <= H_CNT + 1;

		CLKEN_FF <= '0';
		CLKEN_CNT <= CLKEN_CNT + 1;
		if DOTCLOCK = "00" and CLKEN_CNT = "111" and H_CNT < LINE_CLOCKS-2-1 then
			CLKEN_CNT <= (others => '0');
			CLKEN_FF <= '1';
		elsif DOTCLOCK = "01" and CLKEN_CNT = "101" then
			CLKEN_CNT <= (others => '0');
			CLKEN_FF <= '1';				
		elsif DOTCLOCK(1) = '1' and CLKEN_CNT = "011" and H_CNT < LINE_CLOCKS-2-1 then
			CLKEN_CNT <= (others => '0');
			CLKEN_FF <= '1';				
		end if;

		if H_CNT = LINE_CLOCKS-1 then
			CLKEN_CNT <= (others => '0');
			CLKEN_FF <= '1';				
			H_CNT <= (others => '0');
			V_CNT <= V_CNT + 1;
			if V_CNT >= END_LINE-1 then
				V_CNT <= (others => '0');
				if CR(2) = '1' then			-- artifact bit affects number of lines per field; check at start of field
				  END_LINE <= TOTAL_LINES;
				else
				  END_LINE <= TOTAL_LINES - 1;
				end if;
			end if;
			-- Reload registers
			BW <= CR(7);
			DOTCLOCK <= CR(1 downto 0);

			if V_CNT >= TOP_BL_LINES and V_CNT < TOP_BL_LINES + DISP_LINES and DOTCLOCK /= CR(1 downto 0) then 
				MULTIRES_FF <= '1';
			end if;
				
			if V_CNT = TOP_BL_LINES + DISP_LINES then
				MULTIRES <= MULTIRES_FF;
				MULTIRES_FF <= '0';
			end if;
		end if;
	end if;
end process;

process( CLK )
begin
	if rising_edge( CLK ) then
		CLKEN_FS <= '0';
		CLKEN_FS_CNT <= CLKEN_FS_CNT + 1;
		if (MULTIRES = '1' or DOTCLOCK(1) = '1') and CLKEN_FS_CNT = "011" and H_CNT < LINE_CLOCKS-2-1 then
			CLKEN_FS_CNT <= (others => '0');
			CLKEN_FS <= '1';				
		elsif DOTCLOCK = "00" and CLKEN_FS_CNT = "111" and H_CNT < LINE_CLOCKS-2-1 then
			CLKEN_FS_CNT <= (others => '0');
			CLKEN_FS <= '1';
		elsif DOTCLOCK = "01" and CLKEN_FS_CNT = "101" then
			CLKEN_FS_CNT <= (others => '0');
			CLKEN_FS <= '1';				
		end if;

		if H_CNT = LINE_CLOCKS-1 then
			 CLKEN_FS_CNT <= (others => '0');
			 CLKEN_FS <= '1';
		end if;
	end if;
end process;

-- Sync
process( CLK )
begin
	if rising_edge( CLK ) then
		if H_CNT = HS_OFF             then HS_N <= '0'; end if;
		if H_CNT = HS_OFF + HS_CLOCKS then HS_N <= '1'; end if;
		if V_CNT = 0                  then VS_N <= '0'; end if;
		if V_CNT = VS_LINES           then VS_N <= '1'; end if;
		
		HS_F <= '0';
		HS_R <= '0';
		VS_F <= '0';
		VS_R <= '0';
		if H_CNT = LINE_CLOCKS-1 then HS_F <= '1'; end if;
		if H_CNT = HS_CLOCKS-1   then HS_R <= '1'; end if;
		if V_CNT = END_LINE-1    and H_CNT = LINE_CLOCKS-1 then VS_F <= '1'; end if;
		if V_CNT = VS_LINES-1    and H_CNT = LINE_CLOCKS-1 then VS_R <= '1'; end if;
	end if;
end process;

-- Blank
process( CLK )
begin
	if rising_edge( CLK ) then
		if H_CNT = LEFT_BL_CLOCKS               then HBL_FF <= '0'; end if;
		if H_CNT = LEFT_BL_CLOCKS + DISP_CLOCKS then HBL_FF <= '1'; end if;
		if V_CNT = TOP_BL_LINES                 then VBL_FF <= '0'; end if;
		if V_CNT = TOP_BL_LINES + DISP_LINES    then VBL_FF <= '1'; end if;
	end if;
end process;

-- Final output
process( CLK )
begin
	if rising_edge( CLK ) then
		if CLKEN_FF = '1' then

			-- compensate HUC6202 delay
			VBL_FF2 <= VBL_FF;
			HBL_FF2 <= HBL_FF;

			VBL <= VBL_FF2;
			HBL <= HBL_FF2;

			if BORDER = '1' and BORDER_EN = '0' then
				G <= (others => '0');
				R <= (others => '0');
				B <= (others => '0');
				G_FF <= (others => '0');
				R_FF <= (others => '0');
				B_FF <= (others => '0');
				CE_N_FF  <= '1';

			elsif (CE_N = '0') then
				G <= G_FF;
				R <= R_FF;
				B <= B_FF;
				CE_N_FF <= '0';
			elsif (CE_N_FF = '0') then
				G <= G_FF;
				R <= R_FF;
				B <= B_FF;
				CE_N_FF <= '1';

			elsif (GRID(0) = '1' and GRID_EN(0) = '1') or (GRID(1) = '1' and GRID_EN(1) = '1') then
				G <= (others => '1');
				R <= (others => '1');
				B <= (others => '1');
			else
				G <= COLOR(8 downto 6);
				R <= COLOR(5 downto 3);
				B <= COLOR(2 downto 0);
				G_FF <= COLOR(8 downto 6);
				R_FF <= COLOR(5 downto 3);
				B_FF <= COLOR(2 downto 0);
			end if;
		end if;
	end if;
end process;

CLKEN <= CLKEN_FF;
DCC <= DOTCLOCK;

end rtl;
