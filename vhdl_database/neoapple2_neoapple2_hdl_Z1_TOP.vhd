-------------------------------------------------------------------------------
--
-- Z1 top-level module for the Apple ][
--
-- Feng Zhou, 2021-6
--
-- Based on DE2 top-level by Stephen A. Edwards, Columbia University, sedwards@cs.columbia.edu
--
-- From an original by Terasic Technology, Inc.
-- (DE2_TOP.v, part of the DE2 system board CD supplied by Altera)
--
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hex7seg is 
  port (
    input  : in  unsigned(3 downto 0);
    output : out unsigned(6 downto 0));
end hex7seg;

architecture combinational of hex7seg is
  signal output_n : unsigned(6 downto 0);
begin
  with input select
    output_n <=
    "0111111" when "0000",
    "0000110" when "0001",
    "1011011" when "0010",
    "1001111" when "0011",
    "1100110" when "0100",
    "1101101" when "0101",
    "1111101" when "0110",
    "0000111" when "0111",
    "1111111" when "1000",
    "1101111" when "1001", 
    "1110111" when "1010",
    "1111100" when "1011", 
    "0111001" when "1100", 
    "1011110" when "1101", 
    "1111001" when "1110",
    "1110001" when "1111",
    "XXXXXXX" when others;

  output <= not output_n;

end combinational;

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Z1_TOP is

  port (
    -- Clocks
    CLK_64M: in std_logic;          -- 9x 7Mhz
    CLK_28M, CLK_14M: in std_logic; -- 4x 7Mhz, 2x 7Mhz

    -- Buttons and switches

    KEY : in std_logic_vector(3 downto 0);         -- Push buttons
    SW  : in unsigned(1 downto 0);                 -- DPDT switches

    -- LED displays

--    LEDG : out std_logic_vector(7 downto 0);       -- Green LEDs
--    LEDR : out std_logic_vector(9 downto 0);       -- Red LEDs

    -- PS/2 port

    PS2_DAT,                    -- Data
    PS2_CLK : in std_logic;     -- Clock

    -- Video output (24-bit RGB, compatible with output of "AXI4-Stream to Video Out"
    vid_data: out unsigned (23 downto 0);
    vid_hsync,                                        -- H_SYNC, active high
    vid_vsync,                                        -- V_SYNC, active high
    vid_vde: out std_logic;                           -- video active (1) or blanking (0)
    
    -- PWM Audio output
    aud_pwm: out std_logic;
    aud_sd: out std_logic;
    
    -- Disk image loading interface to Zynq PS CPU
    image_clk, image_start: in std_logic;
    image_data: in unsigned (7 downto 0)
    
    );
  
end Z1_TOP;

architecture datapath of Z1_TOP is

--  component CLK28MPLL is
--    port (
--      inclk0    : in std_logic;
--      c0        : out std_logic;
--      c1        : out std_logic);
--  end component;
--  CLK_28M, CLK_14M
  signal CLK_2M, PRE_PHASE_ZERO : std_logic;
  signal IO_SELECT, DEVICE_SELECT : std_logic_vector(7 downto 0);
  signal ADDR : unsigned(15 downto 0);
  signal D, PD : unsigned(7 downto 0);

  signal ram_we : std_logic;
  signal VIDEO, HBL, VBL, LD194 : std_logic;
  signal COLOR_LINE : std_logic;
  signal COLOR_LINE_CONTROL : std_logic;
  signal GAMEPORT : std_logic_vector(7 downto 0);
  signal cpu_pc : unsigned(15 downto 0);
  signal VGA_VS, VGA_HS, VGA_BLANK: std_logic;

  signal K : unsigned(7 downto 0);
  signal read_key : std_logic;

  signal flash_clk : unsigned(22 downto 0) := (others => '0');
  signal power_on_reset : std_logic := '1';
  signal reset : std_logic;

  signal speaker : std_logic;

  signal track : unsigned(5 downto 0);
  signal image : unsigned(9 downto 0);
  signal trackmsb : unsigned(3 downto 0);
  signal D1_ACTIVE, D2_ACTIVE : std_logic;
  signal track_addr : unsigned(13 downto 0);
  signal TRACK_RAM_ADDR : unsigned(13 downto 0);
  signal tra : unsigned(15 downto 0);
  signal TRACK_RAM_DI : unsigned(7 downto 0);
  signal TRACK_RAM_WE : std_logic;
  signal R_10 : unsigned(9 downto 0);
  signal G_10 : unsigned(9 downto 0);
  signal B_10 : unsigned(9 downto 0);

  signal CS_N, MOSI, MISO, SCLK : std_logic;

  signal RAM_DO: unsigned(7 downto 0);
  signal RAM_ADDR: unsigned(15 downto 0);
  signal RAM_CS: std_logic;
  signal vga_resetn: std_logic;

  signal fake_leds: unsigned(31 downto 0);
  signal fake_leds_on: std_logic;
  signal debug_loading: std_logic;
  signal debug_loading_pos: unsigned(17 downto 0);
  
  signal pause: std_logic := '1';

  signal audio8: unsigned (7 downto 0);

  constant in_simulation : boolean := false
--pragma synthesis_off
                                    or true
--pragma synthesis_on
  ;
begin


  reset <= power_on_reset;  -- (not KEY(3)) or power_on_reset;
  vga_resetn <= '1';
  
  power_on : process(CLK_14M)
  begin
    if rising_edge(CLK_14M) then
--      if flash_clk(22) = '1' then         
        --- zf: For ease-of-simulation, we set this to count to 32
      if flash_clk(5) = '1' then
        power_on_reset <= '0';
      end if;
    end if;
  end process;

  -- zf: We pause boot process until a key or BTN0 is pressed, to allow loading of a disk image
  start_on_keypress: process(CLK_14M)
  begin
    if rising_edge(CLK_14M) and (PS2_CLK = '0' or in_simulation or KEY(0) = '1') then
        pause <= '0';
    end if;
  end process;

  -- In the Apple ][, this was a 555 timer
  flash_clkgen : process (CLK_14M)
  begin
    if rising_edge(CLK_14M) and pause = '0' then
      flash_clk <= flash_clk + 1;
    end if;     
  end process;

  -- Paddle buttons
  GAMEPORT <=  "0000" & (not KEY(2 downto 0)) & "0";
  COLOR_LINE_CONTROL <= COLOR_LINE and SW(1);  -- Color or B&W mode
  RAM_CS <= '1';
  
  core : entity work.apple2 port map (
    CLK_14M        => CLK_14M,
    CLK_2M         => CLK_2M,
    PRE_PHASE_ZERO => PRE_PHASE_ZERO,
    FLASH_CLK      => flash_clk(22),
    reset          => reset,
    ADDR           => ADDR,
    ram_addr       => RAM_ADDR,
    D              => D,
    ram_do         => RAM_DO,
    PD             => PD,
    ram_we         => ram_we,
    VIDEO          => VIDEO,
    COLOR_LINE     => COLOR_LINE,
    HBL            => HBL,
    VBL            => VBL,
    LD194          => LD194,
    K              => K,
    read_key       => read_key,
--    AN             => LEDG(7 downto 4),
    GAMEPORT       => GAMEPORT,
    IO_SELECT      => IO_SELECT,
    DEVICE_SELECT  => DEVICE_SELECT,
    pcDebugOut     => cpu_pc,
    speaker        => speaker,
    
    pause          => pause
    );

  ram : entity work.ram port map (
    clk        => CLK_14M,
    cs         => RAM_CS,
    addr       => RAM_ADDR,
    data_in    => D,
    data_out   => RAM_DO,
    we         => ram_we
  );

  vga : entity work.vga port map (
    clk        => CLK_64M,
    resetn     => vga_resetn,
    VIDEO      => VIDEO,
    HBL        => HBL,
    VBL        => VBL,
    COLOR_LINE => COLOR_LINE_CONTROL,
    vid_data   => vid_data,
    vid_hsync  => vid_hsync,
    vid_vsync  => vid_vsync,
    vid_vde    => vid_vde,
    
    fake_leds  => fake_leds,
    fake_leds_on => fake_leds_on
  );
  
  fake_leds_on <= SW(0);
  fake_leds <= image_data & image_start & image_clk & b"000" & debug_loading & debug_loading_pos;

  keyboard : entity work.keyboard port map (
    PS2_Clk  => PS2_CLK,
    PS2_Data => PS2_DAT,
    CLK_14M  => CLK_14M,
    reset    => reset,
    read     => read_key,
    K        => K
    );

  disk : entity work.disk_ii port map (
    CLK_14M        => CLK_14M,
    CLK_2M         => CLK_2M,
    PRE_PHASE_ZERO => PRE_PHASE_ZERO,
    IO_SELECT      => IO_SELECT(6),
    DEVICE_SELECT  => DEVICE_SELECT(6),
    RESET          => reset,
    A              => ADDR,
    D_IN           => D,
    D_OUT          => PD,
    TRACK          => TRACK,
    TRACK_ADDR     => TRACK_ADDR,
    D1_ACTIVE      => D1_ACTIVE,
    D2_ACTIVE      => D2_ACTIVE,
    ram_write_addr => TRACK_RAM_ADDR,
    ram_di         => TRACK_RAM_DI,
    ram_we         => TRACK_RAM_WE
    );

  disk_image: entity work.disk_drive port map (
    CLK_14M        => CLK_14M,
    track          => TRACK,

    ram_write_addr => TRACK_RAM_ADDR,
    ram_do         => TRACK_RAM_DI,
    ram_we         => TRACK_RAM_WE,
    
    image_clk      => image_clk,
    image_start    => image_start,
    image_data     => image_data,
    
    debug_loading  => debug_loading,
    debug_loading_pos => debug_loading_pos
    );
    
    audio8 <= speaker & "0000000";     
    audio_gen: entity work.audio_pwm port map (
        clk        => CLK_14M,
        audio      => audio8,
        aud_pwm     => aud_pwm,
        aud_sd      => aud_sd
    );

end datapath;
