-- Implementation of a Multiple-Constant-Multiplier:
-- This IP multiplies an input array with CONSTANT coefficients (3D convolution kernels)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.math_real.all;
library work;
use work.cnn_types.all;

entity MCM is
  generic(
    BITWIDTH       : integer;
    DOT_PRODUCT_SIZE : integer;
    KERNEL_VALUE     : pixel_array
    );
  port(
    clk       : in  std_logic;
    reset_n   : in  std_logic;
    enable    : in  std_logic;
    in_data   : in  pixel_array (0 to DOT_PRODUCT_SIZE - 1);
    in_valid  : in  std_logic;
    out_data  : out prod_array (0 to DOT_PRODUCT_SIZE - 1);
    out_valid : out std_logic
    );
end MCM;

architecture rtl of MCM is
  -- Generate DOT_PRODUCT_SIZE Multipliers
  signal mult : prod_array (0 to DOT_PRODUCT_SIZE - 1);

begin
  ---------------------------------
  -- Assynchronous implmentation --
  ---------------------------------
  -- mcm_loop : for i in 0 to DOT_PRODUCT_SIZE - 1 generate
  --     out_data(i) <=  KERNEL_VALUE(i) * in_data(i);
  -- end generate mcm_loop;
  -- out_valid <= in_valid;

  ---------------------------------
  --  synchronous implmentation  --
  ---------------------------------

  process(clk)
  begin
    if(reset_n = '0') then
      out_data  <= (others => (others => '0'));
      out_valid <= '0';
    elsif (rising_edge(clk) and enable = '1') then
      if (in_valid = '1') then
        mcm_loop : for i in 0 to DOT_PRODUCT_SIZE - 1 loop
          out_data(i) <= KERNEL_VALUE(i) * in_data(i);
        end loop;
      end if;
      out_valid <= in_valid;
    end if;
  end process;

end architecture;
