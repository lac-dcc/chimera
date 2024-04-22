
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.msx_pack.all;

entity MSX1 is
	port (
		-- Clocks    
		clock_27m_i			: in    std_logic_vector(1 downto 0);							-- 27 MHz
		-- SDRAM
		sdram_cs_n_o		: out   std_logic						:= '1';					-- Chip Select
		sdram_data_io		: inout std_logic_vector(15 downto 0)	:= (others => 'Z');		-- SDRAM Data bus 16 Bits
		sdram_addr_o		: out   std_logic_vector(12 downto 0)	:= (others => '0');		-- SDRAM Address bus 13 Bits
		sdram_dqmh_o		: out   std_logic						:= '0';					-- SDRAM High Data Mask
		sdram_dqml_o		: out   std_logic						:= '0';					-- SDRAM Low-byte Data Mask
		sdram_we_n_o		: out   std_logic						:= '1';					-- SDRAM Write Enable
		sdram_cas_n_o		: out   std_logic						:= '1';					-- SDRAM Column Address Strobe
		sdram_ras_n_o		: out   std_logic						:= '1';					-- SDRAM Row Address Strobe
		sdram_ba_o			: out   std_logic_vector(1 downto 0)	:= (others => '0');		-- SDRAM Bank Address
		sdram_clk_o			: out   std_logic						:= '0';					-- SDRAM Clock
		sdram_clk_en_o		: out   std_logic						:= '1';					-- SDRAM Clock Enable
		-- SPI
		spi_sck_i			: in    std_logic;
		spi_data_i			: in    std_logic;
		spi_data_o			: out   std_logic						:= '0';
		spi_ss2_i			: in    std_logic;
		spi_ss3_i			: in    std_logic;
		spi_ss4_i			: in    std_logic;
		conf_data0_i		: in    std_logic;
		-- VGA output
		vga_hs_n_o			: out   std_logic						:= '1';					-- H_SYNC
		vga_vs_n_o			: out   std_logic						:= '1';					-- V_SYNC
		vga_r_o				: out   std_logic_vector(5 downto 0)	:= (others => '0');		-- Red[5:0]
		vga_g_o				: out   std_logic_vector(5 downto 0)	:= (others => '0');		-- Green[5:0]
		vga_b_o				: out   std_logic_vector(5 downto 0)	:= (others => '0');		-- Blue[5:0]
		-- Audio
		audio_l_o			: out   std_logic						:= '0';
		audio_r_o			: out   std_logic						:= '0';
		-- LED
		led_n_o				: out   std_logic						:= '1';
		-- UART/Tape
		uart_rx_tape_i		: in    std_logic;
		uart_tx_o			: out   std_logic						:= '0'
	);

end entity;

architecture rtl of MSX1 is

	-- Resets
	signal pll_locked_s			: std_logic;
	signal por_s				: std_logic;
	signal reset_s				: std_logic;
	signal soft_por_s			: std_logic;
	signal soft_reset_k_s		: std_logic;
	signal soft_reset_s_s		: std_logic;
	signal soft_rst_cnt_s		: unsigned( 7 downto 0)	:= X"FF";

	-- Clocks
	signal clock_master_s		: std_logic;
	signal clock_sdram_s		: std_logic;
	signal clock_3m_en_s		: std_logic;
	signal clock_7m_en_s		: std_logic;
	signal clock_10m_en_s		: std_logic;
	signal clock_cpu_en_s		: std_logic;
	signal turbo_on_s			: std_logic;

	-- RAM
	signal ram_addr_s			: std_logic_vector(22 downto 0);		-- 8MB
	signal ram_data_from_s		: std_logic_vector( 7 downto 0);
	signal ram_data_to_s		: std_logic_vector( 7 downto 0);
	signal ram_ce_n_s			: std_logic;
	signal ram_oe_n_s			: std_logic;
	signal ram_we_n_s			: std_logic;

	-- ROM
--	signal rom_addr_s			: std_logic_vector(14 downto 0);		-- 32K
--	signal rom_data_from_s		: std_logic_vector( 7 downto 0);
--	signal rom_ce_n_s			: std_logic;
--	signal rom_oe_n_s			: std_logic;

	-- VRAM memory
	signal vram_addr_s			: std_logic_vector(13 downto 0);		-- 16K
	signal vram_data_from_s		: std_logic_vector( 7 downto 0);
	signal vram_data_to_s		: std_logic_vector( 7 downto 0);
	signal vram_ce_n_s			: std_logic;
	signal vram_oe_n_s			: std_logic;
	signal vram_we_n_s			: std_logic;

	-- Audio
	signal audio_scc_s			: signed(14 downto 0);
	signal audio_psg_s			: unsigned(7 downto 0);
	signal beep_s				: std_logic;
	signal ear_s				: std_logic;
	signal audio_l_s			: signed(15 downto 0);
	signal audio_r_s			: signed(15 downto 0);
	signal volumes_s			: volumes_t;

	-- Video
	signal rgb_r_s				: std_logic_vector( 3 downto 0);
	signal rgb_g_s				: std_logic_vector( 3 downto 0);
	signal rgb_b_s				: std_logic_vector( 3 downto 0);
	signal rgb_hsync_n_s		: std_logic;
	signal rgb_vsync_n_s		: std_logic;
	signal ntsc_pal_s			: std_logic;
	signal vga_en_s				: std_logic;
	signal scandoubler_disable_s: std_logic;
	signal scanlines_s			: std_logic_vector( 1 downto 0);
	signal ypbpr_s				: std_logic;
	signal osd_red_s			: std_logic_vector( 5 downto 0);
	signal osd_green_s			: std_logic_vector( 5 downto 0);
	signal osd_blue_s			: std_logic_vector( 5 downto 0);
	signal no_csync_s			: std_logic;
  
	-- Keyboard
	signal rows_s				: std_logic_vector( 3 downto 0);
	signal cols_s				: std_logic_vector( 7 downto 0);
	signal caps_en_s			: std_logic;
	signal extra_keys_s			: std_logic_vector( 3 downto 0);
	signal keyb_valid_s			: std_logic;
	signal keyb_data_s			: std_logic_vector( 7 downto 0);
	signal keymap_addr_s		: std_logic_vector( 8 downto 0);
	signal keymap_data_s		: std_logic_vector( 7 downto 0);
	signal keymap_we_n_s		: std_logic;

	-- SD
	signal sd_cs_n_s			: std_logic;
	signal sd_miso_s			: std_logic;
	signal sd_mosi_s			: std_logic;
	signal sd_mosi_q			: std_logic;
	signal sd_sclk_s			: std_logic;
	signal sd_lba_s				: std_logic_vector(31 downto 0);
	signal img_mounted_s		: std_logic_vector( 1 downto 0);
	signal sd_rd_s				: std_logic_vector( 1 downto 0);
	signal sd_wr_s				: std_logic_vector( 1 downto 0);
	signal sd_ack_s				: std_logic;
	signal sd_ack_conf_s		: std_logic;
	signal sd_conf_s			: std_logic;
	signal sd_sdhc_s			: std_logic;
	signal img_size_s			: std_logic_vector(63 downto 0);
	signal sd_buff_addr_s		: std_logic_vector( 8 downto 0);
	signal sd_dout_s			: std_logic_vector( 7 downto 0);
	signal sd_din_s				: std_logic_vector( 7 downto 0);
	signal sd_busy_s			: std_logic;
	signal sd_dout_strobe_s		: std_logic;
	signal sd_din_strobe_s		: std_logic;
	signal sd_block_q			: std_logic;

	-- MIST
	signal status_s				: std_logic_vector(63 downto 0);
	signal buttons_s			: std_logic_vector( 1 downto 0);
	signal switches_s			: std_logic_vector( 1 downto 0);

	-- PS/2
	signal ps2_clk_i_s			: std_logic;
	signal ps2_dat_i_s			: std_logic;
	signal ps2_clk_o_s			: std_logic;
	signal ps2_dat_o_s			: std_logic;

	-- Bus
	signal bus_addr_s			: std_logic_vector(15 downto 0);
	signal bus_data_from_s		: std_logic_vector( 7 downto 0)		:= (others => '1');
	signal bus_data_to_s		: std_logic_vector( 7 downto 0);
	signal bus_rd_n_s			: std_logic;
	signal bus_wr_n_s			: std_logic;
	signal bus_m1_n_s			: std_logic;
	signal bus_iorq_n_s			: std_logic;
	signal bus_mreq_n_s			: std_logic;
	signal bus_sltsl1_n_s		: std_logic;
	signal bus_sltsl2_n_s		: std_logic;

	-- OPLL
	signal opll_mo_s			: signed(12 downto 0)				:= (others => '0');
	signal opll_ro_s			: signed(12 downto 0)				:= (others => '0');

	constant CONF_STR : string := "MSX1;;" &
		"S,VHD,Mount;" &
	  	"O5,Hard reset after Mount,No,Yes;" &
	  	"O34,Scandoubler Fx,None,HQ2x,CRT 25%,CRT 50%;" &
		"O2,Joysticks Swap,No,Yes;" &
		"T1,Reset (soft);" &
	  	"T0,Reset (hard);" &
		"V,v1.4";

	function to_slv(s: string) return std_logic_vector is 
		constant ss		: string(1 to s'length) := s; 
		variable rval	: std_logic_vector(1 to 8 * s'length); 
		variable p		: integer; 
		variable c		: integer; 
	begin 
		for i in ss'range loop
			p := 8 * i;
			c := character'pos(ss(i));
			rval(p - 7 to p) := std_logic_vector(to_unsigned(c,8));
		end loop;
		return rval;
	end function; 

	component user_io
	generic(
		STRLEN				: integer := 0;
		PS2DIV				: integer := 100;
		ROM_DIRECT_UPLOAD	: integer := 0;
		SD_IMAGES			: integer := 2;
		PS2BIDIR			: integer := 0;
		FEATURES			: std_logic_vector(31 downto 0) := (others => '0')
	);
	port (
		clk_sys           : in std_logic;
		clk_sd            : in std_logic := '0';
		SPI_CLK				: in std_logic;
		SPI_SS_IO			: in std_logic;
		SPI_MOSI 			: in std_logic;
		SPI_MISO          : out std_logic;
		conf_str          : in std_logic_vector(8*STRLEN-1 downto 0) := (others => '0');
		conf_addr         : out std_logic_vector(9 downto 0);
		conf_chr          : in  std_logic_vector(7 downto 0) := (others => '0');
		joystick_0        : out std_logic_vector(31 downto 0);
		joystick_1        : out std_logic_vector(31 downto 0);
		joystick_2        : out std_logic_vector(31 downto 0);
		joystick_3        : out std_logic_vector(31 downto 0);
		joystick_4        : out std_logic_vector(31 downto 0);
		joystick_analog_0 : out std_logic_vector(31 downto 0);
		joystick_analog_1 : out std_logic_vector(31 downto 0);
		status            : out std_logic_vector(63 downto 0);
		switches          : out std_logic_vector(1 downto 0);
		buttons           : out std_logic_vector(1 downto 0);
		scandoubler_disable : out std_logic;
		ypbpr             : out std_logic;
		no_csync          : out std_logic;
		core_mod          : out std_logic_vector(6 downto 0);
	
		sd_lba            : in  std_logic_vector(31 downto 0) 				:= (others => '0');
		sd_rd             : in  std_logic_vector(SD_IMAGES-1 downto 0) 		:= (others => '0');
		sd_wr             : in  std_logic_vector(SD_IMAGES-1 downto 0) 		:= (others => '0');
		sd_ack            : out std_logic;
		sd_ack_conf       : out std_logic;
		sd_ack_x          : out std_logic_vector(SD_IMAGES-1 downto 0);
		sd_conf           : in  std_logic 									:= '0';
		sd_sdhc           : in  std_logic 									:= '1';
		img_size          : out std_logic_vector(63 downto 0);
		img_mounted       : out std_logic_vector(SD_IMAGES-1 downto 0);
	
		sd_buff_addr      : out std_logic_vector(8 downto 0);
		sd_dout           : out std_logic_vector(7 downto 0);
		sd_din            : in  std_logic_vector(7 downto 0) 				:= (others => '0');
		sd_dout_strobe    : out std_logic;
		sd_din_strobe     : out std_logic;
	
		ps2_kbd_clk       : out std_logic;
		ps2_kbd_data      : out std_logic;
		ps2_kbd_clk_i     : in  std_logic 									:= '1';
		ps2_kbd_data_i    : in  std_logic 									:= '1';
		key_pressed       : out std_logic;
		key_extended      : out std_logic;
		key_code          : out std_logic_vector(7 downto 0);
		key_strobe        : out std_logic;
	
		ps2_mouse_clk     : out std_logic;
		ps2_mouse_data    : out std_logic;
		ps2_mouse_clk_i   : in  std_logic := '1';
		ps2_mouse_data_i  : in  std_logic := '1';
		mouse_x           : out signed(8 downto 0);
		mouse_y           : out signed(8 downto 0);
		mouse_z           : out signed(3 downto 0);
		mouse_flags       : out std_logic_vector(7 downto 0); -- YOvfl, XOvfl, dy8, dx8, 1, mbtn, rbtn, lbtn
		mouse_strobe      : out std_logic;
		mouse_idx         : out std_logic;
	
		i2c_start         : out std_logic;
		i2c_read          : out std_logic;
		i2c_addr          : out std_logic_vector(6 downto 0);
		i2c_subaddr       : out std_logic_vector(7 downto 0);
		i2c_dout          : out std_logic_vector(7 downto 0);
		i2c_din           : in std_logic_vector(7 downto 0) := (others => '0');
		i2c_end           : in std_logic := '0';
		i2c_ack           : in std_logic := '0'
	);
	end component user_io;

	component sd_card
	port (
    	clk_sys				: in  std_logic;
    	-- link to user_io for io controller
    	sd_lba				: out std_logic_vector(31 downto 0);
    	sd_rd				: out std_logic;
    	sd_wr				: out std_logic;
    	sd_ack				: in  std_logic							:= '0';
    	sd_ack_conf			: in  std_logic							:= '0';
    	sd_conf				: out std_logic;
    	sd_sdhc				: out std_logic;
    	img_mounted			: in  std_logic							:= '0';
    	img_size			: in  std_logic_vector(63 downto 0)		:= (others => '0');
    	sd_busy				: out std_logic 						:= '0';
    	-- data coming in from io controller
    	sd_buff_dout		: in  std_logic_vector( 7 downto 0)		:= (others => '0');
    	sd_buff_wr			: in  std_logic							:= '0';
    	-- data going out to io controller
    	sd_buff_din			: out std_logic_vector( 7 downto 0);
    	sd_buff_addr		: in  std_logic_vector( 8 downto 0)		:= (others => '0');
    	-- configuration input
    	-- in case of a VHD file, this will determine the SD Card type returned to the SPI master
    	-- in case of a pass-through, the firmware will display a warning if SDHC is not allowed,
    	-- but the card inserted is SDHC
    	allow_sdhc			: in  std_logic							:= '1';
    	sd_cs				: in  std_logic;
    	sd_sck				: in  std_logic;
    	sd_sdi				: in  std_logic;
    	sd_sdo				: out std_logic
	);
	end component sd_card;

	component mist_video
	generic (
		OSD_COLOR       : std_logic_vector(2 downto 0) := "110";
		OSD_X_OFFSET    : std_logic_vector(9 downto 0) := (others => '0');
		OSD_Y_OFFSET    : std_logic_vector(9 downto 0) := (others => '0');
--		SD_HCNT_WIDTH   : integer := 9;
		COLOR_DEPTH     : integer := 6;
--		OSD_AUTO_CE     : std_logic := '1';
--		SYNC_AND        : std_logic := '0';
--		USE_BLANKS      : std_logic := '0';
--		SD_HSCNT_WIDTH  : integer := 12;
		OUT_COLOR_DEPTH : integer := 6
--		BIG_OSD         : std_logic := '0';
--		VIDEO_CLEANER   : std_logic := '0'
	);
	port (
		clk_sys     		: in std_logic;

		SPI_SCK     		: in std_logic;
		SPI_SS3     		: in std_logic;
		SPI_DI      		: in std_logic;

		scanlines   		: in std_logic_vector(1 downto 0);
		ce_divider  		: in std_logic_vector(2 downto 0) := "000";
		scandoubler_disable : in std_logic;
		ypbpr       		: in std_logic;
		rotate      		: in std_logic_vector(1 downto 0);
		no_csync    		: in std_logic := '0';
		blend       		: in std_logic := '0';

		HBlank      		: in std_logic := '0';
		VBlank      		: in std_logic := '0';
		HSync       		: in std_logic;
		VSync       		: in std_logic;
		R           		: in std_logic_vector(COLOR_DEPTH-1 downto 0);
		G           		: in std_logic_vector(COLOR_DEPTH-1 downto 0);
		B           		: in std_logic_vector(COLOR_DEPTH-1 downto 0);

		VGA_HS      		: out std_logic;
		VGA_VS      		: out std_logic;
		VGA_HB      		: out std_logic;
		VGA_VB      		: out std_logic;
		VGA_DE      		: out std_logic;
		VGA_R       		: out std_logic_vector(OUT_COLOR_DEPTH-1 downto 0);
		VGA_G       		: out std_logic_vector(OUT_COLOR_DEPTH-1 downto 0);
		VGA_B       		: out std_logic_vector(OUT_COLOR_DEPTH-1 downto 0)
	);
	end component mist_video;

--	component osd
--	generic (
--		OUT_COLOR_DEPTH		: integer	:= 6
--	);
--	port (
--		-- OSDs pixel clock, should be synchronous to cores pixel clock to
--		-- avoid jitter.
--		clk_sys				: in  std_logic;
--		ce					: in  std_logic									:= '1';
--
--		-- SPI interface
--		SPI_SCK				: in  std_logic;
--		SPI_SS3				: in  std_logic;
--		SPI_DI				: in  std_logic;
--		rotate				: in  std_logic_vector(1 downto 0)				:= (others => '0');	-- //[0] - rotate [1] - left or right
--		-- VGA signals coming from core
--		R_in				: in  std_logic_vector(OUT_COLOR_DEPTH-1 downto 0);
--		G_in				: in  std_logic_vector(OUT_COLOR_DEPTH-1 downto 0);
--		B_in				: in  std_logic_vector(OUT_COLOR_DEPTH-1 downto 0);
--		HBlank				: in  std_logic									:= '0';
--		VBlank				: in  std_logic									:= '0';
--		HSync				: in  std_logic;
--		VSync				: in  std_logic;
--		-- VGA signals going to video connector
--		R_out				: out std_logic_vector(OUT_COLOR_DEPTH-1 downto 0);
--		G_out				: out std_logic_vector(OUT_COLOR_DEPTH-1 downto 0);
--		B_out				: out std_logic_vector(OUT_COLOR_DEPTH-1 downto 0)
--	);
--	end component osd;

begin

	-- PLL
	pll_1: entity work.pll1
	port map (
		inclk0	=> clock_27m_i(1),
		c0		=> clock_master_s,		-- 21.428571 MHz (6x NTSC)
		c1		=> clock_sdram_s,		-- 85.714286
		c2		=> sdram_clk_o,			-- 85.714286 -45°
		locked	=> pll_locked_s
	);

	-- Clocks
	clks: entity work.clocks
	port map (
		clock_master_i	=> clock_master_s,
		por_i			=> not pll_locked_s,
		clock_3m_en_o	=> clock_3m_en_s,
		clock_5m_en_o	=> open,
		clock_7m_en_o	=> clock_7m_en_s,
		clock_10m_en_o	=> clock_10m_en_s
	);

	clock_cpu_en_s	<= clock_3m_en_s	when turbo_on_s = '0' else clock_7m_en_s;

	-- The MSX1
	the_msx: entity work.msx
	generic map (
		hw_id_g			=> 7,
		hw_txt_g		=> "Mist Board",
		hw_version_g	=> actual_version,
		video_opt_g		=> 0,						-- No dblscan
		ramsize_g		=> 8192,
		opll_en_g		=> true
	)
	port map (
		-- Clocks
		clock_master_i	=> clock_master_s,
		clock_vdp_en_i	=> clock_10m_en_s,
		clock_cpu_en_i	=> clock_cpu_en_s,
		clock_psg_en_i	=> clock_3m_en_s,
		-- Turbo
		turbo_on_k_i	=> extra_keys_s(3),	-- F11
		turbo_on_o		=> turbo_on_s,
		-- Resets
		reset_i			=> reset_s,
		por_i			=> por_s,
		softreset_o		=> soft_reset_s_s,
		-- Options
		opt_nextor_i	=> '1',
		opt_mr_type_i	=> "00",
		opt_vga_on_i	=> '0',
		-- RAM
		ram_addr_o		=> ram_addr_s,
		ram_data_i		=> ram_data_from_s,
		ram_data_o		=> ram_data_to_s,
		ram_ce_n_o		=> ram_ce_n_s,
		ram_we_n_o		=> ram_we_n_s,
		ram_oe_n_o		=> ram_oe_n_s,
		-- ROM
		rom_addr_o		=> open,
		rom_data_i		=> ram_data_from_s,
		rom_ce_n_o		=> open,
		rom_oe_n_o		=> open,
		-- External bus
		bus_addr_o		=> bus_addr_s,
		bus_data_i		=> bus_data_from_s,
		bus_data_o		=> bus_data_to_s,
		bus_rd_n_o		=> bus_rd_n_s,
		bus_wr_n_o		=> bus_wr_n_s,
		bus_m1_n_o		=> bus_m1_n_s,
		bus_iorq_n_o	=> bus_iorq_n_s,
		bus_mreq_n_o	=> bus_mreq_n_s,
		bus_sltsl1_n_o	=> bus_sltsl1_n_s,
		bus_sltsl2_n_o	=> bus_sltsl2_n_s,
		bus_wait_n_i	=> '1',
		bus_nmi_n_i		=> '1',
		bus_int_n_i		=> '1',
		-- VDP RAM
		vram_addr_o		=> vram_addr_s,
		vram_data_i		=> vram_data_from_s,
		vram_data_o		=> vram_data_to_s,
		vram_ce_n_o		=> vram_ce_n_s,
		vram_oe_n_o		=> vram_oe_n_s,
		vram_we_n_o		=> vram_we_n_s,
		-- Keyboard
		rows_o			=> rows_s,
		cols_i			=> cols_s,
		caps_en_o		=> caps_en_s,
		keyb_valid_i	=> keyb_valid_s,
		keyb_data_i		=> keyb_data_s,
		keymap_addr_o	=> keymap_addr_s,
		keymap_data_o	=> keymap_data_s,
		keymap_we_n_o	=> keymap_we_n_s,
		-- Audio
		audio_scc_o		=> audio_scc_s,
		audio_psg_o		=> audio_psg_s,
		beep_o			=> beep_s,
		opll_mo_o		=> opll_mo_s,
		opll_ro_o		=> opll_ro_s,
		volumes_o		=> volumes_s,
		-- K7
		k7_motor_o		=> open,
		k7_audio_o		=> open,
		k7_audio_i		=> ear_s,
		-- Joystick
		joy1_up_i		=> '0',
		joy1_down_i		=> '0',
		joy1_left_i		=> '0',
		joy1_right_i	=> '0',
		joy1_btn1_i		=> '0',
		joy1_btn1_o		=> open,
		joy1_btn2_i		=> '0',
		joy1_btn2_o		=> open,
		joy1_out_o		=> open,
		joy2_up_i		=> '0',
		joy2_down_i		=> '0',
		joy2_left_i		=> '0',
		joy2_right_i	=> '0',
		joy2_btn1_i		=> '0',
		joy2_btn1_o		=> open,
		joy2_btn2_i		=> '0',
		joy2_btn2_o		=> open,
		joy2_out_o		=> open,
		-- Video
		rgb_r_o			=> rgb_r_s,
		rgb_g_o			=> rgb_g_s,
		rgb_b_o			=> rgb_b_s,
		hsync_n_o		=> rgb_hsync_n_s,
		vsync_n_o		=> rgb_vsync_n_s,
		ntsc_pal_o		=> ntsc_pal_s,
		vga_on_k_i		=> extra_keys_s(2),		-- Print Screen
		scanline_on_k_i	=> extra_keys_s(1),		-- Scroll Lock
		vga_en_o		=> vga_en_s,
		-- SPI/SD
		flspi_cs_n_o	=> open,
		spi_cs_n_o		=> sd_cs_n_s,
		spi_sclk_o		=> sd_sclk_s,
		spi_mosi_o		=> sd_mosi_s,
		spi_miso_i		=> sd_miso_s,
		sd_pres_n_i		=> '0',
		sd_wp_i			=> '0',
		-- DEBUG
		D_wait_o		=> open,
		D_slots_o		=> open,
		D_ipl_en_o		=> open
	);

	-- Keyboard PS/2
	keyb: entity work.keyboard
	generic map (
		ps2_signals_separated_g	=> true
	)
	port map (
		clock_i			=> clock_3m_en_s,
		reset_i			=> reset_s,
		-- MSX
		rows_coded_i	=> rows_s,
		cols_o			=> cols_s,
		keymap_addr_i	=> keymap_addr_s,
		keymap_data_i	=> keymap_data_s,
		keymap_we_n_i	=> keymap_we_n_s,
		-- LEDs
		led_caps_i		=> caps_en_s,
		-- PS/2 interface
		ps2_clk_i		=> ps2_clk_o_s,
		ps2_clk_o		=> ps2_clk_i_s,
		ps2_data_i		=> ps2_dat_o_s,
		ps2_data_o		=> ps2_dat_i_s,
		-- Direct Access
		keyb_valid_o	=> keyb_valid_s,
		keyb_data_o		=> keyb_data_s,
		--
		reset_o			=> soft_reset_k_s,
		por_o			=> soft_por_s,
		reload_core_o	=> open,
		extra_keys_o	=> extra_keys_s
	);

	-- VRAM
	vram: entity work.spram
	generic map (
		addr_width_g => 14,
		data_width_g => 8
	)
	port map (
		clock_i		=> clock_master_s,
		clock_en_i	=> clock_10m_en_s,
		we_n_i		=> vram_we_n_s,
		addr_i		=> vram_addr_s,
		data_i		=> vram_data_to_s,
		data_o		=> vram_data_from_s
	);

	-- RAM
	ram: entity work.ssdram256Mb
	generic map (
		freq_g			=> 86
	)
	port map (
		clock_i			=> clock_sdram_s,
		reset_i			=> reset_s,
		refresh_i		=> '1',
		-- Static RAM bus
		addr_i			=> "00"&ram_addr_s,
		data_i			=> ram_data_to_s,
		data_o			=> ram_data_from_s,
		cs_n_i			=> ram_ce_n_s,
		oe_n_i			=> ram_oe_n_s,
		we_n_i			=> ram_we_n_s,
		-- SD-RAM ports
		mem_cke_o		=> sdram_clk_en_o,
		mem_cs_n_o		=> sdram_cs_n_o,
		mem_ras_n_o		=> sdram_ras_n_o,
		mem_cas_n_o		=> sdram_cas_n_o,
		mem_we_n_o		=> sdram_we_n_o,
		mem_udq_o		=> sdram_dqmh_o,
		mem_ldq_o		=> sdram_dqml_o,
		mem_ba_o		=> sdram_ba_o,
		mem_addr_o		=> sdram_addr_o,
		mem_data_io		=> sdram_data_io
	);

	-- Audio
	mixer: entity work.mixers
	port map (
		clock_audio_i	=> clock_master_s,
		volumes_i		=> volumes_s,
		beep_i			=> beep_s,
		ear_i			=> ear_s,
		audio_scc_i		=> audio_scc_s,
		audio_psg_i		=> audio_psg_s,
		opll_mo_i		=> opll_mo_s,
		opll_ro_i		=> opll_ro_s,
		audio_mix_l_o	=> audio_l_s,
		audio_mix_r_o	=> audio_r_s
	);

	-- MIST stuff
	userio: user_io
	generic map(
		STRLEN 			=> CONF_STR'length,
		PS2DIV			=> 750
	)
	port map(
		clk_sys				=> clock_master_s,
		clk_sd				=> clock_master_s,
		SPI_CLK				=> spi_sck_i,
		SPI_SS_IO			=> conf_data0_i,
		SPI_MOSI			=> spi_data_i,
		SPI_MISO			=> spi_data_o,
		conf_str			=> to_slv(CONF_STR),
		conf_addr			=> open,
		conf_chr			=> (others => '0'),
		joystick_0			=> open,
		joystick_1			=> open,
		joystick_2			=> open,
		joystick_3			=> open,
		joystick_4			=> open,
		joystick_analog_0	=> open,
		joystick_analog_1	=> open,
		status				=> status_s,
		switches			=> switches_s,
		buttons				=> buttons_s,
		scandoubler_disable	=> scandoubler_disable_s,
		ypbpr				=> ypbpr_s,
		no_csync			=> no_csync_s,
		core_mod			=> open,
		sd_lba				=> sd_lba_s,
		sd_rd				=> sd_rd_s,
		sd_wr				=> sd_wr_s,
		sd_ack				=> sd_ack_s,
		sd_ack_conf			=> sd_ack_conf_s,
		sd_ack_x			=> open,
		sd_conf				=> sd_conf_s,
		sd_sdhc				=> sd_sdhc_s,
		img_size			=> img_size_s,
		img_mounted			=> img_mounted_s,
		sd_buff_addr		=> sd_buff_addr_s,
		sd_dout				=> sd_dout_s,
		sd_din				=> sd_din_s,
		sd_dout_strobe		=> sd_dout_strobe_s,
		sd_din_strobe		=> sd_din_strobe_s,
		ps2_kbd_clk			=> ps2_clk_o_s,
		ps2_kbd_data		=> ps2_dat_o_s,
		ps2_kbd_clk_i		=> ps2_clk_i_s,
		ps2_kbd_data_i		=> ps2_dat_i_s,
		key_pressed			=> open,
		key_extended		=> open,
		key_code			=> open,
		key_strobe			=> open,
		ps2_mouse_clk		=> open,
		ps2_mouse_data		=> open,
		ps2_mouse_clk_i		=> '1',
		ps2_mouse_data_i	=> '1',
		mouse_x				=> open,
		mouse_y				=> open,
		mouse_z				=> open,
		mouse_flags			=> open,
		mouse_strobe		=> open,
		mouse_idx			=> open,
		i2c_start			=> open,
		i2c_read			=> open,
		i2c_addr			=> open,
		i2c_subaddr			=> open,
		i2c_dout			=> open,
		i2c_din				=> (others => '0'),
		i2c_end				=> '0',
		i2c_ack				=> '0'
	);

	sd0: sd_card
	port map (
		clk_sys				=> clock_master_s,
		sd_lba				=> sd_lba_s,
		sd_rd				=> sd_rd_s(0),
		sd_wr				=> sd_wr_s(0),
		sd_ack				=> sd_ack_s,
		sd_ack_conf			=> sd_ack_conf_s,
		sd_conf				=> sd_conf_s,
		sd_sdhc				=> sd_sdhc_s,
		img_mounted			=> img_mounted_s(0),
		img_size			=> img_size_s,
		sd_busy				=> sd_busy_s,
		sd_buff_dout		=> sd_dout_s,
		sd_buff_wr			=> sd_dout_strobe_s,
		sd_buff_din			=> sd_din_s,
		sd_buff_addr		=> sd_buff_addr_s,
		allow_sdhc			=> '1',
		sd_cs				=> sd_cs_n_s,
		sd_sck				=> sd_sclk_s,
		sd_sdi				=> sd_mosi_s,
		sd_sdo				=> sd_miso_s
	);	

	process (por_s, clock_master_s)
	begin
		if por_s = '1' then
			sd_block_q	<= '1';
		elsif rising_edge(clock_master_s) then
			if img_mounted_s(0) = '1' then
				sd_block_q <= '0';
			end if;
			sd_mosi_q <= sd_mosi_s;
		end if;
	end process;

--	osd0: osd
--	port map (
--		clk_sys     => clock_master_s,
--
--		SPI_SCK     => spi_sck_i,
--		SPI_SS3     => spi_ss3_i,
--		SPI_DI      => spi_data_i,
--
--		R_in        => "00" & rgb_r_s,
--		G_in        => rgb_r_s & "00",
--		B_in        => rgb_r_s & "00",
--		HSync       => rgb_hsync_n_s,
--		VSync       => rgb_vsync_n_s,
--
--		R_out       => osd_red_s,
--		G_out       => osd_green_s,
--		B_out       => osd_blue_s
--	);

	scanlines_s	<= "00" when scandoubler_disable_s = '1'	else status_s(4 downto 3);

	video: mist_video
	generic map (
		COLOR_DEPTH     	=> 4,
		OUT_COLOR_DEPTH		=> 6
	)
	port map (
		clk_sys     		=> clock_master_s,

		SPI_SCK     		=> spi_sck_i,
		SPI_SS3     		=> spi_ss3_i,
		SPI_DI      		=> spi_data_i,

		scanlines   		=> scanlines_s,
		ce_divider  		=> (others => '0'),
		scandoubler_disable => scandoubler_disable_s,
		ypbpr       		=> ypbpr_s,
		rotate      		=> (others => '0'),
		no_csync    		=> no_csync_s,
		blend       		=> '0',

		HBlank      		=> '0',
		VBlank      		=> '0',
		HSync       		=> rgb_hsync_n_s,
		VSync       		=> rgb_vsync_n_s,
		R           		=> rgb_r_s,
		G           		=> rgb_g_s,
		B           		=> rgb_b_s,

		VGA_HS      		=> vga_hs_n_o,
		VGA_VS      		=> vga_vs_n_o,
		VGA_HB      		=> open,
		VGA_VB      		=> open,
		VGA_DE      		=> open,
		VGA_R       		=> vga_r_o,
		VGA_G       		=> vga_g_o,
		VGA_B       		=> vga_b_o
	);


	-- Glue logic
	
	-- Resets
	por_s		<= '1'	when status_s(0) = '1' or pll_locked_s = '0' or soft_por_s = '1' or (img_mounted_s(0) = '1' and status_s(5) = '1')	else '0';
	reset_s		<= '1'	when status_s(1) = '1' or soft_rst_cnt_s = X"00" or por_s = '1' or buttons_s(1) = '1'		else '0';

	process(clock_master_s)
	begin
		if rising_edge(clock_master_s) then
			if reset_s = '1' then
				soft_rst_cnt_s	<= X"FF";
			elsif (soft_reset_k_s = '1' or soft_reset_s_s = '1') and soft_rst_cnt_s /= X"00" then
				soft_rst_cnt_s <= soft_rst_cnt_s - 1;
			end if;
		end if;
	end process;

	led_n_o	<= not sd_busy_s;
	
end architecture;
