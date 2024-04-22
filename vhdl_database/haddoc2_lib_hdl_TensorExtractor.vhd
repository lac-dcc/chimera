------------------------------------------------------------------------------
-- Title      : TensorExtractor
-- Project    : Haddoc2
------------------------------------------------------------------------------------------------------------
-- File       : TensorExtractor.vhd
-- Author     : K. Abdelouahab
-- Company    : Institut Pascal
-- Last update: 2018-08-23
-------------------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.cnn_types.all;

entity TensorExtractor is
  generic(
    BITWIDTH  : integer;
    IMAGE_WIDTH : integer;
    KERNEL_SIZE : integer;
    NB_IN_FLOWS : integer
    );
  port(
    clk      : in  std_logic;
    reset_n  : in  std_logic;
    enable   : in  std_logic;
    in_data  : in  pixel_array (0 to NB_IN_FLOWS - 1);
    in_dv    : in  std_logic;
    in_fv    : in  std_logic;
    out_data : out pixel_array (0 to NB_IN_FLOWS * KERNEL_SIZE * KERNEL_SIZE- 1);
    out_dv   : out std_logic;
    out_fv   : out std_logic
    );
end TensorExtractor;

architecture rtl of TensorExtractor is
  -- components
  component neighExtractor
    generic(
      BITWIDTH  : integer;
      IMAGE_WIDTH : integer;
      KERNEL_SIZE : integer
      );

    port(
      clk      : in  std_logic;
      reset_n  : in  std_logic;
      enable   : in  std_logic;
      in_data  : in  std_logic_vector(BITWIDTH-1 downto 0);
      in_dv    : in  std_logic;
      in_fv    : in  std_logic;
      out_data : out pixel_array (0 to KERNEL_SIZE * KERNEL_SIZE- 1);
      out_dv   : out std_logic;
      out_fv   : out std_logic
      );
  end component;

-- begin
begin
  neighExtractor_gen : for c in 0 to NB_IN_FLOWS-1 generate

    SINGLE_CHANNEL : if c = 0 generate
      neighExtractor_0 : neighExtractor
        generic map (
          BITWIDTH  => BITWIDTH,
          IMAGE_WIDTH => IMAGE_WIDTH,
          KERNEL_SIZE => KERNEL_SIZE
          )
        port map (
          clk      => clk,
          reset_n  => reset_n,
          enable   => enable,
          in_data  => in_data(0),
          in_dv    => in_dv,
          in_fv    => in_fv,
          out_data => out_data(0 to KERNEL_SIZE * KERNEL_SIZE - 1),
          out_dv   => out_dv,
          out_fv   => out_fv
          );
    end generate SINGLE_CHANNEL;

    MULTI_CHANNEL : if c > 0 generate
      neighExtractor_i : neighExtractor
        generic map (
          BITWIDTH  => BITWIDTH,
          IMAGE_WIDTH => IMAGE_WIDTH,
          KERNEL_SIZE => KERNEL_SIZE
          )
        port map (
          clk      => clk,
          reset_n  => reset_n,
          enable   => enable,
          in_data  => in_data(c),
          in_dv    => in_dv,
          in_fv    => in_fv,
          out_data => out_data(c * KERNEL_SIZE * KERNEL_SIZE to (c+1) * KERNEL_SIZE * KERNEL_SIZE - 1),
          out_dv   => open,
          out_fv   => open
          );
    end generate MULTI_CHANNEL;
  end generate neighExtractor_gen;
end architecture;
