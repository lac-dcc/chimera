--------------------------------------------------------------------------------
-- Engineer:      Mike Field <hamster@snap.net.nz>
-- Description:   Converts VGA signals into DVI-D bitstreams.
--
--                'clk_tdms0' and 'clk_tdms90' should be 2.5x clk_pixel.
--
--                'blank' should be asserted during the non-display 
--                portions of the frame
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
Library UNISIM;
use UNISIM.vcomponents.all;

entity dvid is
    Port ( clk_tmds0  : in  STD_LOGIC;
           clk_tmds90 : in  STD_LOGIC;
           clk_pixel  : in  STD_LOGIC;
           red_p      : in  STD_LOGIC_VECTOR (7 downto 0);
           green_p    : in  STD_LOGIC_VECTOR (7 downto 0);
           blue_p     : in  STD_LOGIC_VECTOR (7 downto 0);
           blank      : in  STD_LOGIC;
           hsync      : in  STD_LOGIC;
           vsync      : in  STD_LOGIC;
           red_s      : out STD_LOGIC;
           green_s    : out STD_LOGIC;
           blue_s     : out STD_LOGIC;
           clock_s    : out STD_LOGIC);
end dvid;

architecture Behavioral of dvid is
   COMPONENT TDMS_encoder
   PORT(
      clk     : IN  std_logic;
      data    : IN  std_logic_vector(7 downto 0);
      c       : IN  std_logic_vector(1 downto 0);
      blank   : IN  std_logic;          
      encoded : OUT std_logic_vector(9 downto 0)
      );
   END COMPONENT;

	COMPONENT qdr
	PORT(
		clk0  : IN std_logic;
		clk90 : IN std_logic;
		data  : IN std_logic_vector(3 downto 0);          
		qdr   : OUT std_logic
		);
	END COMPONENT;

   signal encoded_r, encoded_g, encoded_b : std_logic_vector(9 downto 0);

   -- for the control frames (blanking)
   constant c_red     : std_logic_vector(1 downto 0) := (others => '0');
   constant c_green   : std_logic_vector(1 downto 0) := (others => '0');
   signal   c_blue    : std_logic_vector(1 downto 0);
	
	signal   latched_r : std_logic_vector(9 downto 0) := (others => '0');
	signal   latched_g : std_logic_vector(9 downto 0) := (others => '0');
	signal   latched_b : std_logic_vector(9 downto 0) := (others => '0');
	
	signal   buffer_r : std_logic_vector(9 downto 0) := (others => '0');
	signal   buffer_g : std_logic_vector(9 downto 0) := (others => '0');
	signal   buffer_b : std_logic_vector(9 downto 0) := (others => '0');
	
	-- one hot encoded. Initial Value is important to sync with pixel chantges!
	signal   state     : std_logic_vector(4 downto 0) := "10000"; 

	signal   bits_r    : std_logic_vector(3 downto 0) := (others => '0');
	signal   bits_g    : std_logic_vector(3 downto 0) := (others => '0');
	signal   bits_b    : std_logic_vector(3 downto 0) := (others => '0');
	signal   bits_c    : std_logic_vector(3 downto 0) := (others => '0');
	
	-- output shift registers
	signal   sr_r      : std_logic_vector(11 downto 0):= (others => '0');
	signal   sr_g      : std_logic_vector(11 downto 0):= (others => '0');
	signal   sr_b      : std_logic_vector(11 downto 0):= (others => '0');
   signal   sr_c      : std_logic_vector(9 downto 0) := "0111110000";
	
	-- Gives a startup delay to allow the fifo to fill
	signal delay_ctr	: std_logic_vector(3 downto 0) := (others => '0');
begin   
   c_blue  <= vsync & hsync;
   
TDMS_encoder_red:   TDMS_encoder PORT MAP(clk => clk_pixel, data => red_p,   c => c_red,   blank => blank, encoded => encoded_r);
TDMS_encoder_green: TDMS_encoder PORT MAP(clk => clk_pixel, data => green_p, c => c_green, blank => blank, encoded => encoded_g);
TDMS_encoder_blue:  TDMS_encoder PORT MAP(clk => clk_pixel, data => blue_p,  c => c_blue,  blank => blank, encoded => encoded_b);

qdr_r: qdr PORT MAP(clk0 => clk_tmds0, clk90 => clk_tmds90, data => bits_r(3 downto 0), qdr => red_s);
qdr_g: qdr PORT MAP(clk0 => clk_tmds0, clk90 => clk_tmds90, data => bits_g(3 downto 0), qdr => green_s);
qdr_b: qdr PORT MAP(clk0 => clk_tmds0, clk90 => clk_tmds90, data => bits_b(3 downto 0), qdr => blue_s);
qdr_c: qdr PORT MAP(clk0 => clk_tmds0, clk90 => clk_tmds90, data => bits_c(3 downto 0), qdr => clock_s);

	process(clk_pixel)
	begin
		-- Just sample the encoded pixel data, to give a smooth transition to high speed domain
		if rising_edge(clk_pixel) then
			buffer_r <= encoded_r;
			buffer_g <= encoded_g;
			buffer_b <= encoded_b;
		end if;
	end process;
	
   process(clk_tmds0)
   begin
      if rising_edge(clk_tmds0) then 
			bits_r <= sr_r(3 downto 0);
			bits_g <= sr_g(3 downto 0);
			bits_b <= sr_b(3 downto 0);
			bits_c <= sr_c(3 downto 0);
			case state is 
				when "00001" =>
					sr_r <= "00" & latched_r;
					sr_g <= "00" & latched_g;
					sr_b <= "00" & latched_b;
				when "00010" =>
					sr_r <= "0000" & sr_r(sr_r'high downto 4);
					sr_g <= "0000" & sr_g(sr_g'high downto 4);
					sr_b <= "0000" & sr_b(sr_b'high downto 4);
				when "00100" =>
					sr_r <= latched_r & sr_r(5 downto 4);
					sr_g <= latched_g & sr_g(5 downto 4);
					sr_b <= latched_b & sr_b(5 downto 4);
				when "01000" =>
					sr_r <= "0000" & sr_r(sr_r'high downto 4);
					sr_g <= "0000" & sr_g(sr_g'high downto 4);
					sr_b <= "0000" & sr_b(sr_b'high downto 4);
				when others =>
					sr_r <= "0000" & sr_r(sr_r'high downto 4);
					sr_g <= "0000" & sr_g(sr_g'high downto 4);
					sr_b <= "0000" & sr_b(sr_b'high downto 4);
			end case;
			
			-- Move on to the next state
			state       <= state(state'high-1 downto 0) & state(state'high);
			
			-- Move the TMDS clock signal shift register
			sr_c <= sr_c(3 downto 0) & sr_c(sr_c'high downto 4);
			if delay_ctr(delay_ctr'high) = '0' then 
				delay_ctr <= delay_ctr +1;
			end if;
			
			-- Move the encoded pixel data into the fast clock domain
			latched_r <= buffer_r;
			latched_g <= buffer_g;
			latched_b <= buffer_b;
      end if;
   end process;
   
end Behavioral;

