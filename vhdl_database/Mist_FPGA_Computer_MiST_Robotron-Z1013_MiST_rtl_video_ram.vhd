------------------------------------------------------------------------------
-- Project    : Red Zombie
------------------------------------------------------------------------------
-- File       :  video_ram.vhd
-- Author     :  fpgakuechle
-- Company    : hobbyist
-- Created    : 2012-12
-- Last update: 2016-04-27
-- Licence    : GNU General Public License (http://www.gnu.de/documents/gpl.de.html) 
------------------------------------------------------------------------------
-- Description: 
-- Video subsysten
-- Video ram, character,rom, display output
-- Z1013 display is 32 x 32 xharactes on a 8x8 font
-- output format here is 800x600 pixel
-- the z1013 display will stretched to 512x512 (ever font-element quadrupelt)
-- and placed at 1st line starting at hor. pos 44
--
-- setting the generic G_readonly to true disables any writes from the cpu
-- so the videocontroller displays the initilized ram pattern
-- defined in video_ram_pkg.vhd
--
-- dualport ram as video - 
-- cpu stores 32x32 words 8 bit long, operating at cpu-clk (3.125M)
-- video controller reads from other port at video clk (40 MHz)
------------------------------------------------------------------------------
--Status: dimensions OK, same ghost pixels and a ghost pixel line 
-----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.pkg_redz0mb1e.all;
use work.video_ram_pkg.all;             --video ram (types, powerup scr

entity video_ram is
  generic
    (
      G_System   : T_SYSTEM := DEV;
      G_READONLY : boolean  := false  --true:fixes Bild aus initialisierten videoram);
      );
  port
    (
      cpu_clk      : in  std_logic;       --cpu clk (i.e. 3.2 MHz)
      cpu_cs_ni    : in  std_logic;
      cpu_we_ni    : in  std_logic := '1';
      cpu_addr_i   : in  std_logic_vector(9 downto 0);
      cpu_data_o   : out std_logic_vector(7 downto 0);
      cpu_data_i   : in  std_logic_vector(7 downto 0);
      --
      video_clk    : in  std_logic;      --videoclk (i.e. 40MHz for 800x600@60)
      video_cs_ni  : in  std_logic;
      video_addr_i : in  std_logic_vector(9 downto 0);
      video_data_o : out std_logic_vector(7 downto 0)
      );
end entity video_ram;


architecture rtl of video_ram is

  -- Build a 2-D array type for the RAM
  subtype word_t is std_logic_vector(7 downto 0);
  type    memory_t is array(0 to 2**10-1) of word_t;

  function init_ram
    return memory_t is
    variable tmp : memory_t := (others => (others => '0'));
  begin
    for addr_pos in 0 to 2**10 - 1 loop           -- C_VRAM_ARRAY_SPACES_INIT;
      tmp(addr_pos) := std_logic_vector(to_unsigned( C_VRAM_ARRAY_INIT(addr_pos), 8));
    end loop;
    return tmp;
  end init_ram;


  -- Declare the RAM 
  shared variable ram : memory_t := init_ram;

  signal addr_a : natural range 0 to 2**10-1;
  signal addr_b : natural range 0 to 2**10-1;

  signal data_b : std_logic_vector(7 downto 0) := (others => '0');
  signal we_b   : std_logic                    := '0';

begin

  addr_a <= to_integer(unsigned(cpu_addr_i));
  addr_b <= to_integer(unsigned(video_addr_i));

  -- Port A
  process(cpu_clk)
  begin
    if falling_edge(cpu_clk) then
      if cpu_cs_ni = '0' and cpu_we_ni = '0' and G_READONLY = false then
        ram(addr_a) := cpu_data_i;
      end if;
      cpu_data_o <= ram(addr_a);
    end if;
  end process;

  -- Port B
  process(video_clk)
  begin
    if(rising_edge(video_clk)) then
      if we_b = '1' then
        ram(addr_b) := data_b;
      end if;
      video_data_o <= ram(addr_b);
    end if;
  end process;

end architecture rtl;
