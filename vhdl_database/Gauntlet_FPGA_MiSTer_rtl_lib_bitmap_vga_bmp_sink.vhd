-------------------------------------------------------------------------------
-- File       : vga_bmp_sink.vhd
-- Author     : mr-kenhoff
-------------------------------------------------------------------------------
-- Description:
--     Saves a conventional VGA-Standard input into a .bmp File
--
-- Target: Simulator
-- Dependencies: bmp_pkg.vhd
-------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.bmp_pkg.all;

entity vga_bmp_sink is
	generic (
		FILENAME        : string
	);
	port (
		clk_i           : in    std_logic;

		dat_i           : in    std_logic_vector(23 downto 0);
		active_vid_i    : in    std_logic;
		h_sync_i        : in    std_logic;
		v_sync_i        : in    std_logic

	);
end vga_bmp_sink;

architecture Behavioral of vga_bmp_sink is

	signal h_sync_dly   : std_logic := '0';
	signal v_sync_dly   : std_logic := '0';

	signal eol  : std_logic := '0';
	signal eof  : std_logic := '0';

	signal x    : natural := 0;
	signal y    : natural := 0;

	signal is_active_line   : std_logic := '0';
	signal is_active_frame  : std_logic := '0';

begin

	h_sync_dly <= h_sync_i when rising_edge(clk_i);
	v_sync_dly <= v_sync_i when rising_edge(clk_i);

	eol_eof_gen_process : process(clk_i)
	begin
		if rising_edge(clk_i) then
			-- EOL
			if h_sync_dly = '0' and h_sync_i = '1' then
				eol <= '1';
			else
				eol <= '0';
			end if;

			-- EOF
			if v_sync_dly = '0' and v_sync_i = '1' then
				eof <= '1';
			else
				eof <= '0';
			end if;
		end if;
	end process;

	sink_process : process( clk_i )
		variable sink_bmp : bmp_ptr;
		variable sink_pix : bmp_pix;
		variable is_bmp_created : boolean := false;
		variable is_bmp_saved : boolean := false;
	begin

		-- Create bitmap on startup
		if is_bmp_created = false then
			sink_bmp := new bmp;
			is_bmp_created := true;
		end if;

		if rising_edge( clk_i ) then

			if active_vid_i = '1' then
				sink_pix.r := dat_i(23 downto 16);
				sink_pix.g := dat_i(15 downto 8);
				sink_pix.b := dat_i(7 downto 0);

				bmp_set_pix( sink_bmp, x, y, sink_pix );

				x <= x + 1;
				is_active_line <= '1';
				is_active_frame <= '1';
			else
				if eol = '1' then
					x <= 0;
					if is_active_line = '1' then
						y <= y + 1;
					end if;
					is_active_line <= '0';
				end if;

				if eof = '1' then
					y <= 0;
					if is_active_frame = '1' then
						bmp_save( sink_bmp, FILENAME );
					end if;
					is_active_frame <= '0';
				end if;
			end if;
		end if;
	end process;

end Behavioral;
