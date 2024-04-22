library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- -----------------------------------------------------------------------

entity video_dither_tb is
end entity;

-- -----------------------------------------------------------------------

architecture tb of video_dither_tb is
	signal clk : std_logic := '0';
	signal stop : std_logic := '0';

	type test_t is record
			dither : unsigned(5 downto 0);
			d : unsigned(7 downto 0);
		end record;
	signal test_reg : test_t := (
		(others => '0'),
		(others => '0'));
	signal q : unsigned(1 downto 0);

	procedure wait_clk is
	begin
		if clk = '1' then
			wait until clk = '0';
		end if;
		wait until clk = '1';
	end procedure;
begin
	clk <= (not stop) and (not clk) after 5 ns;

	dither_inst : entity work.video_dither
		generic map (
			dBits => 8,
			qBits => 2,
			ditherBits => 6
		)
		port map (
			clk => clk,
			dither => test_reg.dither,
			d => test_reg.d,
			q => q
		);

	process
	begin
		wait_clk;
		pixel_loop : for pixel in 0 to 255 loop
			dither_loop : for dither in 0 to 63 loop
				test_reg.d <= to_unsigned(pixel, 8);
				test_reg.dither <= to_unsigned(dither, 6);
				wait_clk;
			end loop;
		end loop;
		wait_clk;
		stop <= '1';
		wait;
	end process;
end architecture;
