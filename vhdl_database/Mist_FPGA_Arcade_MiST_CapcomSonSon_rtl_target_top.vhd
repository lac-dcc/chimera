library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

library work;
use work.pace_pkg.all;
use work.video_controller_pkg.all;
use work.platform_pkg.all;

entity target_top is
  port(
    clk_sys      	: in std_logic;
    clk_vid_en    : in std_logic;
    reset_in      : in std_logic;
    snd_l         : out std_logic_vector(9 downto 0);
    snd_r         : out std_logic_vector(9 downto 0);
    vid_hs        : out std_logic;
    vid_vs        : out std_logic;
    vid_hb        : out std_logic;
    vid_vb        : out std_logic;
    vid_r         : out std_logic_vector(3 downto 0);
    vid_g         : out std_logic_vector(3 downto 0);
    vid_b         : out std_logic_vector(3 downto 0);	
    inputs_p1     : in std_logic_vector(7 downto 0);
    inputs_p2     : in std_logic_vector(7 downto 0);
    inputs_sys    : in std_logic_vector(7 downto 0);
    inputs_dip1   : in std_logic_vector(7 downto 0);
    inputs_dip2   : in std_logic_vector(7 downto 0);	
    cpu_rom_addr  : out std_logic_vector(15 downto 0);
    cpu_rom_do    : in std_logic_vector(7 downto 0);
    tile_rom_addr : out std_logic_vector(12 downto 0);
    tile_rom_do   : in std_logic_vector(15 downto 0);
    snd_rom_addr : out std_logic_vector(12 downto 0);
    snd_rom_do   : in std_logic_vector(7 downto 0)
  );    

end target_top;

architecture SYN of target_top is

  signal clkrst_i       : from_CLKRST_t;
  signal video_i        : from_VIDEO_t;
  signal video_o        : to_VIDEO_t;
  signal audio_i        : from_AUDIO_t;
  signal audio_o        : to_AUDIO_t;
  signal platform_i     : from_PLATFORM_IO_t;
  signal platform_o     : to_PLATFORM_IO_t;


begin

clkrst_i.clk(0) <=clk_sys;
clkrst_i.clk(1) <= clk_sys;
clkrst_i.arst <= reset_in;
clkrst_i.arst_n <= not clkrst_i.arst;

video_i.clk <= clk_sys;
video_i.clk_ena <= clk_vid_en;
video_i.reset <= reset_in;

  GEN_RESETS : for i in 0 to 3 generate

    process (clkrst_i)
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
   
vid_r <= video_o.rgb.r(9 downto 6);
vid_g <= video_o.rgb.g(9 downto 6);
vid_b <= video_o.rgb.b(9 downto 6);
vid_hs <= video_o.hsync;
vid_vs <= video_o.vsync;
vid_hb <= video_o.hblank;
vid_vb <= video_o.vblank;
snd_l <= audio_o.ldata(9 downto 0);
snd_r <= audio_o.rdata(9 downto 0);

pace_inst : entity work.pace                                            
  port map(
    clkrst_i				=> clkrst_i,
    inputs_p1       	=> inputs_p1, 
    inputs_p2       	=> inputs_p2, 
    inputs_sys       	=> inputs_sys,
    inputs_dip1       => inputs_dip1, 
    inputs_dip2       => inputs_dip2, 
    video_i           => video_i,
    video_o           => video_o,
    audio_i           => audio_i,
    audio_o           => audio_o,
    platform_i        => platform_i,
    platform_o        => platform_o,	
    cpu_rom_addr      => cpu_rom_addr,
    cpu_rom_do	      => cpu_rom_do,
    tile_rom_addr     => tile_rom_addr,
    tile_rom_do	      => tile_rom_do,
    snd_rom_addr      => snd_rom_addr,
    snd_rom_do        => snd_rom_do
    );

end SYN;
