-------------------------------------------------------------------------------
-- Title      : Parametrizable single-port synchronous RAM (Altera version)
-- Project    : Generics RAMs and FIFOs collection
-------------------------------------------------------------------------------
-- File       : generic_spram.vhd
-- Author     : Wesley W. Terpstra
-- Company    : GSI
-- Created    : 2011-01-25
-- Last update: 2013-03-04
-- Platform   : 
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Single-port synchronous RAM for Altera FPGAs with:
-- - configurable address and data bus width
-- - byte-addressing mode (data bus width restricted to multiple of 8 bits)
-------------------------------------------------------------------------------
-- Copyright (c) 2011 CERN
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2011-01-25  1.0      twlostow        Created
-- 2013-03-04  2.0      wterpstra       Rewrote using altsyncram
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.genram_pkg.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

entity generic_spram is
  generic(
    g_data_width               : natural := 32;
    g_size                     : natural := 1024;
    g_with_byte_enable         : boolean := false;
    g_addr_conflict_resolution : string  := "dont_care";
    g_init_file                : string  := "");
  port(
    rst_n_i : in  std_logic := '1';
    clk_i   : in  std_logic;
    bwe_i   : in  std_logic_vector((g_data_width+7)/8-1 downto 0);
    we_i    : in  std_logic;
    a_i     : in  std_logic_vector(f_log2_size(g_size)-1 downto 0);
    d_i     : in  std_logic_vector(g_data_width-1 downto 0);
    q_o     : out std_logic_vector(g_data_width-1 downto 0));
end generic_spram;

architecture syn of generic_spram is

  function f_sameport_order(x : string) return string is
  begin
    if x = "read_first" then
      return "OLD_DATA";
    elsif x = "write_first" then
      --return "NEW_DATA_NO_NBE_READ"; -- unwritten bytes='X'
      return "NEW_DATA_WITH_NBE_READ"; -- unwritten bytes=OLD_DATA (ie: whole result = NEW_DATA)
    elsif x = "dont_care" then
      return "DONT_CARE";
    else
      assert (false) report "generic_spram: g_addr_conflict_resolution must be: read_first, write_first, dont_care" severity failure;
      return "DONT_CARE";
    end if;
  end f_sameport_order;
  
  function f_filename(x : string) return string is
  begin
    if x'length = 0 or x = "none" then
      return "UNUSED";
    else
      return x;
    end if;
  end f_filename;
  
  constant c_num_bytes    : integer := (g_data_width+7)/8;
  constant c_addr_width   : integer := f_log2_size(g_size);
  constant sameport_order : string  := f_sameport_order(g_addr_conflict_resolution);
  constant c_init_file    : string  := f_filename(g_init_file);
  
begin

  case_be : if (g_with_byte_enable = true) generate
    memory : altsyncram
      generic map(
        byte_size                          => 8,
        numwords_a                         => g_size,
        widthad_a                          => c_addr_width,
        width_a                            => g_data_width,
        width_byteena_a                    => c_num_bytes,
        operation_mode                     => "SINGLE_PORT",
        read_during_write_mode_port_a      => sameport_order,
        outdata_reg_a                      => "UNREGISTERED",
        init_file                          => c_init_file)
      port map(
        clock0    => clk_i,
        wren_a    => we_i,
        address_a => a_i,
        data_a    => d_i,
        byteena_a => bwe_i,
        q_a       => q_o);
  end generate;
    
  case_nobe : if (g_with_byte_enable = false) generate
    memory : altsyncram
      generic map(
        byte_size                          => 8,
        numwords_a                         => g_size,
        widthad_a                          => c_addr_width,
        width_a                            => g_data_width,
        operation_mode                     => "SINGLE_PORT",
        read_during_write_mode_port_a      => sameport_order,
        outdata_reg_a                      => "UNREGISTERED",
        init_file                          => c_init_file)
      port map(
        clock0    => clk_i,
        wren_a    => we_i,
        address_a => a_i,
        data_a    => d_i,
        q_a       => q_o);
  end generate;
    
end syn;
