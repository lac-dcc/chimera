---------------------------------------------------------------------------------
-- Design Name   : poolLayer
-- Coder         : Kamel ABDELOUAHAB
-- Institution   : Institut Pascal  - 2016
---------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.cnn_types.all;

entity PoolLayer is
  generic(
    BITWIDTH   : integer;
    IMAGE_WIDTH  : integer;
    KERNEL_SIZE  : integer;
    NB_OUT_FLOWS : integer
    );
  port(
    clk      : in  std_logic;
    reset_n  : in  std_logic;
    enable   : in  std_logic;
    in_data  : in  pixel_array(0 to NB_OUT_FLOWS - 1);
    in_dv    : in  std_logic;
    in_fv    : in  std_logic;
    out_data : out pixel_array(0 to NB_OUT_FLOWS - 1);
    out_dv   : out std_logic;
    out_fv   : out std_logic
    );
end entity;

architecture STRUCTURAL of PoolLayer is
  --------------------------------------------------------------------------------
  -- COMPONENTS
  --------------------------------------------------------------------------------
  component maxPool
    generic(
      BITWIDTH  : integer;
      IMAGE_WIDTH : integer;
      KERNEL_SIZE : integer
      );
    port(
      clk      : in  std_logic;
      reset_n  : in  std_logic;
      enable   : in  std_logic;
      in_data  : in  std_logic_vector (BITWIDTH - 1 downto 0);
      in_dv    : in  std_logic;
      in_fv    : in  std_logic;
      out_data : out std_logic_vector (BITWIDTH - 1 downto 0);
      out_dv   : out std_logic;
      out_fv   : out std_logic
      );

  end component;
--------------------------------------------------------------------------------
begin

  generate_maxPool : for i in 0 to NB_OUT_FLOWS-1 generate
    first_maxpool : if i = 0 generate
      maxPool_0 : maxPool
        generic map(
          BITWIDTH  => BITWIDTH,
          IMAGE_WIDTH => IMAGE_WIDTH,
          KERNEL_SIZE => KERNEL_SIZE
          )
        port map(
          clk      => clk,
          reset_n  => reset_n,
          enable   => enable,
          in_data  => in_data(0),
          in_dv    => in_dv,
          in_fv    => in_fv,
          out_data => out_data(0),
          out_dv   => out_dv,
          out_fv   => out_fv
          );
    end generate first_maxpool;

    other_maxPool : if i > 0 generate
      maxPool_i : maxPool
        generic map(
          BITWIDTH  => BITWIDTH,
          IMAGE_WIDTH => IMAGE_WIDTH,
          KERNEL_SIZE => KERNEL_SIZE
          )
        port map(
          clk      => clk,
          reset_n  => reset_n,
          enable   => enable,
          in_data  => in_data(i),
          in_dv    => in_dv,
          in_fv    => in_fv,
          out_data => out_data(i),
          out_dv   => open,
          out_fv   => open
          );
    end generate other_maxPool;
  end generate generate_maxPool;
end STRUCTURAL;
