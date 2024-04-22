----------------------------------------------------------------------------------
-- Colin "domipheus" Riley
-- Clocking helper.
-- useful for generating clocks for DVI-D purposes with ODDR2 TMDS serialization
-- that needs an inverted clock
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity clocking is
 generic (
     in_mul   : integer := 10;    
     pix_div : natural := 30;
     pix5x_div : natural := 10
  );
    Port ( 
        I_unbuff_clk : in  STD_LOGIC;
        O_buff_clkpixel : out  STD_LOGIC;
        O_buff_clk5xpixel : out  STD_LOGIC;
        O_buff_clk5xpixelinv : out  STD_LOGIC;
        O_buff_clk : out STD_LOGIC
	);
end clocking;

architecture Behavioral of clocking is
    signal clock_pixel            : std_logic;
    signal clock_pixel_unbuffered : std_logic;
    signal clock_x5pixel            : std_logic;
    signal clock_x5pixel_unbuffered : std_logic;
    signal clock_x5pixelinv            : std_logic;
    signal clock_x5pixelinv_unbuffered : std_logic;
    signal clk_feedback   : std_logic;
    signal clk_buffered : std_logic;
    signal pll_locked     : std_logic;
begin

    PLL_BASE_inst : PLL_BASE
    generic map (
        CLKFBOUT_MULT => in_mul,       
         
        CLKOUT0_DIVIDE => pix_div,    
        CLKOUT0_PHASE => 0.0,   
        
        CLKOUT1_DIVIDE => pix5x_div,     
        CLKOUT1_PHASE => 0.0,   
        
        CLKOUT2_DIVIDE => pix5x_div,     
        CLKOUT2_PHASE => 180.0,  

        CLK_FEEDBACK => "CLKFBOUT", 
        CLKIN_PERIOD => 10.0,  
        DIVCLK_DIVIDE => 1 
    )
    port map (
      CLKFBOUT => clk_feedback, 
      CLKOUT0  => clock_pixel_unbuffered,
      CLKOUT1  => clock_x5pixel_unbuffered,
      CLKOUT2  => clock_x5pixelinv_unbuffered,
      CLKOUT3  => open,
      CLKOUT4  => open,
      CLKOUT5  => open,
      LOCKED   => pll_locked,      
      CLKFBIN  => clk_feedback,    
      CLKIN    => clk_buffered, 
      RST      => '0' 
    );

	BUFG_clk : BUFG port map 
	( 
		I => I_unbuff_clk,                
		O => clk_buffered
	);

--	BUFG_pclock : BUFG port map 
--	( 
--	  I => clock_pixel_unbuffered,  
--  O => clock_pixel
--	);

--	BUFG_pclockx5 : BUFG port map 
--	( 
--	  I => clock_x5pixel_unbuffered,  
--	  O => clock_x5pixel
--	);

--	BUFG_pclockx5_180 : BUFG port map 
--	( 
--	  I => clock_x5pixelinv_unbuffered,  
--	  O => clock_x5pixelinv
--	);
	
   O_buff_clk <= clk_buffered;
   O_buff_clkpixel <= clock_pixel_unbuffered;
   O_buff_clk5xpixel <= clock_x5pixel_unbuffered;
   O_buff_clk5xpixelinv <= clock_x5pixelinv_unbuffered;
	
end Behavioral;

