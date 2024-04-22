library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.pck_bcd_2_7segment.all;

entity top is
-- generic (
-- c_clkfreq	: integer := 100_000_000
-- );
port (
clk				: in std_logic;
start_i			: in std_logic;
reset_i			: in std_logic;
seven_seg_o		: out std_logic_vector (7 downto 0);
anodes_o		: out std_logic_vector (7 downto 0)
);
end top;

architecture Behavioral of top is
---------------------------------------------------------------------------------------
-- COMPONENT DECLERATIONS
---------------------------------------------------------------------------------------
-- debounce
-- component debounce is
-- generic (
-- c_clkfreq	: integer := 100_000_000;
-- c_debtime	: integer := 1000;
-- c_initval	: std_logic	:= '0'
-- );
-- port (
-- clk			: in std_logic;
-- signal_i	: in std_logic;
-- signal_o	: out std_logic
-- );
-- end component;

-- bcd_incrementor
-- component bcd_incrementor is
-- generic (
-- c_birlerlim	: integer := 9;
-- c_onlarlim	: integer := 5
-- );
-- port (
-- clk			: in std_logic;
-- increment_i	: in std_logic;
-- reset_i		: in std_logic;
-- birler_o	: out std_logic_vector (3 downto 0);
-- onlar_o		: out std_logic_vector (3 downto 0)
-- );
-- end component;

-- bcd_to_sevenseg
-- component bcd_to_sevenseg is
-- port (
-- bcd_i		: in std_logic_vector (3 downto 0);
-- sevenseg_o	: out std_logic_vector (7 downto 0)
-- );
-- end component;

---------------------------------------------------------------------------------------
-- CONSTANT DEFINITIONS
---------------------------------------------------------------------------------------
-- constant c_timer1mslim			: integer := c_clkfreq/1000;
-- constant c_salise_counter_lim	: integer := c_clkfreq/100;
-- constant c_saniye_counter_lim	: integer := 100;	-- 100 saliseye kadar sayacak ve 1 artacak saniye
-- constant c_dakika_counter_lim	: integer := 60;	-- 60 saniyeye kadar sayacak ve 1 artacak dakika

---------------------------------------------------------------------------------------
-- SIGNAL DEFINITIONS
---------------------------------------------------------------------------------------
signal salise_increment			: std_logic := '0';
signal saniye_increment			: std_logic := '0';
signal dakika_increment			: std_logic := '0';
signal start_deb				: std_logic := '0';
signal reset_deb				: std_logic := '0';
signal continue					: std_logic := '0';
signal start_deb_prev			: std_logic := '0';

signal salise_birler			: std_logic_vector (3 downto 0) := (others => '0');
signal salise_onlar				: std_logic_vector (3 downto 0) := (others => '0');
signal saniye_birler			: std_logic_vector (3 downto 0) := (others => '0');
signal saniye_onlar				: std_logic_vector (3 downto 0) := (others => '0');
signal dakika_birler			: std_logic_vector (3 downto 0) := (others => '0');
signal dakika_onlar				: std_logic_vector (3 downto 0) := (others => '0');
signal salise_birler_7seg		: std_logic_vector (7 downto 0) := (others => '1');
signal salise_onlar_7seg		: std_logic_vector (7 downto 0) := (others => '1');
signal saniye_birler_7seg		: std_logic_vector (7 downto 0) := (others => '1');
signal saniye_onlar_7seg		: std_logic_vector (7 downto 0) := (others => '1');
signal dakika_birler_7seg		: std_logic_vector (7 downto 0) := (others => '1');
signal dakika_onlar_7seg		: std_logic_vector (7 downto 0) := (others => '1');
signal anodes					: std_logic_vector (7 downto 0) := "11111110";

signal timer1ms					: integer range 0 to c_timer1mslim 			:= 0;
signal salise_counter			: integer range 0 to c_salise_counter_lim 	:= 0;
signal saniye_counter			: integer range 0 to c_saniye_counter_lim 	:= 0;
signal dakika_counter			: integer range 0 to c_dakika_counter_lim 	:= 0;

---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------
begin

---------------------------------------------------------------------------------------
-- DEBOUNCE INSTANTIATIONS
---------------------------------------------------------------------------------------
i_start_deb : debounce
generic map(
c_clkfreq	=> c_clkfreq,
c_debtime	=> 1000,
c_initval	=> '0'
)
port map(
clk			=> clk,
signal_i	=> start_i,
signal_o	=> start_deb
);

i_reset_deb : debounce
generic map(
c_clkfreq	=> c_clkfreq,
c_debtime	=> 1000,
c_initval	=> '0'
)
port map(
clk			=> clk,
signal_i	=> reset_i,
signal_o	=> reset_deb
);

---------------------------------------------------------------------------------------
-- BCD INCREMENTOR INSTANTIATIONS
---------------------------------------------------------------------------------------
i_salise_bcd_increment : bcd_incrementor
generic map(
c_birlerlim	=> 9,
c_onlarlim	=> 9
)
port map(
clk			=> clk,
increment_i	=> salise_increment,
reset_i		=> reset_deb,
birler_o	=> salise_birler,
onlar_o		=> salise_onlar
);

i_saniye_bcd_increment : bcd_incrementor
generic map(
c_birlerlim	=> 9,
c_onlarlim	=> 5
)
port map(
clk			=> clk,
increment_i	=> saniye_increment,
reset_i		=> reset_deb,
birler_o	=> saniye_birler,
onlar_o		=> saniye_onlar
);

i_dakika_bcd_increment : bcd_incrementor
generic map(
c_birlerlim	=> 9,
c_onlarlim	=> 5
)
port map(
clk			=> clk,
increment_i	=> dakika_increment,
reset_i		=> reset_deb,
birler_o	=> dakika_birler,
onlar_o		=> dakika_onlar
);

---------------------------------------------------------------------------------------
-- BCD TO SEVENSEGMENT INSTANTIATIONS
---------------------------------------------------------------------------------------
-- i_salise_birler_sevensegment : bcd_to_sevenseg
-- port map(
-- bcd_i		=> salise_birler,
-- sevenseg_o	=> salise_birler_7seg
-- );

salise_birler_7seg	<= bcd_2_7segment(salise_birler);

-- i_salise_onlar_sevensegment : bcd_to_sevenseg
-- port map(
-- bcd_i		=> salise_onlar,
-- sevenseg_o	=> salise_onlar_7seg
-- );

salise_onlar_7seg	<= bcd_2_7segment(salise_onlar);

-- i_saniye_birler_sevensegment : bcd_to_sevenseg
-- port map(
-- bcd_i		=> saniye_birler,
-- sevenseg_o	=> saniye_birler_7seg
-- );

saniye_birler_7seg	<= bcd_2_7segment(saniye_birler);

-- i_saniye_onlar_sevensegment : bcd_to_sevenseg
-- port map(
-- bcd_i		=> saniye_onlar,
-- sevenseg_o	=> saniye_onlar_7seg
-- );

saniye_onlar_7seg	<= bcd_2_7segment(saniye_onlar);

-- i_dakika_birler_sevensegment : bcd_to_sevenseg
-- port map(
-- bcd_i		=> dakika_birler,
-- sevenseg_o	=> dakika_birler_7seg
-- );

dakika_birler_7seg	<= bcd_2_7segment(dakika_birler);

-- i_dakika_onlar_sevensegment : bcd_to_sevenseg
-- port map(
-- bcd_i		=> dakika_onlar,
-- sevenseg_o	=> dakika_onlar_7seg
-- );

dakika_onlar_7seg	<= bcd_2_7segment(dakika_onlar);

---------------------------------------------------------------------------------------
-- MAIN PROCESS
---------------------------------------------------------------------------------------
P_MAIN : process (clk) begin
if (rising_edge(clk)) then

	start_deb_prev	<= start_deb;

	if (start_deb = '1' and start_deb_prev = '0') then
		continue	<= not continue;
	end if;
	
	salise_increment	<= '0';
	saniye_increment	<= '0';
	dakika_increment	<= '0';
	
	if (continue = '1') then
		if (salise_counter = c_salise_counter_lim-1) then
			salise_counter		<= 0;
			salise_increment	<= '1';
			saniye_counter		<= saniye_counter + 1;	-- 1 salise gecti			
		else
			salise_counter		<= salise_counter + 1;
		end if;
		
		if (saniye_counter = c_saniye_counter_lim) then	-- c_saniye_counter_lim 100 salise olur
			saniye_counter 		<= 0;
			saniye_increment	<= '1';
			dakika_counter		<= dakika_counter + 1;
		end if;
		
		if (dakika_counter = c_dakika_counter_lim) then	-- c_dakika_counter_lim 60 salise olur
			dakika_counter 		<= 0;
			dakika_increment	<= '1';			
		end if;		
	end if;
	
	if (reset_deb = '1') then
		salise_counter	<= 0;
		saniye_counter	<= 0;
		dakika_counter	<= 0;
	end if;

end if;
end process;

---------------------------------------------------------------------------------------
-- ANODES PROCESS
---------------------------------------------------------------------------------------
P_ANODES : process (clk) begin
if (rising_edge(clk)) then

	anodes(7 downto 6)	<= "11";

	if (timer1ms = c_timer1mslim-1) then
		timer1ms				<= 0;
		anodes(5 downto 1)		<= anodes(4 downto 0);
		anodes(0)				<= anodes(5);
	else
		timer1ms				<= timer1ms + 1;
	end if;

end if;
end process;

---------------------------------------------------------------------------------------
-- CATHODES PROCESS
---------------------------------------------------------------------------------------
P_CATHODES	: process (clk) begin
if (rising_edge(clk)) then

	if (anodes(0) = '0') then
		seven_seg_o	<= salise_birler_7seg;
	elsif (anodes(1) = '0') then
		seven_seg_o	<= salise_onlar_7seg;
	elsif (anodes(2) = '0') then
		seven_seg_o		<= saniye_birler_7seg;
		seven_seg_o(0) 	<= '0';
	elsif (anodes(3) = '0') then	
		seven_seg_o	<= saniye_onlar_7seg;
	elsif (anodes(4) = '0') then	
		seven_seg_o		<= dakika_birler_7seg;
		seven_seg_o(0) 	<= '0';
	elsif (anodes(5) = '0') then	
		seven_seg_o	<= dakika_onlar_7seg;		
	else
		seven_seg_o	<= (others => '1');
	end if;

end if;
end process;

---------------------------------------------------------------------------------------
-- SIGNAL ASSIGNMENTS
---------------------------------------------------------------------------------------
anodes_o	<= anodes;

end Behavioral;