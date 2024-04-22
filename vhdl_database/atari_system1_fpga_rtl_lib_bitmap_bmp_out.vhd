------------------------------------------------------------------
-- File       : bmp_out.vhd
------------------------------------------------------------------
-- Description: Takes a data stream and saves it to a bitmap image
-- Target: Simulator
-- Dependencies: bmp_pkg.vhd
------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

use work.bmp_pkg.all;

entity bmp_out is
	generic (
		FILENAME    : string
	);
	port (
		clk_i       : in    std_logic;
		dat_i       : in    std_logic_vector(23 downto 0);
		vs_i        : in    std_logic;
		hs_i        : in    std_logic
	);
end entity;

architecture behavioural of bmp_out is
	signal x, y      : natural := 0;
	signal iteration : integer := 10000;
	signal eol, eof, hs_last, vs_last  : std_logic;
begin
	sink_process : process( clk_i )
		variable sink_bmp : bmp_ptr;
		variable sink_pix : bmp_pix;
		variable bmp_created : boolean := false;
		variable s        : line;
	begin
		if bmp_created = false then
			sink_bmp := new bmp;
			bmp_created := true;
			-- initialize buffer
			line : for y in 0 to BMP_MAX_HEIGHT-1 loop
				pix : for x in 0 to BMP_MAX_WIDTH-1 loop
					sink_bmp.data(y)(x) := ((others=>'0'), (others=>'0'), (others=>'0'));
				end loop;
			end loop;
		end if;

		if rising_edge( clk_i ) then
			hs_last <= hs_i;
			vs_last <= vs_i;

			sink_pix.r := dat_i(23 downto 16);
			sink_pix.g := dat_i(15 downto 8);
			sink_pix.b := dat_i(7 downto 0);
			bmp_set_pix( sink_bmp, x, y, sink_pix );

			if (hs_last = '0') and (hs_i = '1') then
				x <= 0;
				y <= y + 1;
			else
				x <= x + 1;
			end if;

			if (vs_last = '0') and (vs_i = '1') then
				y <= 0;
				write(s,string'(FILENAME)); write(s,iteration); write(s,string'(".bmp"));
				bmp_save( sink_bmp, s.all );
				-- bmp_save( sink_bmp, FILENAME & "_" & INTEGER'IMAGE(iteration) & ".bmp" );
				writeline(output, s);
				iteration <= iteration + 1;
			end if;
		end if;
	end process;
end architecture;
