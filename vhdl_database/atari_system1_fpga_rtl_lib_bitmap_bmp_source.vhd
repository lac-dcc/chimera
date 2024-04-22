-------------------------------------------------------------------------------
-- File       : bmp_source.vhd
-- Author     : mr-kenhoff
-------------------------------------------------------------------------------
-- Description:
--      Outputs a bitmap image as a data stream
-- Target: Simulator
-- Dependencies: bmp_pkg.vhd
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.bmp_pkg.all;

entity bmp_source is
	generic (
		FILENAME : string;
		ITERATIONS : natural;
		BACKPRESSURE_EN : boolean := false
	);
	port (
		clk_i       : in    std_logic;
		rst_i       : in    std_logic;

		val_o       : out   std_logic := '0';
		dat_o       : out   std_logic_vector(23 downto 0) := (others => '0');
		rdy_i       : in    std_logic;
		eol_o       : out   std_logic := '0';
		eof_o       : out   std_logic := '0'
	);
end entity;

architecture behavioural of bmp_source is

begin



	source_process : process( clk_i )
		variable source_bmp : bmp_ptr;
		variable source_pix : bmp_pix;
		variable is_bmp_loaded : boolean := false;

		variable iteration : natural := 0;
		variable x : natural := 0;
		variable y : natural := 0;
	begin

		if is_bmp_loaded = false then
			source_bmp := new bmp;
			bmp_open(source_bmp, FILENAME);
			is_bmp_loaded := true;
		end if;

		if rising_edge( clk_i ) then

			eol_o <= '0';
			eof_o <= '0';
			val_o <= '0';

			if rst_i = '1' then
				iteration := 0;
				x := 0;
				y := 0;
			else



				if (BACKPRESSURE_EN and rdy_i = '1') or not BACKPRESSURE_EN then

					if iteration < ITERATIONS then

						bmp_get_pix( source_bmp, x, y, source_pix );
						dat_o(23 downto 16) <= source_pix.r;
						dat_o(15 downto 8) <= source_pix.g;
						dat_o(7 downto 0) <= source_pix.b;

						val_o <= '1';



						if x = source_bmp.meta.width-1 then -- EOL
							eol_o <= '1';
							x := 0;
							if y = source_bmp.meta.height-1 then -- EOF
								eof_o <= '1';
								y := 0;
								iteration := iteration + 1;
							else -- Not EOF
								y := y + 1;
							end if;
						else -- Not EOL
							x := x + 1;
						end if;

					end if; -- if iteration < ITERATIONS

				end if;



			end if;
		end if;

	end process;


end architecture;
