library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.pace_pkg.all;
use work.video_controller_pkg.all;
use work.project_pkg.all;
use work.platform_pkg.all;

entity target_top is
  port(
		ext_reset     : in std_logic;
      CLOCK_27      : in std_logic;                       --	Input clock MHz
		clock_24      : in std_logic;
		clock_40      : in std_logic;
      audio         : out std_logic_vector(7 downto 0);
      VGA_VS        : out std_logic;                        --	VGA H_SYNC
      VGA_HS        : out std_logic;                        --	VGA V_SYNC
      VGA_R         : out std_logic_vector(5 downto 0);     --	VGA Red[3:0]
      VGA_G         : out std_logic_vector(5 downto 0);     --	VGA Green[3:0]
      VGA_B         : out std_logic_vector(5 downto 0);     --	VGA Blue[3:0]
		start1      : in std_logic;
		start2      : in std_logic;
		coin      : in std_logic;
		p1_up      : in std_logic;
		p1_down      : in std_logic;
		p1_left      : in std_logic;
		p1_right      : in std_logic;
		p1_f1      : in std_logic; 
		p1_f2      : in std_logic
  );    
  
end target_top;

architecture SYN of target_top is



  signal init       	: std_logic := '1';  
  
  signal clkrst_i       : from_CLKRST_t;
  signal buttons_i      : from_BUTTONS_t;
  signal switches_i     : from_SWITCHES_t;
  signal leds_o         : to_LEDS_t;
  signal inputs_i       : from_INPUTS_t;
  signal video_i        : from_VIDEO_t;
  signal video_o        : to_VIDEO_t;
  signal audio_i        : from_AUDIO_t;
  signal audio_o        : to_AUDIO_t;
  signal project_i      : from_PROJECT_IO_t;
  signal project_o      : to_PROJECT_IO_t;
  signal platform_i     : from_PLATFORM_IO_t;
  signal platform_o     : to_PLATFORM_IO_t;

  signal switches       : std_logic_vector(1 downto 0);
  signal BUTTON        : std_logic_vector(7 downto 0);
  
--//********************

begin

clkrst_i.clk_ref <= CLOCK_27;
clkrst_i.clk(0)<=clock_24;
clkrst_i.clk(1)<=clock_40;	  

	
  -- FPGA STARTUP
	-- should extend power-on reset if registers init to '0'
	process (clock_24)
		variable count : std_logic_vector (11 downto 0) := (others => '0');
	begin
		if rising_edge(clock_24) then
			if count = X"FFF" then
				init <= '0';
			else
				count := count + 1;
				init <= '1';
			end if;
		end if;
	end process;

  clkrst_i.arst <= init or ext_reset;
  clkrst_i.arst_n <= not clkrst_i.arst;

  GEN_RESETS : for i in 0 to 3 generate

    process (clkrst_i.clk(i), clkrst_i.arst)
      variable rst_r : std_logic_vector(2 downto 0) := (others => '0');
    begin
      if clkrst_i.arst = '1' then
        rst_r := (others => '1');
      elsif rising_edge(clkrst_i.clk(i)) then
        rst_r := rst_r(rst_r'left-1 downto 0) & '0';
      end if;
      clkrst_i.rst(i) <= rst_r(rst_r'left);
    end process;

  end generate GEN_RESETS;

		BUTTON(7) <= not coin;
		BUTTON(6) <= not start1;
		BUTTON(5) <= not start2;
		BUTTON(4) <= not p1_up;
--		BUTTON(1) <= not p1_down;
		BUTTON(2) <= not p1_left;
		BUTTON(3) <= not p1_right;
		BUTTON(0) <= not p1_f1; 
		BUTTON(1) <= not p1_f2; 


    video_i.clk <= clkrst_i.clk(1);	-- by convention
    video_i.clk_ena <= '1';
    video_i.reset <= clkrst_i.rst(1);
    
    VGA_R <= video_o.rgb.r(video_o.rgb.r'left downto video_o.rgb.r'left-5);
    VGA_G <= video_o.rgb.g(video_o.rgb.g'left downto video_o.rgb.g'left-5);
    VGA_B <= video_o.rgb.b(video_o.rgb.b'left downto video_o.rgb.b'left-5);
    VGA_HS <= video_o.hsync;
    VGA_VS <= video_o.vsync;
  
    audio <= audio_o.ldata(15 downto 8);

 
 pace_inst : entity work.pace                                            
   port map
   (
	  BUTTON        	=> BUTTON,
     -- clocks and resets
     clkrst_i					=> clkrst_i,

     -- misc inputs and outputs
     buttons_i         => buttons_i,
     switches_i        => switches_i,
     leds_o            => open,
     
     -- controller inputs
     inputs_i          => inputs_i,
  
      -- VGA video
      video_i           => video_i,
      video_o           => video_o,
      
      -- sound
      audio_i           => audio_i,
      audio_o           => audio_o,
      
      -- custom i/o
      project_i         => project_i,
      project_o         => project_o,
      platform_i        => platform_i,
      platform_o        => platform_o
    );
end SYN;
