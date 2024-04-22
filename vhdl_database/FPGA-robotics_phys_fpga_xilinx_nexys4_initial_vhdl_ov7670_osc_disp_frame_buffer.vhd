--------------------------------------------------------------------------------
--   Felipe Machado Sanchez
--   Area de Tecnologia Electronica
--   Universidad Rey Juan Carlos
--   https://github.com/felipe-m
--
--   frame_buffer.vhd
--   
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.ov7670_pkg.all;

entity frame_buffer is
   port (
      clk   : in  std_logic;
      wea   : in  std_logic;
      addra : in  std_logic_vector(c_nb_img_pxls-1 downto 0);
      dina  : in  std_logic_vector(8-1 downto 0);
      addrb : in  std_logic_vector(c_nb_img_pxls-1 downto 0);
      doutb : out std_logic_vector(8-1 downto 0)
   );
end frame_buffer;

architecture behav of frame_buffer is

  type ram_type is array (natural range<>) of std_logic_vector(8-1 downto 0);
  signal ram    : ram_type (0 to c_img_pxls-1); 

begin
  P_porta: process(clk)
  begin
    if clk'event and clk='1' then
      if wea = '1' then
        ram(to_integer(unsigned(addra))) <= dina;
      end if;
      doutb <= ram(to_integer(unsigned(addrb)));
    end if;
  end process;

end behav;

