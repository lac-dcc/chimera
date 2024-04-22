-------------------------------------------------------------------------------
-- Title      : Parametrizable dual-port synchronous RAM (Altera version)
-- Project    : Generics RAMs and FIFOs collection
-------------------------------------------------------------------------------
-- File       : generic_simple_dpram.vhd
-- Author     : Wesley W. Terpstra
-- Company    : GSI
-- Created    : 2013-03-04
-- Last update: 2013-03-04
-- Platform   : 
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: Simple dual-port synchronous RAM for Altera FPGAs with:
-- - configurable address and data bus width
-- - byte-addressing mode (data bus width restricted to multiple of 8 bits)
-------------------------------------------------------------------------------
-- Copyright (c) 2013 GSI
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2013-03-04  1.0      wterpstra       Adapted from generic_dpram.vhd
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.genram_pkg.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

entity generic_simple_dpram is
  generic(
    g_data_width               : natural;
    g_size                     : natural;
    g_with_byte_enable         : boolean := false;
    g_addr_conflict_resolution : string := "dont_care";
    g_init_file                : string := "none";
    g_dual_clock               : boolean := true);
  port(
    rst_n_i : in std_logic := '1';      -- synchronous reset, active LO

    -- Port A
    clka_i : in  std_logic;
    bwea_i : in  std_logic_vector((g_data_width+7)/8-1 downto 0);
    wea_i  : in  std_logic;
    aa_i   : in  std_logic_vector(f_log2_size(g_size)-1 downto 0);
    da_i   : in  std_logic_vector(g_data_width-1 downto 0);
    
    -- Port B
    clkb_i : in  std_logic;
    ab_i   : in  std_logic_vector(f_log2_size(g_size)-1 downto 0);
    qb_o   : out std_logic_vector(g_data_width-1 downto 0)
    );

end generic_simple_dpram;

architecture syn of generic_simple_dpram is

  function f_diffport_order(x : string) return string is
  begin
    if x = "read_first" then
      return "OLD_DATA";
    elsif x = "write_first" then
      return "DONT_CARE"; -- "NEW_DATA" is unsupported; we use a bypass MUX in this case
    elsif x = "dont_care" then
      return "DONT_CARE";
    else
      assert (false) report "generic_simple_dpram: g_addr_conflict_resolution must be: read_first, write_first, dont_care" severity failure;
      return "DONT_CARE";
    end if;
  end f_diffport_order;
  
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
  constant diffport_order : string  := f_diffport_order(g_addr_conflict_resolution);
  constant c_init_file    : string  := f_filename(g_init_file);
  
  signal qb : std_logic_vector(g_data_width-1 downto 0);
  signal da : std_logic_vector(g_data_width-1 downto 0);
  signal nbb : boolean;
  
begin

  assert (g_addr_conflict_resolution /= "write_first" or (g_dual_clock = false and g_with_byte_enable = false))
  report "generic_simple_dpram: write_first is only possible when dual_clock and g_with_byte_enable are false"
  severity failure;
  
  assert (g_addr_conflict_resolution /= "read_first" or g_dual_clock = false)
  report "generic_simple_dpram: read_first is only possible when dual_clock is false"
  severity failure;
  
  assert (g_addr_conflict_resolution /= "write_first")
  report "generic_simple_dpram: write_first requires a bypass MUX"
  severity note;
  
  case_qb_raw : if (g_addr_conflict_resolution /= "write_first") generate
    qb_o <= qb;
  end generate;
  
  case_qb_bypass : if (g_addr_conflict_resolution = "write_first") generate
    qb_o <= qb when nbb else da;
    
    memoize : process(clka_i) is
    begin
      if rising_edge(clka_i) then
        nbb <= aa_i /= ab_i or wea_i = '0';
        da <= da_i;
      end if;
    end process;
  end generate;
  
  case_be_dual : if (g_with_byte_enable = true and g_dual_clock = true) generate
    memory : altsyncram
      generic map(
        byte_size                          => 8,
        numwords_a                         => g_size,
        numwords_b                         => g_size,
        widthad_a                          => c_addr_width,
        widthad_b                          => c_addr_width,
        width_a                            => g_data_width,
        width_b                            => g_data_width,
        width_byteena_a                    => c_num_bytes,
        operation_mode                     => "DUAL_PORT",
        read_during_write_mode_mixed_ports => diffport_order,
        outdata_reg_a                      => "UNREGISTERED",
        outdata_reg_b                      => "UNREGISTERED",
        address_reg_b                      => "CLOCK1",
        wrcontrol_wraddress_reg_b          => "CLOCK1",
        byteena_reg_b                      => "CLOCK1",
        indata_reg_b                       => "CLOCK1",
        rdcontrol_reg_b                    => "CLOCK1",
        init_file                          => c_init_file)
      port map(
        clock0    => clka_i,
        wren_a    => wea_i,
        address_a => aa_i,
        data_a    => da_i,
        byteena_a => bwea_i,
        
        clock1    => clkb_i,
        address_b => ab_i,
        q_b       => qb);
  end generate;
    
  case_be_single : if (g_with_byte_enable = true and g_dual_clock = false) generate
    memory : altsyncram
      generic map(
        byte_size                          => 8,
        numwords_a                         => g_size,
        numwords_b                         => g_size,
        widthad_a                          => c_addr_width,
        widthad_b                          => c_addr_width,
        width_a                            => g_data_width,
        width_b                            => g_data_width,
        width_byteena_a                    => c_num_bytes,
        operation_mode                     => "DUAL_PORT",
        read_during_write_mode_mixed_ports => diffport_order,
        outdata_reg_a                      => "UNREGISTERED",
        outdata_reg_b                      => "UNREGISTERED",
        address_reg_b                      => "CLOCK0",
        wrcontrol_wraddress_reg_b          => "CLOCK0",
        byteena_reg_b                      => "CLOCK0",
        indata_reg_b                       => "CLOCK0",
        rdcontrol_reg_b                    => "CLOCK0",
        init_file                          => c_init_file)
      port map(
        clock0    => clka_i,
        wren_a    => wea_i,
        address_a => aa_i,
        data_a    => da_i,
        byteena_a => bwea_i,
        
        address_b => ab_i,
        q_b       => qb);
  end generate;
    
  case_nobe_dual : if (g_with_byte_enable = false and g_dual_clock = true) generate
    memory : altsyncram
      generic map(
        byte_size                          => 8,
        numwords_a                         => g_size,
        numwords_b                         => g_size,
        widthad_a                          => c_addr_width,
        widthad_b                          => c_addr_width,
        width_a                            => g_data_width,
        width_b                            => g_data_width,
        operation_mode                     => "DUAL_PORT",
        read_during_write_mode_mixed_ports => diffport_order,
        outdata_reg_a                      => "UNREGISTERED",
        outdata_reg_b                      => "UNREGISTERED",
        address_reg_b                      => "CLOCK1",
        wrcontrol_wraddress_reg_b          => "CLOCK1",
        byteena_reg_b                      => "CLOCK1",
        indata_reg_b                       => "CLOCK1",
        rdcontrol_reg_b                    => "CLOCK1",
        init_file                          => c_init_file)
      port map(
        clock0    => clka_i,
        wren_a    => wea_i,
        address_a => aa_i,
        data_a    => da_i,
        
        clock1    => clkb_i,
        address_b => ab_i,
        q_b       => qb);
  end generate;
    
  case_nobe_single : if (g_with_byte_enable = false and g_dual_clock = false) generate
    memory : altsyncram
      generic map(
        byte_size                          => 8,
        numwords_a                         => g_size,
        numwords_b                         => g_size,
        widthad_a                          => c_addr_width,
        widthad_b                          => c_addr_width,
        width_a                            => g_data_width,
        width_b                            => g_data_width,
        operation_mode                     => "DUAL_PORT",
        read_during_write_mode_mixed_ports => diffport_order,
        outdata_reg_a                      => "UNREGISTERED",
        outdata_reg_b                      => "UNREGISTERED",
        address_reg_b                      => "CLOCK0",
        wrcontrol_wraddress_reg_b          => "CLOCK0",
        byteena_reg_b                      => "CLOCK0",
        indata_reg_b                       => "CLOCK0",
        rdcontrol_reg_b                    => "CLOCK0",
        init_file                          => c_init_file)
      port map(
        clock0    => clka_i,
        wren_a    => wea_i,
        address_a => aa_i,
        data_a    => da_i,
        
        address_b => ab_i,
        q_b       => qb);
  end generate;
    
end syn;
