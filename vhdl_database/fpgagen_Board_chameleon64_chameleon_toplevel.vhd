-- -----------------------------------------------------------------------
--
-- Turbo Chameleon
--
-- Toplevel file for Turbo Chameleon 64
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;


-- -----------------------------------------------------------------------

entity chameleon_toplevel is
	generic (
		resetCycles: integer := 131071
	);
	port (
-- Clocks
		clk8 : in std_logic;
		phi2_n : in std_logic;
		dotclock_n : in std_logic;

-- Bus
		romlh_n : in std_logic;
		ioef_n : in std_logic;

-- Buttons
		freeze_n : in std_logic;

-- MMC/SPI
		spi_miso : in std_logic;
		mmc_cd_n : in std_logic;
		mmc_wp : in std_logic;

-- MUX CPLD
		mux_clk : out std_logic;
		mux : out unsigned(3 downto 0);
		mux_d : out unsigned(3 downto 0);
		mux_q : in unsigned(3 downto 0);

-- USART
		usart_tx : in std_logic;
		usart_clk : in std_logic;
		usart_rts : in std_logic;
		usart_cts : in std_logic;

-- SDRam
		sdram_clk : out std_logic;
		sd_data : inout std_logic_vector(15 downto 0);
		sd_addr : out std_logic_vector(12 downto 0);
		sd_we_n : out std_logic;
		sd_ras_n : out std_logic;
		sd_cas_n : out std_logic;
		sd_ba_0 : out std_logic;
		sd_ba_1 : out std_logic;
		sd_ldqm : out std_logic;
		sd_udqm : out std_logic;

-- Video
		red : out unsigned(4 downto 0);
		grn : out unsigned(4 downto 0);
		blu : out unsigned(4 downto 0);
		nHSync : out std_logic;
		nVSync : out std_logic;

-- Audio
		sigmaL : out std_logic;
		sigmaR : out std_logic
	);
end entity;

-- -----------------------------------------------------------------------

architecture rtl of chameleon_toplevel is
	
-- System clocks

	signal reset_button_n : std_logic;
	signal reset : std_logic;
	signal fastclk : std_logic;
	signal clk54m      : std_logic;
	signal memclk      : std_logic;
	signal pll_locked : std_logic;
	
-- Global signals
	signal n_reset : std_logic;
	
-- MUX
	signal mux_clk_reg : std_logic := '0';
	signal mux_reg : unsigned(3 downto 0) := (others => '1');
	signal mux_d_reg : unsigned(3 downto 0) := (others => '1');
	signal mux_d_regd : unsigned(3 downto 0) := (others => '1');
	signal mux_regd : unsigned(3 downto 0) := (others => '1');

-- LEDs
	signal led_green : std_logic;
	signal led_red : std_logic;

-- PS/2 Keyboard
	signal ps2_keyboard_clk_in : std_logic;
	signal ps2_keyboard_dat_in : std_logic;
	signal ps2_keyboard_clk_out : std_logic;
	signal ps2_keyboard_dat_out : std_logic;

-- PS/2 Mouse
	signal ps2_mouse_clk_in: std_logic;
	signal ps2_mouse_dat_in: std_logic;
	signal ps2_mouse_clk_out: std_logic;
	signal ps2_mouse_dat_out: std_logic;

-- Video
	signal vga_r: std_logic_vector(7 downto 0);
	signal vga_g: std_logic_vector(7 downto 0);
	signal vga_b: std_logic_vector(7 downto 0);
	signal vga_window : std_logic;
	signal vga_hsync : std_logic;
	signal vga_vsync : std_logic;
	
-- SD card
	signal spi_mosi : std_logic;
	signal spi_cs : std_logic;
	signal spi_clk : std_logic;
	
-- RS232 serial
	signal rs232_rxd : std_logic;
	signal rs232_txd : std_logic;

-- Sound
	signal audio_l : std_logic_vector(15 downto 0);
	signal audio_r : std_logic_vector(15 downto 0);

-- IO
	signal ena_1mhz : std_logic;
	signal button_reset_n : std_logic;

	signal no_clock : std_logic;
	signal docking_station : std_logic;
	signal c64_keys : unsigned(63 downto 0);
	signal c64_restore_key_n : std_logic;
	signal c64_nmi_n : std_logic;
	signal c64_joy1 : unsigned(5 downto 0);
	signal c64_joy2 : unsigned(5 downto 0);
	signal joystick3 : unsigned(5 downto 0);
	signal joystick4 : unsigned(5 downto 0);
	signal cdtv_joy1 : unsigned(5 downto 0);
	signal cdtv_joy2 : unsigned(5 downto 0);
	signal gp1_run : std_logic;
	signal gp1_select : std_logic;
	signal joy1 : unsigned(7 downto 0);
	signal joy2 : unsigned(7 downto 0);
	signal joy3 : unsigned(7 downto 0);
	signal joy4 : unsigned(7 downto 0);
	signal usart_rx : std_logic:='1';
	signal ir : std_logic;

	-- Sigma Delta audio
	COMPONENT hybrid_pwm_sd
	PORT
	(
		clk	:	IN STD_LOGIC;
		n_reset	:	IN STD_LOGIC;
		din	:	IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		dout	:	OUT STD_LOGIC
	);
	END COMPONENT;

	COMPONENT video_vga_dither
	GENERIC ( outbits : INTEGER := 4 );
	PORT
	(
		clk	:	IN STD_LOGIC;
		hsync	:	IN STD_LOGIC;
		vsync	:	IN STD_LOGIC;
		vid_ena	:	IN STD_LOGIC;
		iRed	:	IN UNSIGNED(7 DOWNTO 0);
		iGreen	:	IN UNSIGNED(7 DOWNTO 0);
		iBlue	:	IN UNSIGNED(7 DOWNTO 0);
		oRed	:	OUT UNSIGNED(outbits-1 DOWNTO 0);
		oGreen	:	OUT UNSIGNED(outbits-1 DOWNTO 0);
		oBlue	:	OUT UNSIGNED(outbits-1 DOWNTO 0)
	);
	END COMPONENT;
	
begin

	
-- -----------------------------------------------------------------------
-- Clocks and PLL
-- -----------------------------------------------------------------------


my1mhz : entity work.chameleon_1mhz
	generic map (
		-- Timer calibration. Clock speed in Mhz.
		clk_ticks_per_usec => 126
	)
	port map(
		clk => memclk,
		ena_1mhz => ena_1mhz
	);

myReset : entity work.gen_reset
	generic map (
		resetCycles => 131071
	)
	port map (
		clk => memclk,
		enable => '1',
		button => not (button_reset_n and pll_locked),
		nreset => n_reset,
		reset => reset
	);
	
	myIO : entity work.chameleon_io
		generic map (
			enable_docking_station => true,
			enable_c64_joykeyb => true,
			enable_c64_4player => true,
			enable_raw_spi => true,
			enable_iec_access =>true
		)
		port map (
		-- Clocks
			clk => memclk,
			clk_mux => memclk,
			ena_1mhz => ena_1mhz,
			reset => reset,
			
			no_clock => no_clock,
			docking_station => docking_station,
			
		-- Chameleon FPGA pins
			-- C64 Clocks
			phi2_n => phi2_n,
			dotclock_n => dotclock_n, 
			-- C64 cartridge control lines
			io_ef_n => ioef_n,
			rom_lh_n => romlh_n,
			-- SPI bus
			spi_miso => spi_miso,
			-- CPLD multiplexer
			mux_clk => mux_clk,
			mux => mux,
			mux_d => mux_d,
			mux_q => mux_q,
			
			to_usb_rx => usart_rx,

		-- SPI raw signals (enable_raw_spi must be set to true)
			mmc_cs_n => spi_cs,
			spi_raw_clk => spi_clk,
			spi_raw_mosi => spi_mosi,
--			spi_raw_ack => spi_raw_ack,

		-- LEDs
			led_green => '1',
			led_red => '1',
			ir => ir,
		
		-- PS/2 Keyboard
			ps2_keyboard_clk_out => ps2_keyboard_clk_out,
			ps2_keyboard_dat_out => ps2_keyboard_dat_out,
			ps2_keyboard_clk_in => ps2_keyboard_clk_in,
			ps2_keyboard_dat_in => ps2_keyboard_dat_in,
	
		-- PS/2 Mouse
			ps2_mouse_clk_out => ps2_mouse_clk_out,
			ps2_mouse_dat_out => ps2_mouse_dat_out,
			ps2_mouse_clk_in => ps2_mouse_clk_in,
			ps2_mouse_dat_in => ps2_mouse_dat_in,

		-- Buttons
			button_reset_n => button_reset_n,

		-- Joysticks
			joystick1 => c64_joy1,
			joystick2 => c64_joy2,
			joystick3 => joystick3, 
			joystick4 => joystick4,

		-- Keyboards
			keys => c64_keys,
			restore_key_n => c64_restore_key_n,
			c64_nmi_n => c64_nmi_n,

--
--			iec_clk_out : in std_logic := '1';
--			iec_dat_out : in std_logic := '1';
			iec_atn_out => '1', -- rs232_txd,
--			iec_srq_out : in std_logic := '1';
			iec_clk_in => rs232_rxd
--			iec_dat_in : out std_logic;
--			iec_atn_in : out std_logic;
--			iec_srq_in : out std_logic
	
		);
		
cdtv_remote : entity work.chameleon_cdtv_remote
	port map(
		clk => memclk,
		ena_1mhz => ena_1mhz,
		ir => ir,
		
--		trigger : out std_logic;
--
--		key_1 : out std_logic;
--		key_2 : out std_logic;
--		key_3 : out std_logic;
--		key_4 : out std_logic;
--		key_5 : out std_logic;
--		key_6 : out std_logic;
--		key_7 : out std_logic;
--		key_8 : out std_logic;
--		key_9 : out std_logic;
--		key_0 : out std_logic;
--		key_escape : out std_logic;
--		key_enter : out std_logic;
--		key_genlock : out std_logic;
--		key_cdtv : out std_logic;
--		key_power : out std_logic;
--		key_rew : out std_logic;
		key_play => gp1_run,
--		key_ff : out std_logic;
		key_stop => gp1_select,
--		key_vol_up : out std_logic;
--		key_vol_dn : out std_logic;
		joystick_a => cdtv_joy1,
		joystick_b => cdtv_joy2
		
--		debug_code : out unsigned(11 downto 0)
	);

joy1<=not gp1_run & not gp1_select & (c64_joy1 and cdtv_joy1);
joy2<="11" & (c64_joy2 and cdtv_joy2);
joy3<="11" & joystick3;
joy4<="11" & joystick4;
	

  U00 : entity work.pll
    port map(
      inclk0 => clk8,       -- 50 MHz external
      c0     => clk54m,	-- 54MHz internal
		c1 	=> open,
      c2     => memclk, -- 108MHz
      c3     => sdram_clk, -- 108MHz
      locked => pll_locked
    );

--sd_addr(12)<='0';
	 
virtualtoplevel : entity work.Virtual_Toplevel
	port map(
		reset => n_reset,
		MCLK => clk54m,
		SDR_CLK => memclk,

    -- SDRAM DE1 ports
--	 pMemClk => DRAM_CLK,
--    DRAM_CKE => SDRAM_CKE,
--    DRAM_CS_N => SDRAM_nCS,
    DRAM_RAS_N => sd_ras_n,
    DRAM_CAS_N => sd_cas_n,
    DRAM_WE_N => sd_we_n,
    DRAM_UDQM => sd_udqm,
    DRAM_LDQM => sd_ldqm,
    DRAM_BA_1 => sd_ba_1,
    DRAM_BA_0 => sd_ba_0,
    DRAM_ADDR => sd_addr,
    DRAM_DQ => sd_data,

    -- PS/2 keyboard ports
	 ps2k_clk_out => ps2_keyboard_clk_out,
	 ps2k_dat_out => ps2_keyboard_dat_out,
	 ps2k_clk_in => ps2_keyboard_clk_in,
	 ps2k_dat_in => ps2_keyboard_dat_in,
 
--    -- Joystick ports (Port_A, Port_B)
	joya => std_logic_vector(joy1),
	joyb => std_logic_vector(joy2),
--	joyc => std_logic_vector(joy3),
--	joyd => std_logic_vector(joy4),

    -- SD/MMC slot ports
	spi_clk => spi_clk,
	spi_mosi => spi_mosi,
	spi_cs => spi_cs,
	spi_miso => spi_miso,

	-- Video, Audio/CMT ports
    unsigned(VGA_R) => vga_r,
    unsigned(VGA_G) => vga_g,
    unsigned(VGA_B) => vga_b,

    VGA_HS => vga_hsync,
    VGA_VS => vga_vsync,

	 DAC_LDATA => audio_l,
	 DAC_RDATA => audio_r,
	 
	 RS232_RXD => rs232_rxd,
	 RS232_TXD => rs232_txd
);

	
-- Dither the video down to 5 bits per gun.
	vga_window<='1';
	nHsync<= not vga_hsync;
	nVsync<= not vga_vsync;	

	mydither : component video_vga_dither
		generic map(
			outbits => 5
		)
		port map(
			clk=>memclk,
			hsync=>vga_hsync,
			vsync=>vga_vsync,
			vid_ena=>vga_window,
			iRed => unsigned(vga_r),
			iGreen => unsigned(vga_g),
			iBlue => unsigned(vga_b),
			oRed => red,
			oGreen => grn,
			oBlue => blu
		);
	
--leftsd: component hybrid_pwm_sd
--	port map
--	(
--		clk => memclk,
--		n_reset => n_reset,
--		din(15) => not audio_l(15),
--		din(14 downto 0) => std_logic_vector(audio_l(14 downto 0)),
--		dout => sigmaL
--	);
--	
--rightsd: component hybrid_pwm_sd
--	port map
--	(
--		clk => memclk,
--		n_reset => n_reset,
--		din(15) => not audio_r(15),
--		din(14 downto 0) => std_logic_vector(audio_r(14 downto 0)),
--		dout => sigmaR
--	);
--

end architecture;
