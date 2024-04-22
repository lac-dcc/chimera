

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.std_logic_unsigned.ALL;

entity top is
	port (
			-- Clocks
		clock_50_i			: in    std_logic;

		-- Buttons
		btn_n_i				: in    std_logic_vector(4 downto 1);

		-- SRAMs (AS7C34096)
		sram2_addr_o		: out   std_logic_vector(18 downto 0)	:= (others => '0');
		sram2_data_io		: inout std_logic_vector(7 downto 0)	:= (others => 'Z');
		sram2_we_n_o		: out   std_logic								:= '1';
		sram2_oe_n_o		: out   std_logic								:= '1';

		sram3_addr_o		: out   std_logic_vector(18 downto 0)	:= (others => '0');
		sram3_data_io		: inout std_logic_vector(7 downto 0)	:= (others => 'Z');
		sram3_we_n_o		: out   std_logic								:= '1';
		sram3_oe_n_o		: out   std_logic								:= '1';
		
		-- SDRAM	(H57V256)
		sdram_ad_o			: out std_logic_vector(12 downto 0);
		sdram_da_io			: inout std_logic_vector(15 downto 0);

		sdram_ba_o			: out std_logic_vector(1 downto 0);
		sdram_dqm_o			: out std_logic_vector(1 downto 0);

		sdram_ras_o			: out std_logic;
		sdram_cas_o			: out std_logic;
		sdram_cke_o			: out std_logic;
		sdram_clk_o			: out std_logic;
		sdram_cs_o			: out std_logic;
		sdram_we_o			: out std_logic;
	

		-- PS2
		ps2_clk_io			: inout std_logic								:= 'Z';
		ps2_data_io			: inout std_logic								:= 'Z';
		ps2_mouse_clk_io  : inout std_logic								:= 'Z';
		ps2_mouse_data_io : inout std_logic								:= 'Z';

		-- SD Card
		sd_cs_n_o			: out   std_logic								:= '1';
		sd_sclk_o			: out   std_logic								:= '0';
		sd_mosi_o			: out   std_logic								:= '0';
		sd_miso_i			: inout    std_logic;

		-- Joysticks
		joy1_up_i			: in    std_logic;
		joy1_down_i			: in    std_logic;
		joy1_left_i			: in    std_logic;
		joy1_right_i		: in    std_logic;
		joy1_p6_i			: in    std_logic;
		joy1_p9_i			: in    std_logic;
		joy2_up_i			: in    std_logic;
		joy2_down_i			: in    std_logic;
		joy2_left_i			: in    std_logic;
		joy2_right_i		: in    std_logic;
		joy2_p6_i			: in    std_logic;
		joy2_p9_i			: in    std_logic;
		joyX_p7_o			: out   std_logic								:= '1';

		-- Audio
		dac_l_o				: out   std_logic								:= '0';
		dac_r_o				: out   std_logic								:= '0';
		ear_i					: in    std_logic;
		mic_o					: out   std_logic								:= '0';

		-- VGA
		vga_r_o				: out   std_logic_vector(3 downto 0)	:= (others => '0');
		vga_g_o				: out   std_logic_vector(3 downto 0)	:= (others => '0');
		vga_b_o				: out   std_logic_vector(3 downto 0)	:= (others => '0');
		vga_hsync_n_o		: out   std_logic								:= '1';
		vga_vsync_n_o		: out   std_logic								:= '1';

		-- HDMI
		tmds_o				: out   std_logic_vector(7 downto 0)	:= (others => '0');

		--STM32
		smt_rx_i				: in std_logic			:= 'Z';
		smt_tx_o				: out std_logic		:= 'Z';
		smt_rst_o			: out std_logic		:= 'Z'; --hold the microcontroller reset line, to free the SD card
		
		smt_b8_io			: inout std_logic		:= 'Z';
		smt_b9_io			: inout std_logic		:= 'Z';
		smt_b12_io			: in std_logic			:= 'Z';
		smt_b13_io			: in std_logic			:= 'Z';
		smt_b14_io			: inout std_logic		:= 'Z';
		smt_b15_io			: in std_logic			:= 'Z'
	);
end entity;

architecture Behavior of top is

	component no_hdmi is
	port
	(
		-- pixel clock
		pclk			: in std_logic;
		
		-- output to VGA screen
		hs	: out std_logic;
		vs	: out std_logic;
		pixel_o	: out std_logic;
		blank 	: out std_logic
	);
	end component;
	
	component osd is
	generic
	(
		OSD_X_OFFSET : std_logic_vector(9 downto 0) := (others=>'0');
		OSD_Y_OFFSET : std_logic_vector(9 downto 0) := (others=>'0');
		OSD_COLOR    : std_logic_vector(2 downto 0) := (others=>'0')
	);
	port
	(
		-- OSDs pixel clock, should be synchronous to cores pixel clock to
		-- avoid jitter.
		pclk		: in std_logic;

		-- SPI interface
		sck		: in std_logic;
		ss			: in std_logic;
		sdi		: in std_logic;
		sdo		: out std_logic;

		-- VGA signals coming from core
		red_in 	: in std_logic_vector(3 downto 0);
		green_in : in std_logic_vector(3 downto 0);
		blue_in 	: in std_logic_vector(3 downto 0);
		hs_in		: in std_logic;
		vs_in		: in std_logic;
		
		-- VGA signals going to video connector
		red_out	: out std_logic_vector(3 downto 0);
		green_out: out std_logic_vector(3 downto 0);
		blue_out	: out std_logic_vector(3 downto 0);
		hs_out 	: out std_logic;
		vs_out 	: out std_logic;
		
		-- external data in to the microcontroller
		data_in 	: in std_logic_vector(7 downto 0);
		
		-- data pump to sram
		pump_active_o	: out std_logic := '0';
		sram_a_o 		: out std_logic_vector(18 downto 0);
		sram_d_o 		: out std_logic_vector(7 downto 0);
		sram_we_n_o 	: out std_logic := '1'
	);
	end component;

	alias SPI_DI  : std_logic is smt_b15_io;
	alias SPI_DO  : std_logic is smt_b14_io;
	alias SPI_SCK  : std_logic is smt_b13_io;
	alias SPI_SS3  : std_logic is smt_b12_io;
			


	-- clocks
	signal clk_vga		: std_logic;		
	signal clk_dvi				: std_logic;		
	signal pMemClk				: std_logic;		

	-- Reset 
	signal reset_s				: std_logic;		-- Reset geral	
	signal power_on_s			: std_logic_vector(7 downto 0)	:= (others => '1');
	
	-- Video
	signal video_r_s				: std_logic_vector(3 downto 0)	:= (others => '0');
	signal video_g_s				: std_logic_vector(3 downto 0)	:= (others => '0');
	signal video_b_s				: std_logic_vector(3 downto 0)	:= (others => '0');
	signal video_hsync_n_s		: std_logic								:= '1';
	signal video_vsync_n_s		: std_logic								:= '1';
	

	signal clock_div_q	: unsigned(7 downto 0) 				:= (others => '0');	
	
	-- VGA
	signal vga_hsync_n_s 		: std_logic;
	signal vga_vsync_n_s 		: std_logic;
	signal vga_blank_s 			: std_logic;
	signal video_pixel_s			: std_logic;
	
	signal vga_r_s				: std_logic_vector( 3 downto 0);
	signal vga_g_s				: std_logic_vector( 3 downto 0);
	signal vga_b_s				: std_logic_vector( 3 downto 0);
	
	
	-- Keyboard
	signal keys_s			: std_logic_vector( 7 downto 0) := (others => '1');	
	signal FKeys_s			: std_logic_vector(12 downto 1);
	
begin

	process (clk_vga)
	begin
		if rising_edge(clk_vga) then
			if power_on_s /= x"00" then
				reset_s <= '1';
				smt_rst_o <= '0';
				power_on_s <= power_on_s - 1;
			else
				reset_s <= '0';
				smt_rst_o <= 'Z';
			end if;
		end if;
	end process;
  
	U00 : work.pll
	  port map(
		inclk0   => clock_50_i,              
		c0       => clk_vga,             -- 25.200Mhz
		c1       => clk_dvi                  -- 126 MHz

	  );

		
	

	sdram_clk_o			<= pMemClk; -- SD-RAM Clock
	
	dac_l_o <= '0';
	dac_r_o <= '0';
	
	---------
	
	------ NO HDMI --------------------------
	no_hdmi_block : block 

			component no_hdmi is
			port
			(
				-- pixel clock
				pclk			: in std_logic;
				
				-- output to VGA screen
				hs	: out std_logic;
				vs	: out std_logic;
				pixel_o	: out std_logic;
				blank 	: out std_logic
			);
			end component;
			  
			signal no_hdmi_vs_s : std_logic;
			signal no_hdmi_hs_s : std_logic;
			signal no_hdmi_blank_s : std_logic;
			signal no_hdmi_pixel_s : std_logic;
			
			signal tdms_r_s			: std_logic_vector( 9 downto 0);
			signal tdms_g_s			: std_logic_vector( 9 downto 0);
			signal tdms_b_s			: std_logic_vector( 9 downto 0);
			signal hdmi_p_s			: std_logic_vector( 3 downto 0);
			signal hdmi_n_s			: std_logic_vector( 3 downto 0);
			
	begin 			
			no_hdmi1 : no_hdmi 
			port map
			(
				pclk     => clk_vga,
				
				hs    	=> no_hdmi_hs_s,
				vs    	=> no_hdmi_vs_s,
				pixel_o  => no_hdmi_pixel_s,
				blank 	=> no_hdmi_blank_s
			);
		
		
		---------
		
		-- HDMI
			no_hdmi_dvid: entity work.hdmi
			generic map (
				FREQ	=> 25200000,	-- pixel clock frequency 
				FS		=> 48000,		-- audio sample rate - should be 32000, 41000 or 48000 = 48KHz
				CTS	=> 25200,		-- CTS = Freq(pixclk) * N / (128 * Fs)
				N		=> 6144			-- N = 128 * Fs /1000,  128 * Fs /1500 <= N <= 128 * Fs /300 (Check HDMI spec 7.2 for details)
			) 
			port map (
				I_CLK_PIXEL		=> clk_vga,
					
				I_R				=> no_hdmi_pixel_s & no_hdmi_pixel_s & no_hdmi_pixel_s & no_hdmi_pixel_s & no_hdmi_pixel_s & no_hdmi_pixel_s & no_hdmi_pixel_s & no_hdmi_pixel_s,
				I_G				=> no_hdmi_pixel_s & no_hdmi_pixel_s & no_hdmi_pixel_s & no_hdmi_pixel_s & no_hdmi_pixel_s & no_hdmi_pixel_s & no_hdmi_pixel_s & no_hdmi_pixel_s,
				I_B				=> no_hdmi_pixel_s & no_hdmi_pixel_s & no_hdmi_pixel_s & no_hdmi_pixel_s & no_hdmi_pixel_s & no_hdmi_pixel_s & no_hdmi_pixel_s & no_hdmi_pixel_s,
				
				I_BLANK			=> no_hdmi_blank_s,
				I_HSYNC			=> no_hdmi_hs_s,
				I_VSYNC			=> no_hdmi_vs_s,
				-- PCM audio
				I_AUDIO_ENABLE	=> '1',
				I_AUDIO_PCM_L 	=> (others=>'0'),
				I_AUDIO_PCM_R	=> (others=>'0'),
				-- TMDS parallel pixel synchronous outputs (serialize LSB first)
				O_RED				=> tdms_r_s,
				O_GREEN			=> tdms_g_s,
				O_BLUE			=> tdms_b_s
			);
			

			no_hdmi_io: entity work.hdmi_out_altera
			port map (
				clock_pixel_i		=> clk_vga,
				clock_tdms_i		=> clk_dvi,
				red_i					=> tdms_r_s,
				green_i				=> tdms_g_s,
				blue_i				=> tdms_b_s,
				tmds_out_p			=> hdmi_p_s,
				tmds_out_n			=> hdmi_n_s
			);
			
			
			tmds_o(7)	<= hdmi_p_s(2);	-- 2+		
			tmds_o(6)	<= hdmi_n_s(2);	-- 2-		
			tmds_o(5)	<= hdmi_p_s(1);	-- 1+			
			tmds_o(4)	<= hdmi_n_s(1);	-- 1-		
			tmds_o(3)	<= hdmi_p_s(0);	-- 0+		
			tmds_o(2)	<= hdmi_n_s(0);	-- 0-	
			tmds_o(1)	<= hdmi_p_s(3);	-- CLK+	
			tmds_o(0)	<= hdmi_n_s(3);	-- CLK-	
		
	end block;
		
		



end architecture;
