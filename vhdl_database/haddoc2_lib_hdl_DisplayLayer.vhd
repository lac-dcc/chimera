------------------------------------------------------------------------------
-- Title      : DisplayLayer
-- Project    : Haddoc2
------------------------------------------------------------------------------
-- File       : display_mux.vhd
-- Author     : K. Abdelouahab
-- Company    : Institut Pascal
-- Last update: 2018-08-23
------------------------------------------------------------------------------
-- Description: A design of a multiplexer to be used at the end of a CNN. Can
--              be used for display puposes
------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;


library work;
use work.cnn_types.all;

entity DisplayLayer is
  generic(
    BITWIDTH  : integer;
    NB_IN_FLOWS : integer
    );
  port(
    in_data  : in  pixel_array (0 to NB_IN_FLOWS-1);
    in_dv    : in  std_logic;
    in_fv    : in  std_logic;
    sel      : in  std_logic_vector(31 downto 0);
    out_data : out std_logic_vector(BITWIDTH-1 downto 0);
    out_dv   : out std_logic;
    out_fv   : out std_logic
    );
end entity;

architecture bhv of DisplayLayer is
begin
  out_data <= in_data(to_integer(unsigned(sel)));
  out_dv   <= in_dv;
  out_fv   <= in_fv;
end bhv;
