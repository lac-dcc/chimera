library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
--use ieee.std_logic_unsigned.all;
-- para ZPUFLEX
--Library UNISIM;
--use UNISIM.vcomponents.all;

-- modulo de mandos de juegos ZXDOS de neuro y jepalza
entity menuOSD is
    port(
      clk_50      : in std_logic; -- menu osd 50mhz
		clk_sys		: in std_logic; -- lectura de discos en ram
		reset_n		: in std_logic; -- 0:reset
		-- conexion externa a PS2
      ps2_dat     : inout std_logic;
      ps2_clk     : inout std_logic;
		-- PS2 entradas/salidas a modulo principal
	   ps2k_clk_in  : inout std_logic;
		ps2k_clk_out : inout std_logic;
		ps2k_dat_in  : inout std_logic;
		ps2k_dat_out : inout std_logic;
		host_keyb	 : out std_logic; -- para no usar el teclado mientras estamos en OSD
		-- VGA desde control principal
		red_i   : in std_logic_vector(3 downto 0);
		green_i : in std_logic_vector(3 downto 0);
		blue_i  : in std_logic_vector(3 downto 0);
		-- sincronismos para el modulo OSD , solo entrada
		hsync_i : in std_logic;
		vsync_i : in std_logic;
		-- reset salida a principal
		reset_menu : out std_logic;
		-- opciones "color amarillo" y "arranque rapido"
		amarillo : out std_logic;
		rapido : out std_logic;
		mbc1 : out std_logic;
		--
		OSD_leyendo  : out std_logic; -- señal ROMLOAD:cuando esta ocupado leyendo, es 1
		ROM_leyendo  : out std_logic; -- señal START :a 1 si esta leyendo la ROM inicial
		AUX_leyendo  : out std_logic; -- señal SELECT:no sirve para nada, solo pruebas
--		MDV : out std_logic_vector(3 downto 0); -- 0=ROM, 1 a 15=MDV
		-- VGA hacia control principal
		red_o   : out std_logic_vector(3 downto 0);
		green_o : out std_logic_vector(3 downto 0);
		blue_o  : out std_logic_vector(3 downto 0);
		-- modulo SD externo
		sd_spi_clk  : out std_logic;
		sd_spi_cs_n : out std_logic;
		sd_spi_mosi : out std_logic;
		sd_spi_miso : in  std_logic;
		-- SRAM externa
		sram_addr  : out std_logic_vector(23 downto 0);
		sram_data  : inout std_logic_vector(15 downto 0);
		sram_we    : out std_logic
		);
end menuOSD;

architecture rtl of menuOSD is

   -- Control module
   signal osd_window, osd_pixel, scanlines : std_logic;

   --Host control signals, from the Control module
   signal host_reset_n, host_divert_sdcard, host_divert_keyboard : std_logic;
   signal host_loadrom : std_logic;
   signal host_bootdata : std_logic_vector(31 downto 0);
   signal host_bootdata_req : std_logic;
   signal host_bootdata_ack : std_logic;
   signal dipswitches : std_logic_vector(15 downto 0);
	signal cart_size : std_logic_vector(31 downto 0) := "00000000000000000000000000000000";

	signal dsk_addr : std_logic_vector(23 downto 0);
	signal dsk_data : std_logic_vector(15 downto 0);
	signal dsk_wr   : std_logic := '0';

 type boot_states is (inactivo, ramwait);
 signal boot_state : boot_states := inactivo;
 signal cart_data_wr_8bit   : std_logic_vector(15 downto 0);
 signal cart_addr_wr_8bit : std_logic_vector(23 downto 0) := "000000000000000000000000"; 
 signal cart_wr : std_logic := '0';
 signal cart_step : integer := 0;
  
begin

ps2k_dat_in <= ps2_dat;
ps2_dat <= '0' when ps2k_dat_out = '0' else 'Z';
ps2k_clk_in <= ps2_clk;
ps2_clk  <= '0' when ps2k_dat_out = '0' else 'Z';

ps2k_clk_out <= '1';
ps2k_dat_out <= '1';

-- control de teclado: fuera del OSD evita su uso
host_keyb <= host_divert_keyboard;

MyCtrlModule : entity work.CtrlModule
port map
(
		clk => clk_50,
		reset_n => '1',
		-- Video signals for OSD
		vga_hsync => hsync_i,
		vga_vsync => vsync_i,
		osd_window => osd_window,
		osd_pixel => osd_pixel,
		-- PS2 keyboard
		ps2k_clk_in => ps2k_clk_in,
		ps2k_dat_in => ps2k_dat_in,
		-- SD card signals
		spi_clk => sd_spi_clk,
		spi_mosi => sd_spi_mosi,
		spi_miso => sd_spi_miso,
		spi_cs => sd_spi_cs_n,
		-- DIP switches
		dipswitches => dipswitches,
		--ROM size
		size => cart_size,
		-- Control signals
		host_divert_keyboard => host_divert_keyboard,
		host_divert_sdcard => host_divert_sdcard,
		host_reset_n => host_reset_n,
		host_loadrom => host_loadrom,
		-- Boot data upload signals
		host_bootdata => host_bootdata,
		host_bootdata_req => host_bootdata_req,
		host_bootdata_ack => host_bootdata_ack
	);

scanlines <= dipswitches(1);
amarillo  <= dipswitches(2);
rapido    <= dipswitches(3);
mbc1      <= dipswitches(4);

reset_menu <= host_reset_n;
OSD_leyendo <= host_loadrom;
--AUX_leyendo <= host_select; -- por si acaso
ROM_leyendo <= dipswitches(0); --host_start;

overlay : entity work.OSD_Overlay
port map
(
		clk => clk_50,
		red_in => red_i,
		green_in => green_i,
		blue_in => blue_i,
		window_in => '1',
		osd_window_in => osd_window,
		osd_pixel_in => osd_pixel,
		hsync_in => hsync_i,
		red_out => red_o,
		green_out => green_o,
		blue_out => blue_o,
		window_out => open,
		scanline_ena => scanlines
	);

dsk_data  <= sram_data;         --when host_loadrom = '0' else "00000000"; 
sram_addr <= cart_addr_wr_8bit when host_loadrom = '1' else dsk_addr;
sram_data <= cart_data_wr_8bit when host_loadrom = '1' else (others => 'Z'); --when dsk_wr = '1' dsk_data else (others => 'Z'); --para la grabacion en disco en sram
sram_we   <= cart_wr           when host_loadrom = '1' else '0'; -- | dsk_wr; --(Para la grabacion del disco en sram

-- State machine to receive and stash boot data in SRAM
process(clk_sys, host_bootdata_req)
begin
	if rising_edge(clk_sys) then
		if host_loadrom='0' then --Mientras no haya senal de carga se resetean las variables a 0;
			cart_addr_wr_8bit<= "000000000000000000000000"; -- "0000000000";
			cart_wr<='0';
			host_bootdata_ack<='0';
			boot_state<=inactivo;
			cart_step <= 0;
		else
			host_bootdata_ack<='0';
			case boot_state is
				when inactivo =>
					if host_bootdata_req='1' then
					-- adaptado a salida de 16bits, en lugar de 8
						if    cart_step = 0 then cart_data_wr_8bit<=host_bootdata(31 downto 16); cart_step <= 1; 
--						elsif cart_step = 1 then cart_data_wr_8bit<=host_bootdata(23 downto 16); cart_step <= cart_step + 1; 
--						elsif cart_step = 2 then cart_data_wr_8bit<=host_bootdata(15 downto  8); cart_step <= cart_step + 1; 
						elsif cart_step = 1 then cart_data_wr_8bit<=host_bootdata(15  downto 0); cart_step <= 0; host_bootdata_ack<='1'; end if;
						cart_wr<='1';
						boot_state<=ramwait;
					end if;
				when ramwait =>
						cart_addr_wr_8bit<=std_logic_vector((unsigned(cart_addr_wr_8bit)+1));
						cart_wr<='0';
						boot_state<=inactivo;
			end case;
		end if;
	end if;
end process;

end;