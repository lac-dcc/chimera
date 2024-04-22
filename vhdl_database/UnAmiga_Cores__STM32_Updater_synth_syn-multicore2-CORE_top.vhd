----------------------------------
--
--  CORE UPDATER
--
----------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity top is
port 
(
		-- Clocks
		clock_50_i			: in    std_logic;

		-- Buttons
		btn_n_i				: in    std_logic_vector(4 downto 1);

		-- SRAMs (AS7C34096)
		sram2_addr_o		: out   std_logic_vector(18 downto 0)	:= (others => '0');
		sram2_data_io		: inout std_logic_vector(7 downto 0)	:= (others => 'Z');
		sram2_we_n_o		: out   std_logic								:= '1';
		sram2_oe_n_o		: out   std_logic								:= '1';
		
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
		sd_miso_i			: in    std_logic;

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
		vga_r_o				: out   std_logic_vector(4 downto 0)	:= (others => '0');
		vga_g_o				: out   std_logic_vector(4 downto 0)	:= (others => '0');
		vga_b_o				: out   std_logic_vector(4 downto 0)	:= (others => '0');
		vga_hsync_n_o		: out   std_logic								:= '1';
		vga_vsync_n_o		: out   std_logic								:= '1';

		-- HDMI
		tmds_o				: out   std_logic_vector(7 downto 0)	:= (others => '0');

		--STM32
		stm_rx_o				: out std_logic		:= 'Z'; -- stm RX pin, so, is OUT on the slave
		stm_tx_i				: in  std_logic		:= 'Z'; -- stm TX pin, so, is IN on the slave
		stm_rst_o			: out std_logic		:= 'Z'; -- '0' to hold the microcontroller reset line, to free the SD card
		
		stm_a15_io			: inout std_logic;
		stm_b8_io			: inout std_logic		:= 'Z';
		stm_b9_io			: inout std_logic		:= 'Z';
		stm_b12_io			: inout std_logic		:= 'Z';
		stm_b13_io			: inout std_logic		:= 'Z';
		stm_b14_io			: inout std_logic		:= 'Z';
		stm_b15_io			: inout std_logic		:= 'Z'
		
	);
end entity;

architecture Behavior of top is

	-- ASMI (Altera specific component)
	component cycloneii_asmiblock
	port (
		dclkin      : in    std_logic;      -- DCLK
		scein       : in    std_logic;      -- nCSO
		sdoin       : in    std_logic;      -- ASDO
		oe          : in    std_logic;      --(1=disable(Hi-Z))
		data0out    : out   std_logic       -- DATA0
	);
	end component;

	-- Reset signal
	signal reset_n				: std_logic;		-- Reset geral
	
	-- Master clock
	signal pll_reset			: std_logic;		-- Reset do PLL
	signal pll_locked			: std_logic;		-- PLL travado quando 1
	
	-- Master clock
	signal clk_28		: std_logic;
	signal memory_clock		: std_logic;
	signal vid_clk: std_logic := '0';
	signal sysclk : std_logic := '0';
	signal atari_clk: std_logic;

	
	signal ram_a				: std_logic_vector(18 downto 0);		-- 512K
	signal ram_din				: std_logic_vector(15 downto 0);
	signal ram_dout				: std_logic_vector(15 downto 0);
	signal ram_cs				: std_logic;
	signal ram_oe				: std_logic;
	signal ram_we				: std_logic;
	signal rom_a				: std_logic_vector(13 downto 0);		-- 16K
	signal rom_dout			: std_logic_vector(7 downto 0);
	
	signal from_sram			: std_logic_vector(15 downto 0);
	signal to_sram			: std_logic_vector(15 downto 0);
	
		-- ram
	signal loader_ram_a				: std_logic_vector(18 downto 0);		-- 512K
	signal loader_to_sram			: std_logic_vector(15 downto 0);
	signal loader_from_sram			: std_logic_vector(15 downto 0);
	signal loader_ram_data			: std_logic_vector(15 downto 0);
	signal loader_ram_cs				: std_logic;
	signal loader_ram_oe				: std_logic;
	signal loader_ram_we				: std_logic;



	-- EPCS
	signal spi_mosi_s			: std_logic;
	signal spi_sclk_s			: std_logic;
	signal flash_miso_s		: std_logic;
	signal flash_cs_n_s		: std_logic;
	signal spi_cs_n			: std_logic			:= '1';
	
	
	--rgb
	signal rgb_loader_out			: std_logic_vector(7 downto 0);
	signal rgb_atari_out				: std_logic_vector(7 downto 0);
	
	signal hsync_loader_out			: std_logic;
	signal vsync_loader_out			: std_logic;
	
	signal hsync_atari_out			: std_logic;
	signal vsync_atari_out			: std_logic;
	
	signal bs_method			 		: std_logic_vector(7 downto 0);
	
	-- PS/2
	signal keyb_data_s 			: std_logic_vector(7 downto 0);
	signal keyb_valid_s 			: std_logic;
	signal clk_keyb : std_logic;
	
	signal joy_l_s			: std_logic;
	signal joy_r_s			: std_logic;
	
	-- HDMI
	
	signal clk_pixel, clk_pixel_shift: std_logic;
		signal vga_hsync_n_s		: std_logic;
	signal vga_vsync_n_s		: std_logic;
	signal vga_blank_s		: std_logic;
	signal sound_hdmi_s		: std_logic_vector(15 downto 0);
	signal tdms_s				: std_logic_vector( 7 downto 0);
		signal vga_col_s			: std_logic_vector( 3 downto 0);
		
		signal loader_hor_s: std_logic_vector( 8 downto 0);
		signal loader_ver_s: std_logic_vector( 8 downto 0);
		signal cnt_hor_s 				: std_logic_vector(8 downto 0);
	signal cnt_ver_s 				: std_logic_vector(8 downto 0);
	
	-- HDMI
	signal tdms_r_s			: std_logic_vector( 9 downto 0);
	signal tdms_g_s			: std_logic_vector( 9 downto 0);
	signal tdms_b_s			: std_logic_vector( 9 downto 0);
	signal hdmi_p_s			: std_logic_vector( 3 downto 0);
	signal hdmi_n_s			: std_logic_vector( 3 downto 0);
	
	signal port303b_s		: std_logic := '0';
	  
		
begin

	DB1: entity work.debounce 
		generic map
		(
			counter_size_g	 => 13
		)
		port map(
			clk_i				=> clk_pixel,
			button_i			=> not joy1_left_i,
			result_o			=>joy_l_s
		);
	
	DB2: entity work.debounce 
		generic map
		(
			counter_size_g	 => 13
		)
		port map(
			clk_i				=> clk_pixel,
			button_i			=> not joy1_right_i,
			result_o			=> joy_r_s
		);
		
	
	
--	process(joy_l_s)
--		begin
--			if rising_edge (joy_l_s) then
--				write_mem_s <= not write_mem_s;
--			end if;
--	end process;

 	ps2 : work.ps2_intf port map 
	(
		clk_keyb,
		reset_n,
		ps2_clk_io,
		ps2_data_io,
		keyb_data_s,
		keyb_valid_s,
		open
	);
	
	clk_keyb <= clk_pixel;-- when A2601_reset = '1' else vid_clk;

	-- 28 MHz master clock
	pll: work.pll1 port map (
		areset		=> pll_reset,				-- PLL Reset
		inclk0		=> clock_50_i,				-- Clock 50 MHz externo
		c0				=> sysclk,		
		c1				=> vid_clk,
		c2				=> clk_28,	
		c3				=> clk_pixel,       		--  25 MHz		
		c4				=> clk_pixel_shift, 		-- 125 MHz		
		locked		=> pll_locked				-- Sinal de travamento (1 = PLL travado e pronto)
	);
	
	pll_reset	<= '1' when btn_n_i(1) = '0' else '0';
	reset_n		<= not (pll_reset or not pll_locked);	-- System is reset by external reset switch or PLL being out of lock
	
	loader : work.speccy48_top port map 
	(
		
		clk_28   	=> clk_28,
		reset_n_i 	=> reset_n,
	
		VGA_R(3 downto 1) => rgb_loader_out (7 downto 5),    
		VGA_G(3 downto 1) => rgb_loader_out (4 downto 2),    
		VGA_B(3 downto 2) => rgb_loader_out (1 downto 0),   
		VGA_HS         	=> hsync_loader_out,  
		VGA_VS         	=> vsync_loader_out,   
		--VGA_BLANK			=> blank_ula_s,

		-- PS/2 Keyboar   -- PS/2 Ke
		keyb_data      => keyb_data_s, 
		keyb_valid     => keyb_valid_s,   
   
		SRAM_ADDR      => loader_ram_a,
		FROM_SRAM      => loader_from_sram,
		TO_SRAM       	=> loader_to_sram,
		SRAM_CE_N      => loader_ram_cs,
		SRAM_OE_N      => loader_ram_oe,
		SRAM_WE_N      => loader_ram_we ,
                  		  
		SD_nCS         => sd_cs_n_o,
		SD_MOSI        => spi_mosi_s, 
		SD_SCLK        => spi_sclk_s, 
		SD_MISO        => sd_miso_i,
		oFlash_cs_n		=> flash_cs_n_s,
		iFlash_miso		=> flash_miso_s,
		
		PORT_243B 		=> open,
		
		joystick       => "000" & not joy1_p6_i &  not joy1_up_i &  not joy1_down_i & not joy1_left_i & not joy1_right_i,
		
		cnt_h_o      => loader_hor_s,
		cnt_v_o      => loader_ver_s,
		
		iRS232_rx	=> stm_tx_i,
		oRS232_tx	=> stm_rx_o,
		
		port303b_o	=> port303b_s
		
	);
	
	sd_mosi_o	<= spi_mosi_s;
	sd_sclk_o	<= spi_sclk_s;
	
	
	stm_rst_o <= '0' when port303b_s = '1' else 'Z';
	
	sram2_addr_o   <= loader_ram_a;
	sram2_data_io  <= loader_to_sram(7 downto 0) when loader_ram_we = '0' else (others=>'Z');
	loader_from_sram(7 downto 0) 	  <= sram2_data_io;
   sram2_oe_n_o   <= loader_ram_oe;
	sram2_we_n_o   <= loader_ram_we;

	


	
	-- VGA framebuffer
	vga: entity work.vga
	port map (
		I_CLK			=> clk_pixel,
		I_CLK_VGA	=> clk_pixel,
		I_COLOR		=> "0" & rgb_loader_out(7)& rgb_loader_out(4)& rgb_loader_out(1),
		I_HCNT		=> loader_hor_s,
		I_VCNT		=> loader_ver_s,
		O_HSYNC		=> vga_hsync_n_s,
		O_VSYNC		=> vga_vsync_n_s,
		O_COLOR		=> vga_col_s,
		O_HCNT		=> open,
		O_VCNT		=> open,
		O_H			=> open,
		O_BLANK		=> vga_blank_s
	);
	


-- HDMI
 		inst_dvid: entity work.hdmi
 		generic map (
 			FREQ	=> 25200000,	-- pixel clock frequency 
 			FS		=> 48000,		-- audio sample rate - should be 32000, 41000 or 48000 = 48KHz
 			CTS	=> 25200,		-- CTS = Freq(pixclk) * N / (128 * Fs)
 			N		=> 6144			-- N = 128 * Fs /1000,  128 * Fs /1500 <= N <= 128 * Fs /300 (Check HDMI spec 7.2 for details)
 		) 
 		port map (
 			I_CLK_PIXEL		=> clk_pixel,
			
			I_R				=> vga_col_s(2) & vga_col_s(2) & vga_col_s(2) & vga_col_s(2) & vga_col_s(2) & vga_col_s(2)& vga_col_s(2) & vga_col_s(2),
			I_G				=> vga_col_s(1) & vga_col_s(1) & vga_col_s(1) & vga_col_s(1) & vga_col_s(1) & vga_col_s(1)& vga_col_s(1) & vga_col_s(1),
			I_B				=> vga_col_s(0) & vga_col_s(0) & vga_col_s(0) & vga_col_s(0) & vga_col_s(0) & vga_col_s(0)& vga_col_s(0) & vga_col_s(0),
			
			I_BLANK			=> vga_blank_s,
			I_HSYNC			=> vga_hsync_n_s,
			I_VSYNC			=> vga_vsync_n_s,
			-- PCM audio
			I_AUDIO_ENABLE	=> '1',
			I_AUDIO_PCM_L 	=> (others=>'0'),
			I_AUDIO_PCM_R	=> (others=>'0'),
			-- TMDS parallel pixel synchronous outputs (serialize LSB first)
 			O_RED				=> tdms_r_s,
			O_GREEN			=> tdms_g_s,
			O_BLUE			=> tdms_b_s
		);
		

			hdmio: entity work.hdmi_out_altera
		port map (
			clock_pixel_i		=> clk_pixel,
			clock_tdms_i		=> clk_pixel_shift,
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
		
		vga_r_o			<= vga_col_s(2) & vga_col_s(2) & vga_col_s(2) & vga_col_s(2) & '0';
		vga_g_o			<= vga_col_s(1) & vga_col_s(1) & vga_col_s(1) & vga_col_s(1) & '0';
		vga_b_o			<= vga_col_s(0) & vga_col_s(0) & vga_col_s(0) & vga_col_s(0) & '0';
		vga_hsync_n_o	<= vga_hsync_n_s;
		vga_vsync_n_o	<= vga_vsync_n_s;
		

		
--------------------------------------------------

	-- EPCS4
	epcs4: cycloneii_asmiblock
	port map 
	(
		oe          => '0',
		scein       => flash_cs_n_s and btn_n_i(2),
		dclkin      => spi_sclk_s,
		sdoin       => spi_mosi_s,
		data0out    => flash_miso_s
	);

		

	
end architecture;
