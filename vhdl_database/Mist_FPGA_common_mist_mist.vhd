-- user_io
-- Interface to the MiST IO Controller

-- mist_video
-- A video pipeline for MiST. Just insert between the core video output and the VGA pins
-- Provides an optional scandoubler, a rotateable OSD and (optional) RGb->YPbPr conversion

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package mist is

component user_io
generic(
	STRLEN : integer := 0;
	PS2DIV : integer := 100;
	ROM_DIRECT_UPLOAD : boolean := false;
	SD_IMAGES: integer := 2;
	PS2BIDIR : boolean := false;
	FEATURES: std_logic_vector(31 downto 0) := (others=>'0')
);
port (
	clk_sys           : in std_logic;
	clk_sd            : in std_logic := '0';
	SPI_CLK, SPI_SS_IO, SPI_MOSI :in std_logic;
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

	sd_lba            : in  std_logic_vector(31 downto 0) := (others => '0');
	sd_rd             : in  std_logic_vector(SD_IMAGES-1 downto 0) := (others => '0');
	sd_wr             : in  std_logic_vector(SD_IMAGES-1 downto 0) := (others => '0');
	sd_ack            : out std_logic;
	sd_ack_conf       : out std_logic;
	sd_ack_x          : out std_logic_vector(SD_IMAGES-1 downto 0);
	sd_conf           : in  std_logic := '0';
	sd_sdhc           : in  std_logic := '1';
	img_size          : out std_logic_vector(63 downto 0);
	img_mounted       : out std_logic_vector(SD_IMAGES-1 downto 0);

	sd_buff_addr      : out std_logic_vector(8 downto 0);
	sd_dout           : out std_logic_vector(7 downto 0);
	sd_din            : in  std_logic_vector(7 downto 0) := (others => '0');
	sd_dout_strobe    : out std_logic;
	sd_din_strobe     : out std_logic;

	ps2_kbd_clk       : out std_logic;
	ps2_kbd_data      : out std_logic;
	ps2_kbd_clk_i     : in  std_logic := '1';
	ps2_kbd_data_i    : in  std_logic := '1';
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
	mouse_idx         : out std_logic
);
end component user_io;

component mist_video
generic (
	OSD_COLOR    : std_logic_vector(2 downto 0) := "110";
	OSD_X_OFFSET : std_logic_vector(9 downto 0) := (others => '0');
	OSD_Y_OFFSET : std_logic_vector(9 downto 0) := (others => '0');
	SD_HCNT_WIDTH: integer := 9;
	COLOR_DEPTH  : integer := 6;
	OSD_AUTO_CE  : boolean := true;
	SYNC_AND     : boolean := false;
	USE_BLANKS   : boolean := false
);
port (
	clk_sys     : in std_logic;

	SPI_SCK     : in std_logic;
	SPI_SS3     : in std_logic;
	SPI_DI      : in std_logic;

	scanlines   : in std_logic_vector(1 downto 0);
	ce_divider  : in std_logic_vector(2 downto 0) := "000";
	scandoubler_disable : in std_logic;
	ypbpr       : in std_logic;
	rotate      : in std_logic_vector(1 downto 0);
	no_csync    : in std_logic := '0';
	blend       : in std_logic := '0';

	HBlank      : in std_logic := '0';
	VBlank      : in std_logic := '0';
	HSync       : in std_logic;
	VSync       : in std_logic;
	R           : in std_logic_vector(COLOR_DEPTH-1 downto 0);
	G           : in std_logic_vector(COLOR_DEPTH-1 downto 0);
	B           : in std_logic_vector(COLOR_DEPTH-1 downto 0);

	VGA_HS      : out std_logic;
	VGA_VS      : out std_logic;
	VGA_R       : out std_logic_vector(5 downto 0);
	VGA_G       : out std_logic_vector(5 downto 0);
	VGA_B       : out std_logic_vector(5 downto 0)
);
end component mist_video;

end package;
