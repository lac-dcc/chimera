------------------------------------------------------------------------------
-- Title      : convElement
-- Project    : Haddoc2
------------------------------------------------------------------------------
-- File       : convElement.vhd
-- Author     : K. Abdelouahab
-- Company    : Institut Pascal
-- Last update: 2018-08-23
------------------------------------------------------------------------------
-- Description: A fully pipelined implementation of CNN layers that is able to process
--              one pixel/clock cycle. Each actors of a CNN graph are directly mapped
--              on the hardware following the principals of DHM and DataFlow processing
--                            ______
--                          |       |
--                          |       |-- output_streams-->
--        input_streams---->| conv  |-- output_streams-->
--        input_streams---->| Layer |-- output_streams-->
--        input_streams---->|       |-- output_streams-->
--        input_streams---->|       |-- output_streams-->
--                          |       |-- output_streams-->
--                           ______
-----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.math_real.all;
library work;
use work.cnn_types.all;


entity ConvLayer is
  generic(
    BITWIDTH   : integer;
    IMAGE_WIDTH  : integer;
    SUM_WIDTH    : integer;
    KERNEL_SIZE  : integer;
    NB_IN_FLOWS  : integer;
    NB_OUT_FLOWS : integer;
    KERNEL_VALUE : pixel_matrix;
    BIAS_VALUE   : pixel_array
    );

  port(
    clk      : in  std_logic;
    reset_n  : in  std_logic;
    enable   : in  std_logic;
    in_data  : in  pixel_array(0 to NB_IN_FLOWS - 1);
    in_dv    : in  std_logic;
    in_fv    : in  std_logic;
    out_data : out pixel_array(0 to NB_OUT_FLOWS - 1);
    out_dv   : out std_logic;
    out_fv   : out std_logic
    );
end entity;

architecture STRUCTURAL of ConvLayer is
  --------------------------------------------------------------------------------
  -- COMPONENTS
  --------------------------------------------------------------------------------
  component TensorExtractor
    generic (
      BITWIDTH  : integer;
      IMAGE_WIDTH : integer;
      KERNEL_SIZE : integer;
      NB_IN_FLOWS : integer
      );
    port (
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
  end component TensorExtractor;

  component DotProduct
    generic (
      BITWIDTH       : integer;
      SUM_WIDTH        : integer;
      DOT_PRODUCT_SIZE : integer;
      KERNEL_VALUE     : pixel_array;
      BIAS_VALUE       : std_logic_vector
      );
    port (
      clk      : in  std_logic;
      reset_n  : in  std_logic;
      enable   : in  std_logic;
      in_data  : in  pixel_array (0 to DOT_PRODUCT_SIZE - 1);
      in_dv    : in  std_logic;
      in_fv    : in  std_logic;
      out_data : out std_logic_vector (SUM_WIDTH-1 downto 0);
      out_dv   : out std_logic;
      out_fv   : out std_logic
      );
  end component DotProduct;


  component TanhLayer
    generic (
      BITWIDTH : integer;
      SUM_WIDTH  : integer
      );
    port (
      in_data  : in  std_logic_vector (SUM_WIDTH-1 downto 0);
      out_data : out std_logic_vector (BITWIDTH-1 downto 0)
      );
  end component TanhLayer;
  ------------------------------------------------------------------------------------------
  signal neighborhood_data : pixel_array (0 to NB_IN_FLOWS * KERNEL_SIZE * KERNEL_SIZE- 1);
  signal neighborhood_dv   : std_logic;
  signal neighborhood_fv   : std_logic;
  signal dp_data           : sum_array (0 to NB_OUT_FLOWS-1);
  signal dp_dv             : std_logic;
  signal dp_fv             : std_logic;
-----------------------------------------------------------------------------------------
begin

  TensorExtractor_i : TensorExtractor
    generic map (
      BITWIDTH  => BITWIDTH,
      IMAGE_WIDTH => IMAGE_WIDTH,
      KERNEL_SIZE => KERNEL_SIZE,
      NB_IN_FLOWS => NB_IN_FLOWS
      )
    port map (
      clk      => clk,
      reset_n  => reset_n,
      enable   => enable,
      in_data  => in_data,
      in_dv    => in_dv,
      in_fv    => in_fv,
      out_data => neighborhood_data,
      out_dv   => neighborhood_dv,
      out_fv   => neighborhood_fv
      );

  DotProduct_loop : for n in 0 to NB_OUT_FLOWS- 1 generate
    DotProduct_i : DotProduct
      generic map (
        BITWIDTH       => BITWIDTH,
        SUM_WIDTH        => SUM_WIDTH,
        DOT_PRODUCT_SIZE => NB_IN_FLOWS * KERNEL_SIZE * KERNEL_SIZE,
        BIAS_VALUE       => BIAS_VALUE(n),
        KERNEL_VALUE     => extractRow(n,
                                   NB_OUT_FLOWS,  -- N
                                   NB_IN_FLOWS * KERNEL_SIZE * KERNEL_SIZE,  -- CJK
                                   KERNEL_VALUE)  --Theta(n)
        )
      port map (
        clk      => clk,
        reset_n  => reset_n,
        enable   => enable,
        in_data  => neighborhood_data,
        in_dv    => neighborhood_dv,
        in_fv    => neighborhood_fv,
        out_data => dp_data(n),
        out_dv   => open,
        out_fv   => open
        );

    -- Dummy Activation
    TanhLayer_i : TanhLayer
      generic map (
        BITWIDTH => BITWIDTH,
        SUM_WIDTH  => SUM_WIDTH
        )
      port map (
        in_data  => dp_data(n),
        out_data => out_data(n)
        );

    out_dv <= in_dv;
    out_fv <= in_fv;
  end generate;



end architecture;
