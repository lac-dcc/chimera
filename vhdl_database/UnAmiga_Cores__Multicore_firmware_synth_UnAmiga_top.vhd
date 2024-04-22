

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
--		sram2_addr_o		: out   std_logic_vector(18 downto 0)	:= (others => '0');
--		sram2_data_io		: inout std_logic_vector(7 downto 0)	:= (others => 'Z');
--		sram2_we_n_o		: out   std_logic								:= '1';
--		sram2_oe_n_o		: out   std_logic								:= '1';
		
		-- SDRAM	(H57V256)
--		sdram_ad_o			: out std_logic_vector(12 downto 0);
--		sdram_da_io			: inout std_logic_vector(15 downto 0);
--
--		sdram_ba_o			: out std_logic_vector(1 downto 0);
--		sdram_dqm_o			: out std_logic_vector(1 downto 0);
--
--		sdram_ras_o			: out std_logic;
--		sdram_cas_o			: out std_logic;
--		sdram_cke_o			: out std_logic;
--		sdram_clk_o			: out std_logic;
--		sdram_cs_o			: out std_logic;
--		sdram_we_o			: out std_logic;
	

		-- PS2
		ps2_clk_io			: inout std_logic								:= 'Z';
		ps2_data_io			: inout std_logic								:= 'Z';
--		ps2_mouse_clk_io  : inout std_logic								:= 'Z';
--		ps2_mouse_data_io : inout std_logic								:= 'Z';

		-- SD Card
--		sd_cs_n_o			: out   std_logic								:= '1';
--		sd_sclk_o			: out   std_logic								:= '0';
--		sd_mosi_o			: out   std_logic								:= '0';
--		sd_miso_i			: in    std_logic;

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
--		dac_l_o				: out   std_logic								:= '0';
--		dac_r_o				: out   std_logic								:= '0';
--		ear_i					: in    std_logic;
--		mic_o					: out   std_logic								:= '0';

		-- VGA
		vga_r_o				: out   std_logic_vector(4 downto 0)	:= (others => '0');
		vga_g_o				: out   std_logic_vector(4 downto 0)	:= (others => '0');
		vga_b_o				: out   std_logic_vector(4 downto 0)	:= (others => '0');
		vga_hsync_n_o		: out   std_logic								:= '1';
		vga_vsync_n_o		: out   std_logic								:= '1';

		-- HDMI
--		tmds_o				: out   std_logic_vector(7 downto 0)	:= (others => '0');

		--STM32
--		stm_rx_o				: out std_logic		:= 'Z'; -- stm RX pin, so, is OUT on the slave
--		stm_tx_i				: in  std_logic		:= 'Z'; -- stm TX pin, so, is IN on the slave
		stm_rst_o			: out std_logic		:= '1'; -- '0' to hold the microcontroller reset line, to free the SD card
		
--		stm_a15_io			: inout std_logic;
--		stm_b8_io			: inout std_logic		:= 'Z';
--		stm_b9_io			: inout std_logic		:= 'Z';
		stm_b12_io			: inout std_logic		:= 'Z';
		stm_b13_io			: inout std_logic		:= 'Z';
		stm_b14_io			: inout std_logic		:= 'Z';
		stm_b15_io			: inout std_logic		:= 'Z'
	);
end entity;

architecture Behavior of top is

	type config_array is array(natural range 15 downto 0) of std_logic_vector(7 downto 0);

	function to_slv(s: string) return std_logic_vector is 
        constant ss: string(1 to s'length) := s; 
        variable answer: std_logic_vector(1 to 8 * s'length); 
        variable p: integer; 
        variable c: integer; 
    begin 
        for i in ss'range loop
            p := 8 * i;
            c := character'pos(ss(i));
            answer(p - 7 to p) := std_logic_vector(to_unsigned(c,8)); 
        end loop; 
        return answer; 
    end function; 

	component vga is
	port
	(
		-- pixel clock
		pclk			: in std_logic;

		-- enable/disable scanlines
		scanlines	: in std_logic;
		
		-- output to VGA screen
		hs	: out std_logic;
		vs	: out std_logic;
		r	: out std_logic_vector(3 downto 0);
		g	: out std_logic_vector(3 downto 0);
		b	: out std_logic_vector(3 downto 0);
		blank : out std_logic
		
		--debug
		--joy_i	: in std_logic_vector(11 downto 0)
	);
	end component;
	
	component osd is
	generic
	(
		OSD_VISIBLE 	: std_logic_vector(1 downto 0) := (others=>'0');
		OSD_X_OFFSET 	: std_logic_vector(9 downto 0) := (others=>'0');
		OSD_Y_OFFSET 	: std_logic_vector(9 downto 0) := (others=>'0');
		OSD_COLOR    	: std_logic_vector(2 downto 0) := (others=>'0')
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
		red_in 	: in std_logic_vector(4 downto 0);
		green_in : in std_logic_vector(4 downto 0);
		blue_in 	: in std_logic_vector(4 downto 0);
		hs_in		: in std_logic;
		vs_in		: in std_logic;
		
		-- VGA signals going to video connector
		red_out	: out std_logic_vector(4 downto 0);
		green_out: out std_logic_vector(4 downto 0);
		blue_out	: out std_logic_vector(4 downto 0);
		hs_out 	: out std_logic;
		vs_out 	: out std_logic;
		
		-- Data in
		data_in 	: in std_logic_vector(7 downto 0);
		
		--data pump to sram
		pump_active_o	: out std_logic;
		sram_a_o			: out std_logic_vector(18 downto 0);
		sram_d_o			: out std_logic_vector(7 downto 0);
		sram_we_n_o		: out std_logic;
		config_buffer_o: out config_array
	
	);
	end component;

	alias SPI_DI  : std_logic is stm_b15_io;
	alias SPI_DO  : std_logic is stm_b14_io;
	alias SPI_SCK  : std_logic is stm_b13_io;
	alias SPI_SS3  : std_logic is stm_b12_io;
			


	-- clocks
	signal pixel_clock		: std_logic;		
	signal clk_dvi				: std_logic;		
	signal pMemClk				: std_logic;		
	signal clock_div_q		: unsigned(7 downto 0) 				:= (others => '0');	
	
	-- Reset 
	signal reset_s				: std_logic;		-- Reset geral	
	signal power_on_s			: std_logic_vector(7 downto 0)	:= (others => '1');
	signal btn_reset_s		: std_logic;
	
	-- Video
	signal video_r_s				: std_logic_vector(3 downto 0)	:= (others => '0');
	signal video_g_s				: std_logic_vector(3 downto 0)	:= (others => '0');
	signal video_b_s				: std_logic_vector(3 downto 0)	:= (others => '0');
	signal video_hsync_n_s		: std_logic								:= '1';
	signal video_vsync_n_s		: std_logic								:= '1';
	
	signal osd_r_s				: std_logic_vector(3 downto 0)	:= (others => '0');
	signal osd_g_s				: std_logic_vector(3 downto 0)	:= (others => '0');
	signal osd_b_s				: std_logic_vector(3 downto 0)	:= (others => '0');
	
	-- VGA
	signal vga_r_s				: std_logic_vector( 3 downto 0);
	signal vga_g_s				: std_logic_vector( 3 downto 0);
	signal vga_b_s				: std_logic_vector( 3 downto 0);
	signal vga_hsync_n_s 		: std_logic;
	signal vga_vsync_n_s 		: std_logic;
	signal vga_blank_s 			: std_logic;

	-- HDMI
--	signal tdms_r_s			: std_logic_vector( 9 downto 0);
--	signal tdms_g_s			: std_logic_vector( 9 downto 0);
--	signal tdms_b_s			: std_logic_vector( 9 downto 0);
--	signal hdmi_p_s			: std_logic_vector( 3 downto 0);
--	signal hdmi_n_s			: std_logic_vector( 3 downto 0);
	
	-- Keyboard
	signal keys_s			: std_logic_vector( 7 downto 0) := (others => '1');	
	signal FKeys_s			: std_logic_vector(12 downto 1);
	
	-- joystick
	signal joy1_s			: std_logic_vector(11 downto 0) := (others => '1'); -- MS ZYX CBA RLDU	
	signal joy2_s			: std_logic_vector(11 downto 0) := (others => '1'); -- MS ZYX CBA RLDU	
	signal joyP7_s			: std_logic;
	
	-- config string
	constant STRLEN		: integer := 1;
--	constant CONF_STR		: std_logic_vector((STRLEN * 8)-1 downto 0) := to_slv("P,config.ini");
	constant CONF_STR		: std_logic_vector(7 downto 0) := X"00";
	
	signal config_buffer_s : config_array;

begin	

--	btnscl: entity work.debounce
--	generic map (
--		counter_size	=> 16
--	)
--	port map (
--		clk_i				=> pixel_clock,
--		button_i			=> btn_n_i(1) and btn_n_i(2) and btn_n_i(3) and btn_n_i(4),
--		result_o			=> btn_reset_s
--	);
	

	process (pixel_clock)
	begin
		if rising_edge(pixel_clock) then
		
			if btn_reset_s = '0' then
				power_on_s <= (others=>'1');
			end if;
			
			if power_on_s /= x"00" then
				reset_s <= '1';
				stm_rst_o <= '0';
				power_on_s <= power_on_s - 1;
			else
				reset_s <= '0';
				stm_rst_o <= 'Z';
			end if;
			
		end if;
	end process;
  
	U00 : work.pll
	  port map(
		inclk0   => clock_50_i,              
		c0       => pixel_clock,             -- 25.200Mhz
		c1       => clk_dvi                  -- 126 MHz

	  );

	vga1 : vga 
	port map
	(
		pclk     => pixel_clock      ,

		scanlines => '0',
		
		hs    	=> video_hsync_n_s,
		vs    	=> video_vsync_n_s,
		r     	=> video_r_s,
		g     	=> video_g_s,
		b     	=> video_b_s,
		blank 	=> vga_blank_s
		
--		joy_i		=> joy1_s and joy2_s
	);
	  

	osd1 : osd 
	generic map
	(	
		--STRLEN => STRLEN,
		OSD_VISIBLE => "01",
		OSD_COLOR => "001", -- RGB
		OSD_X_OFFSET => "0000010010", -- 50
		OSD_Y_OFFSET => "0000001111"  -- 15
	)
	port map
	(
		pclk        => pixel_clock,

		-- spi for OSD
		sdi        => SPI_DI,
		sck        => SPI_SCK,
		ss         => SPI_SS3,
		sdo        => SPI_DO,
		
		red_in     => video_r_s & '0',
		green_in   => video_g_s & '0',
		blue_in    => video_b_s & '0',
		hs_in      => video_hsync_n_s,
		vs_in      => video_vsync_n_s,

		red_out(4 downto 1)    => osd_r_s,
		green_out(4 downto 1)  => osd_g_s,
		blue_out(4 downto 1)   => osd_b_s,
		hs_out     => vga_hsync_n_s,
		vs_out     => vga_vsync_n_s ,

--		data_in		=> keys_s,
		data_in		=> keys_s and "111" & (joy1_s(6) and joy1_s(5) and joy1_s(4)) & joy1_s(3 downto 0),
	--	conf_str		=> CONF_STR,
		
		config_buffer_o=> config_buffer_s
	);
   
	info1 : work.core_info 
	generic map
	(
		xOffset => 325,  --610
		yOffset => 440   --480
	)
	port map
	(
		clk_i 	=> pixel_clock,
		
		r_i 		=> osd_r_s,
		g_i 		=> osd_g_s,
		b_i 		=> osd_b_s,
		hSync_i 	=> vga_hsync_n_s,
		vSync_i 	=> vga_vsync_n_s ,

		r_o 		=> vga_r_s,
		g_o 		=> vga_g_s,
		b_o 		=> vga_b_s,
		
		core_char1_s => "000001",  -- V 1.01 for the core
		core_char2_s => "000000",
		core_char3_s => "000001",
						
		stm_char1_s => unsigned(config_buffer_s(0)(5 downto 0)), 	
		stm_char2_s => unsigned(config_buffer_s(1)(5 downto 0)),
		stm_char3_s => unsigned(config_buffer_s(2)(5 downto 0))
	); 
			  

	
	kb: entity work.ps2keyb
	port map (
		enable_i			=> '1',
		clock_i			=> pixel_clock,
		clock_ps2_i		=> clock_div_q(1),
		reset_i			=> reset_s,
		--
		ps2_clk_io		=> ps2_clk_io,
		ps2_data_io		=> ps2_data_io,
		--
		keys_o			=> keys_s,
		functionkeys_o	=> FKeys_s

	);
	
	-- Keyboard clock
	process(pixel_clock)
	begin
		if rising_edge(pixel_clock) then 
			clock_div_q <= clock_div_q + 1;
		end if;
	end process;
	  
--	sdram_clk_o			<= pMemClk; -- SD-RAM Clock
	
--	dac_l_o <= '0';
--	dac_r_o <= '0';
	
	---------
	
	-- HDMI
-- 		inst_dvid: entity work.hdmi
-- 		generic map (
-- 			FREQ	=> 25200000,	-- pixel clock frequency 
-- 			FS		=> 48000,		-- audio sample rate - should be 32000, 41000 or 48000 = 48KHz
-- 			CTS	=> 25200,		-- CTS = Freq(pixclk) * N / (128 * Fs)
-- 			N		=> 6144			-- N = 128 * Fs /1000,  128 * Fs /1500 <= N <= 128 * Fs /300 (Check HDMI spec 7.2 for details)
-- 		) 
-- 		port map (
-- 			I_CLK_PIXEL		=> pixel_clock,
--			
--			I_R				=> vga_r_s & vga_r_s,
--			I_G				=> vga_g_s & vga_g_s,
--			I_B				=> vga_b_s & vga_b_s,
--			
--			I_BLANK			=> vga_blank_s,
--			I_HSYNC			=> vga_hsync_n_s,
--			I_VSYNC			=> vga_vsync_n_s,
--			-- PCM audio
--			I_AUDIO_ENABLE	=> '1',
--			I_AUDIO_PCM_L 	=> (others=>'0'),
--			I_AUDIO_PCM_R	=> (others=>'0'),
--			-- TMDS parallel pixel synchronous outputs (serialize LSB first)
-- 			O_RED				=> tdms_r_s,
--			O_GREEN			=> tdms_g_s,
--			O_BLUE			=> tdms_b_s
--		);
		

--			hdmio: entity work.hdmi_out_altera
--		port map (
--			clock_pixel_i		=> pixel_clock,
--			clock_tdms_i		=> clk_dvi,
--			red_i					=> tdms_r_s,
--			green_i				=> tdms_g_s,
--			blue_i				=> tdms_b_s,
--			tmds_out_p			=> hdmi_p_s,
--			tmds_out_n			=> hdmi_n_s
--		);
-- 		
--		
--		tmds_o(7)	<= hdmi_p_s(2);	-- 2+		
--		tmds_o(6)	<= hdmi_n_s(2);	-- 2-		
--		tmds_o(5)	<= hdmi_p_s(1);	-- 1+			
--		tmds_o(4)	<= hdmi_n_s(1);	-- 1-		
--		tmds_o(3)	<= hdmi_p_s(0);	-- 0+		
--		tmds_o(2)	<= hdmi_n_s(0);	-- 0-	
--		tmds_o(1)	<= hdmi_p_s(3);	-- CLK+	
--		tmds_o(0)	<= hdmi_n_s(3);	-- CLK-	
		
		vga_r_o			<= vga_r_s & '0';
		vga_g_o			<= vga_g_s & '0';
		vga_b_o			<= vga_b_s & '0';
		vga_hsync_n_o	<= vga_hsync_n_s;
		vga_vsync_n_o	<= vga_vsync_n_s;
		
		
		
		
--- Joystick read with sega 6 button support----------------------

	process(vga_hsync_n_s)
		variable state_v : unsigned(7 downto 0) := (others=>'0');
		variable j1_sixbutton_v : std_logic := '0';
		variable j2_sixbutton_v : std_logic := '0';
	begin
		if falling_edge(vga_hsync_n_s) then
		
			state_v := state_v + 1;
			
			case state_v is
				-- joy_s format MXYZ SACB RLDU
			
				when X"00" =>  
					joyP7_s <= '0';
					
				when X"01" =>
					joyP7_s <= '1';

				when X"02" => 
					joy1_s(3 downto 0) <= joy1_right_i & joy1_left_i & joy1_down_i & joy1_up_i; -- R, L, D, U
					joy2_s(3 downto 0) <= joy2_right_i & joy2_left_i & joy2_down_i & joy2_up_i; -- R, L, D, U
					joy1_s(5 downto 4) <= joy1_p9_i & joy1_p6_i; -- C, B
					joy2_s(5 downto 4) <= joy2_p9_i & joy2_p6_i; -- C, B					
					joyP7_s <= '0';
					j1_sixbutton_v := '0'; -- Assume it's not a six-button controller
					j2_sixbutton_v := '0'; -- Assume it's not a six-button controller

				when X"03" =>
					joy1_s(7 downto 6) <= joy1_p9_i & joy1_p6_i; -- Start, A
					joy2_s(7 downto 6) <= joy2_p9_i & joy2_p6_i; -- Start, A
					joyP7_s <= '1';
			
				when X"04" =>  
					joyP7_s <= '0';

				when X"05" =>
					if joy1_right_i = '0' and joy1_left_i = '0' and joy1_down_i = '0' and joy1_up_i = '0' then 
						j1_sixbutton_v := '1'; --it's a six button
					end if;
					
					if joy2_right_i = '0' and joy2_left_i = '0' and joy2_down_i = '0' and joy2_up_i = '0' then 
						j2_sixbutton_v := '1'; --it's a six button
					end if;
					
					joyP7_s <= '1';
					
				when X"06" =>
					if j1_sixbutton_v = '1' then
						joy1_s(11 downto 8) <= joy1_right_i & joy1_left_i & joy1_down_i & joy1_up_i; -- Mode, X, Y e Z
					end if;
					
					if j2_sixbutton_v = '1' then
						joy2_s(11 downto 8) <= joy2_right_i & joy2_left_i & joy2_down_i & joy2_up_i; -- Mode, X, Y e Z
					end if;
					
					joyP7_s <= '0';

				when others =>
					joyP7_s <= '1';
					
			end case;

		end if;
	end process;
	
	joyX_p7_o <= joyP7_s;
---------------------------


end architecture;
