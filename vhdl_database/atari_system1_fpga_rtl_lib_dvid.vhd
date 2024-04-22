--------------------------------------------------------------------------------
-- Engineer:      Mike Field <hamster@snap.net.nz>
-- Description:   Converts VGA signals into DVID bitstreams.
--
--                'clk_p' and 'clk_n' should be 5x clk_pixel.
--
--                'blank' should be asserted during the non-display
--                portions of the frame
--------------------------------------------------------------------------------
library ieee;
	use ieee.std_logic_1164.all;
library unisim;
	use unisim.vcomponents.all;

entity dvid is
port (
	clk_p     : in  STD_LOGIC;
	clk_n     : in  STD_LOGIC;
	clk_pixel : in  STD_LOGIC;
	red_p     : in  STD_LOGIC_VECTOR (7 downto 0);
	grn_p     : in  STD_LOGIC_VECTOR (7 downto 0);
	blu_p     : in  STD_LOGIC_VECTOR (7 downto 0);
	blank     : in  STD_LOGIC;
	hsync     : in  STD_LOGIC;
	vsync     : in  STD_LOGIC;
	tmds_p    : out STD_LOGIC_VECTOR (3 downto 0);
	tmds_n    : out STD_LOGIC_VECTOR (3 downto 0)
);
end dvid;

architecture RTL of dvid is
	signal encoded_red, encoded_grn, encoded_blu : std_logic_vector(9 downto 0) := (others => '0');
	signal latched_red, latched_grn, latched_blu : std_logic_vector(9 downto 0) := (others => '0');
	signal shift_red,   shift_grn,   shift_blu   : std_logic_vector(9 downto 0) := (others => '0');

	signal shift_clk     : std_logic_vector(9 downto 0) := "0000011111";

	constant c_red       : std_logic_vector(1 downto 0) := (others => '0');
	constant c_grn       : std_logic_vector(1 downto 0) := (others => '0');
	signal   c_blu       : std_logic_vector(1 downto 0) := (others => '0');
	signal
		clk_s,
		red_s,
		grn_s,
		blu_s
								: std_logic := '1';
begin
	c_blu <= vsync & hsync;

	OBUFDS_clk : OBUFDS port map ( O => tmds_p(3), OB => tmds_n(3), I => clk_s );
	OBUFDS_grn : OBUFDS port map ( O => tmds_p(2), OB => tmds_n(2), I => red_s );
	OBUFDS_red : OBUFDS port map ( O => tmds_p(1), OB => tmds_n(1), I => grn_s );
	OBUFDS_blu : OBUFDS port map ( O => tmds_p(0), OB => tmds_n(0), I => blu_s );

	TMDS_encoder_red: entity work.TMDS_encoder PORT MAP(clk => clk_pixel, data => red_p, c => c_red, blank => blank, encoded => encoded_red);
	TMDS_encoder_grn: entity work.TMDS_encoder PORT MAP(clk => clk_pixel, data => grn_p, c => c_grn, blank => blank, encoded => encoded_grn);
	TMDS_encoder_blu: entity work.TMDS_encoder PORT MAP(clk => clk_pixel, data => blu_p, c => c_blu, blank => blank, encoded => encoded_blu);

	ODDR2_red : ODDR2 generic map( DDR_ALIGNMENT => "C0", INIT => '0', SRTYPE => "ASYNC")
		port map (Q => red_s, D0 => shift_red(0), D1 => shift_red(1), C0 => clk_p, C1 => clk_n, CE => '1', R => '0', S => '0');

	ODDR2_grn : ODDR2 generic map( DDR_ALIGNMENT => "C0", INIT => '0', SRTYPE => "ASYNC")
		port map (Q => grn_s, D0 => shift_grn(0), D1 => shift_grn(1), C0 => clk_p, C1 => clk_n, CE => '1', R => '0', S => '0');

	ODDR2_blu : ODDR2 generic map( DDR_ALIGNMENT => "C0", INIT => '0', SRTYPE => "ASYNC")
		port map (Q => blu_s, D0 => shift_blu(0), D1 => shift_blu(1), C0 => clk_p, C1 => clk_n, CE => '1', R => '0', S => '0');

	ODDR2_clk : ODDR2 generic map( DDR_ALIGNMENT => "C0", INIT => '0', SRTYPE => "ASYNC")
		port map (Q => clk_s, D0 => shift_clk(0), D1 => shift_clk(1), C0 => clk_p, C1 => clk_n, CE => '1', R => '0', S => '0');

	process
	begin
		wait until rising_edge(clk_pixel);
		latched_red <= encoded_red;
		latched_grn <= encoded_grn;
		latched_blu <= encoded_blu;
	end process;

	process
	begin
		wait until rising_edge(clk_p);
		if shift_clk = "0000011111" then
			shift_red <= latched_red;
			shift_grn <= latched_grn;
			shift_blu <= latched_blu;
		else
			shift_red <= "00" & shift_red(9 downto 2);
			shift_grn <= "00" & shift_grn(9 downto 2);
			shift_blu <= "00" & shift_blu(9 downto 2);
		end if;
		shift_clk <= shift_clk(1 downto 0) & shift_clk(9 downto 2);
	end process;

end RTL;
