library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;
 
entity MIST_Toplevel is
	port
	(
		CLOCK_27		:	 in std_logic_vector(1 downto 0);
		
		LED			: 	out std_logic;

		UART_TX		:	 out STD_LOGIC;
		UART_RX		:	 in STD_LOGIC;

		SDRAM_DQ		:	 inout std_logic_vector(15 downto 0);
		SDRAM_A	:	 out std_logic_vector(12 downto 0);
		SDRAM_DQMH	:	 out STD_LOGIC;
		SDRAM_DQML	:	 out STD_LOGIC;
		SDRAM_nWE	:	 out STD_LOGIC;
		SDRAM_nCAS	:	 out STD_LOGIC;
		SDRAM_nRAS	:	 out STD_LOGIC;
		SDRAM_nCS	:	 out STD_LOGIC;
		SDRAM_BA		:	 out std_logic_vector(1 downto 0);
		SDRAM_CLK	:	 out STD_LOGIC;
		SDRAM_CKE	:	 out STD_LOGIC;

		SPI_DO	: inout std_logic;
		SPI_DI	: in std_logic;
		SPI_SCK		:	 in STD_LOGIC;
		SPI_SS2		:	 in STD_LOGIC; -- FPGA
		SPI_SS3		:	 in STD_LOGIC; -- OSD
		SPI_SS4		:	 in STD_LOGIC; -- "sniff" mode
		CONF_DATA0  : in std_logic; -- SPI_SS for user_io

		VGA_HS		:	buffer STD_LOGIC;
		VGA_VS		:	buffer STD_LOGIC;
		VGA_R		:	 out unsigned(5 downto 0);
		VGA_G		:	 out unsigned(5 downto 0);
		VGA_B		:	 out unsigned(5 downto 0);

		AUDIO_L : out std_logic;
		AUDIO_R : out std_logic
	);
END entity;

architecture rtl of MIST_Toplevel is

signal reset : std_logic;
signal reset_d : std_logic;
signal pll_locked : std_logic;
signal MCLK      : std_logic;
signal memclk      : std_logic;

signal audiol : std_logic_vector(15 downto 0);
signal audior : std_logic_vector(15 downto 0);

signal vga_tred : unsigned(7 downto 0);
signal vga_tgreen : unsigned(7 downto 0);
signal vga_tblue : unsigned(7 downto 0);
signal vga_ths		: std_logic;
signal vga_tvs		: std_logic;
signal vga_window : std_logic;
signal vid_15khz	: std_logic;

-- user_io
signal buttons: std_logic_vector(1 downto 0);
signal status:  std_logic_vector(7 downto 0);
signal joy_0: std_logic_vector(7 downto 0);
signal joy_1: std_logic_vector(7 downto 0);
signal joy_2: std_logic_vector(7 downto 0);
signal joy_3: std_logic_vector(7 downto 0);
signal joy_4: std_logic_vector(7 downto 0);
signal joy_ana_0: std_logic_vector(15 downto 0);
signal joy_ana_1: std_logic_vector(15 downto 0);
signal txd:     std_logic;
signal par_out_data: std_logic_vector(7 downto 0);
signal par_out_strobe: std_logic;

-- signals to connect sd card emulation with io controller
signal sd_lba:  std_logic_vector(31 downto 0);
signal sd_rd:   std_logic;
signal sd_wr:   std_logic;
signal sd_ack:  std_logic;
signal sd_conf: std_logic;
signal sd_sdhc: std_logic;
signal sd_allow_sdhc: std_logic;
signal sd_allow_sdhcD: std_logic;
signal sd_allow_sdhcD2: std_logic;
signal sd_allow_sdhc_changed: std_logic;
-- data from io controller to sd card emulation
signal sd_data_in: std_logic_vector(7 downto 0);
signal sd_data_in_strobe:  std_logic;
signal sd_data_out: std_logic_vector(7 downto 0);
signal sd_data_out_strobe:  std_logic;

-- sd card emulation
signal sd_cs:	std_logic;
signal sd_sck:	std_logic;
signal sd_sdi:	std_logic;
signal sd_sdo:	std_logic;

-- PS/2
signal ps2_clk : std_logic;
signal ps2counter : unsigned(10 downto 0);

-- PS/2 Keyboard
signal ps2_keyboard_clk_in : std_logic;
signal ps2_keyboard_dat_in : std_logic;
signal ps2_keyboard_clk_mix : std_logic;
signal ps2_keyboard_clk_out : std_logic;
signal ps2_keyboard_dat_out : std_logic;

-- PS/2 Mouse
signal ps2_mouse_clk_in : std_logic;
signal ps2_mouse_dat_in : std_logic;
signal ps2_mouse_clk_mix : std_logic;
signal ps2_mouse_clk_out : std_logic;
signal ps2_mouse_dat_out : std_logic;

-- spi clock recovery
signal spirecoveryclock : std_logic;  -- High frequency clock
signal uc_sysclk : std_logic;
signal spisck_d : std_logic;
signal spirec : std_logic;
signal spirecoveredclock : std_logic;
signal pll2_locked : std_logic;

-- Fast filter for SPI clock conditioning
COMPONENT fastfilter
	PORT
	(
		recoveryclock	: IN STD_LOGIC;
		d	:	IN STD_LOGIC;
		q	:	out STD_LOGIC
	);
END COMPONENT;

-- Sigma Delta audio
COMPONENT hybrid_pwm_sd
	PORT
	(
		clk		:	 IN STD_LOGIC;
		n_reset		:	 IN STD_LOGIC;
		din		:	 IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		dout		:	 OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT video_vga_dither
	GENERIC ( outbits : INTEGER := 4 );
	PORT
	(
		clk		:	 IN STD_LOGIC;
		hsync		:	 IN STD_LOGIC;
		vsync		:	 IN STD_LOGIC;
		vid_ena		:	 IN STD_LOGIC;
		iRed		:	 IN UNSIGNED(7 DOWNTO 0);
		iGreen		:	 IN UNSIGNED(7 DOWNTO 0);
		iBlue		:	 IN UNSIGNED(7 DOWNTO 0);
		oRed		:	 OUT UNSIGNED(outbits-1 DOWNTO 0);
		oGreen		:	 OUT UNSIGNED(outbits-1 DOWNTO 0);
		oBlue		:	 OUT UNSIGNED(outbits-1 DOWNTO 0)
	);
END COMPONENT;
  

component user_io 
	generic ( STRLEN : integer := 0 );
   port (
			  SPI_CLK, SPI_SS_IO, SPI_MOSI :in std_logic;
           SPI_MISO : out std_logic;
           conf_str : in std_logic_vector(8*STRLEN-1 downto 0);
           joystick_0 : out std_logic_vector(7 downto 0);
           joystick_1 : out std_logic_vector(7 downto 0);
           joystick_2 : out std_logic_vector(7 downto 0);
           joystick_3 : out std_logic_vector(7 downto 0);
           joystick_4 : out std_logic_vector(7 downto 0);
           joystick_analog_0 : out std_logic_vector(15 downto 0);
           joystick_analog_1 : out std_logic_vector(15 downto 0);
           status: out std_logic_vector(7 downto 0);
           switches : out std_logic_vector(1 downto 0);
           buttons : out std_logic_vector(1 downto 0);
			  sd_lba : in std_logic_vector(31 downto 0);
			  sd_rd : in std_logic;
			  sd_wr : in std_logic;
			  sd_ack : out std_logic;
			  sd_conf : in std_logic;
			  sd_sdhc : in std_logic;
			  sd_dout : out std_logic_vector(7 downto 0);
			  sd_dout_strobe : out std_logic;
			  sd_din : in std_logic_vector(7 downto 0);
			  sd_din_strobe : out std_logic;
           ps2_clk : in std_logic;
           ps2_kbd_clk : out std_logic;
           ps2_kbd_data : out std_logic;
           ps2_mouse_clk : out std_logic;
           ps2_mouse_data : out std_logic;
			  serial_data : in std_logic_vector(7 downto 0);
           serial_strobe : in std_logic
      );
  end component user_io;
  
component mist_console
	generic ( CLKFREQ : integer := 100 );
   port (  clk 	:	in std_logic;
           n_reset:	in std_logic;
           ser_in :	in std_logic;
           par_out_data :	out std_logic_vector(7 downto 0);
           par_out_strobe :	out std_logic
  );
  end component mist_console;

component sd_card
   port (
			  spiclk : in std_logic;
			  fpga_sysclk : in std_logic;
			  uc_sysclk : in std_logic;
			  io_lba 	: out std_logic_vector(31 downto 0);
			  io_rd  	: out std_logic;
			  io_wr  	: out std_logic;
			  io_ack 	: in std_logic;
			  io_sdhc 	: out std_logic;
			  io_conf 	: out std_logic;
			  io_din 	: in std_logic_vector(7 downto 0);
			  io_din_strobe : in std_logic;
			  io_dout 	: out std_logic_vector(7 downto 0);
			  io_dout_strobe : in std_logic;

			  allow_sdhc : in std_logic;
			  
           sd_cs 		:	in std_logic;
           sd_sck 	:	in std_logic;
           sd_sdi 	:	in std_logic;
           sd_sdo 	:	out std_logic
  );
  end component sd_card;

begin


myrecoveryclock : entity work.SPIRecoveryClock
port map
(
	inclk0 => CLOCK_27(0),
	c0 => spirecoveryclock,
	c1 => uc_sysclk,
	locked => pll2_locked
);

myclockfilter : component fastfilter
port map
(
	recoveryclock => spirecoveryclock,
	d => SPI_SCK,
	q => spirecoveredclock
);



  U00 : entity work.pll
    port map(
      inclk0 => CLOCK_27(0),	-- 27 MHz external
      c0     => MCLK,			-- 54 MHz internal
		c1     => open,
      c2     => memclk,			-- 108 Mhz
      c3     => SDRAM_CLK,		-- 108 Mhz external
		locked => pll_locked
    );

--SDRAM_A(12)<='0';

-- reset from IO controller
-- status bit 0 is always triggered by the i ocontroller on its own reset
-- button 1 is the core specfic button in the mists front
-- reset <= '0' when status(0)='1' or buttons(1)='1' or pll_locked='0' else '1';

process(MCLK)
begin
	if rising_edge(MCLK) then
		reset_d<=not (status(0) or status(2) or buttons(1)) and pll_locked and pll2_locked;
		reset<=reset_d;
	end if;
end process;

-- MCLK?
process(MCLK)
begin
--	ps2_keyboard_clk_mix <= ps2_keyboard_clk_in and (ps2_clk or ps2_keyboard_dat_out);
	ps2_keyboard_clk_mix <= ps2_keyboard_clk_in; -- and (ps2_clk or ps2_keyboard_dat_out);
	ps2_mouse_clk_mix <= ps2_mouse_clk_in; -- and (ps2_clk or ps2_mouse_dat_out);
	if rising_edge(MCLK) then
		ps2counter<=ps2counter+1;
		if ps2counter=1200 then
			ps2_clk<=not ps2_clk;
			ps2counter<=(others => '0');
		end if;
	end if;
end process;

--SDRAM_A(12)<='0';
virtualtoplevel : entity work.Virtual_Toplevel
	port map(
		reset => reset,
		MCLK => MCLK,
		SDR_CLK => memclk,

    -- SDRAM DE1 ports
--	 pMemClk => DRAM_CLK,
    DRAM_CKE => SDRAM_CKE,
    DRAM_CS_N => SDRAM_nCS,
    DRAM_RAS_N => SDRAM_nRAS,
    DRAM_CAS_N => SDRAM_nCAS,
    DRAM_WE_N => SDRAM_nWE,
    DRAM_UDQM => SDRAM_DQMH,
    DRAM_LDQM => SDRAM_DQML,
    DRAM_BA_1 => SDRAM_BA(1),
    DRAM_BA_0 => SDRAM_BA(0),
    DRAM_ADDR => SDRAM_A,
    DRAM_DQ => SDRAM_DQ,

    -- PS/2 keyboard ports
	 ps2k_clk_out => ps2_keyboard_clk_out,
	 ps2k_dat_out => ps2_keyboard_dat_out,
	 ps2k_clk_in => ps2_keyboard_clk_in,
	 ps2k_dat_in => ps2_keyboard_dat_in,
 
--    -- Joystick ports (Port_A, Port_B)
	joya => joy_1,
	joyb => joy_0,

    -- SD/MMC slot ports
	spi_clk => sd_sck,
	spi_mosi => sd_sdi,
	spi_cs => sd_cs,
	spi_miso => sd_sdo,

	-- Video, Audio/CMT ports
    unsigned(VGA_R) => vga_tred,
    unsigned(VGA_G) => vga_tgreen,
    unsigned(VGA_B) => vga_tblue,

    VGA_HS => vga_ths,
    VGA_VS => vga_tvs,
	 VID_15KHZ => vid_15khz,
	 
	 LED => LED,

	 DAC_LDATA => audiol,
	 DAC_RDATA => audior,
	 
	 RS232_RXD => UART_RX,
	 RS232_TXD => UART_TX
);


-- UART_TX <='1';

mist_console_d: component mist_console
	generic map
	( CLKFREQ => 108)
	port map
	(
		clk => memclk,
		n_reset => reset,
		ser_in => txd,
		par_out_data => par_out_data,
		par_out_strobe => par_out_strobe
	);

sd_card_d: component sd_card
	port map
	(
		spiclk => spirecoveredclock,
		uc_sysclk => uc_sysclk,
		fpga_sysclk => memclk,
 		-- connection to io controller
 		io_lba => sd_lba,
 		io_rd  => sd_rd,
		io_wr  => sd_wr,
 		io_ack => sd_ack,
		io_conf => sd_conf,
		io_sdhc => sd_sdhc,
 		io_din => sd_data_in,
 		io_din_strobe => sd_data_in_strobe,
		io_dout => sd_data_out,
		io_dout_strobe => sd_data_out_strobe,
 
		allow_sdhc  => '1',
		
 		-- connection to host
 		sd_cs  => sd_cs,
 		sd_sck => sd_sck,
		sd_sdi => sd_sdi,
		sd_sdo => sd_sdo		
	);
	
user_io_d : user_io
    generic map (STRLEN => 1)
    port map (
      SPI_CLK => spirecoveredclock,
      SPI_SS_IO => CONF_DATA0,
      SPI_MISO => SPI_DO,
      SPI_MOSI => SPI_DI,
      conf_str => "00000000",   -- no config string -> no osd
      status => status,
		
 		-- connection to io controller
		sd_lba  => sd_lba,
		sd_rd   => sd_rd,
		sd_wr   => sd_wr,
		sd_ack  => sd_ack,
		sd_sdhc => sd_sdhc,
		sd_conf => sd_conf,
 		sd_dout => sd_data_in,
 		sd_dout_strobe => sd_data_in_strobe,
		sd_din => sd_data_out,
		sd_din_strobe => sd_data_out_strobe,

      joystick_0 => joy_0,
      joystick_1 => joy_1,
      joystick_2 => joy_2,
      joystick_3 => joy_3,
      joystick_4 => joy_4,
      joystick_analog_0 => joy_ana_0,
      joystick_analog_1 => joy_ana_1,
--      switches => switches,
       BUTTONS => buttons,
		ps2_clk => ps2_clk,
      ps2_kbd_clk => ps2_keyboard_clk_in,
      ps2_kbd_data => ps2_keyboard_dat_in,
      ps2_mouse_clk => ps2_mouse_clk_in,
      ps2_mouse_data => ps2_mouse_dat_in,
 		serial_data => par_out_data,
 		serial_strobe => par_out_strobe
 );

vga_window<='1';
mydither : component video_vga_dither
	generic map (
		outbits => 6
	)
	port map (
		clk => memclk,
		hsync => vga_ths,
		vsync => vga_tvs,
		vid_ena => vga_window,
		iRed => vga_tred,
		iGreen => vga_tgreen,
		iBlue => vga_tblue,
		std_logic_vector(oRed) => VGA_R,
		std_logic_vector(oGreen) => VGA_G,
		std_logic_vector(oBlue) => VGA_B
	);
 
 -- If 15kHz Video - composite sync to VGA_HS and VGA_VS high for MiST RGB cable
VGA_HS <= not (vga_ths xor vga_tvs) when vid_15khz='1' else vga_ths;
VGA_VS <= '1' when vid_15khz='1' else vga_tvs;

-- Do we have audio?  If so, instantiate a two DAC channels.
leftsd: component hybrid_pwm_sd
	port map
	(
		clk => MCLK,
		n_reset => reset,
		din => not audiol(15) & std_logic_vector(audiol(14 downto 0)),
		dout => AUDIO_L
	);
	
rightsd: component hybrid_pwm_sd
	port map
	(
		clk => MCLK,
		n_reset => reset,
		din => not audior(15) & std_logic_vector(audior(14 downto 0)),
		dout => AUDIO_R
	);

end architecture;
