-- lane_linemem.vhd
--
-- line memory with 1280 pixel delay
--
-- FPGA Vision Remote Lab http://h-brs.de/fpga-vision-lab
-- (c) Marco Winzker, Hochschule Bonn-Rhein-Sieg, 03.01.2018

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity lane_linemem is
  port (clk      : in  std_logic;
        reset    : in  std_logic;
        write_en : in  std_logic;
        data_in  : in  std_logic_vector(23 downto 0);
        data_out : out std_logic_vector(23 downto 0));
end lane_linemem;

architecture behave of lane_linemem is

  type ram_array is array (0 to 1279) of std_logic_vector(23 downto 0);
  signal ram : ram_array;

begin

  process
    variable wr_address : integer range 0 to 1279;
    variable rd_address : integer range 0 to 1279;
  begin
    wait until rising_edge(clk);

    if (write_en = '1') then
      data_out        <= ram(rd_address);
      ram(wr_address) <= data_in;
    end if;

    if (reset = '1') then
      wr_address := 0;
      rd_address := 1;
    elsif (write_en = '1') then
      wr_address := rd_address;
      if (rd_address = 1279) then
        rd_address := 0;
      else
        rd_address := rd_address + 1;
      end if;
    end if;
  end process;

end behave;
