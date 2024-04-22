-------------------------------------------------------------------------------
-- Title      : Parametrizable dual-port synchronous RAM (Altera version)
-- Project    : Generics RAMs and FIFOs collection
-------------------------------------------------------------------------------
-- File       : generic_dpram.vhd
-- Author     : Wesley W. Terpstra
-- Company    : GSI
-- Created    : 2011-01-25
-- Last update: 2013-03-04
-- Platform   : 
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: True dual-port synchronous RAM for Altera FPGAs with:
-- - configurable address and data bus width
-- - byte-addressing mode (data bus width restricted to multiple of 8 bits)
-------------------------------------------------------------------------------
-- Copyright (c) 2011 CERN
-- Copyright (c) 2013 GSI
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2011-01-25  1.0      twlostow        Created
-- 2012-03-13  1.1      wterpstra       Added initial value as array
-- 2013-03-04  2.0      wterpstra       Rewrote using altsyncram
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.genram_pkg.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

entity generic_dpram is
  generic(
    -- standard parameters
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
    qa_o   : out std_logic_vector(g_data_width-1 downto 0);
    
    -- Port B
    clkb_i : in  std_logic;
    bweb_i : in  std_logic_vector((g_data_width+7)/8-1 downto 0);
    web_i  : in  std_logic;
    ab_i   : in  std_logic_vector(f_log2_size(g_size)-1 downto 0);
    db_i   : in  std_logic_vector(g_data_width-1 downto 0);
    qb_o   : out std_logic_vector(g_data_width-1 downto 0)
    );

end generic_dpram;

architecture syn of generic_dpram is

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
      assert (false) report "generic_dpram: g_addr_conflict_resolution must be: read_first, write_first, dont_care" severity failure;
      return "DONT_CARE";
    end if;
  end f_sameport_order;
  
  function f_diffport_order(x : string) return string is
  begin
    if x = "read_first" then
      return "OLD_DATA";
    elsif x = "write_first" then
      return "DONT_CARE"; -- "NEW_DATA" is unsupported; we use a bypass MUX in this case
    elsif x = "dont_care" then
      return "DONT_CARE";
    else
      assert (false) report "generic_dpram: g_addr_conflict_resolution must be: read_first, write_first, dont_care" severity failure;
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
  constant sameport_order : string  := f_sameport_order(g_addr_conflict_resolution);
  constant diffport_order : string  := f_diffport_order(g_addr_conflict_resolution);
  constant c_init_file    : string  := f_filename(g_init_file);
  
  signal qa : std_logic_vector(g_data_width-1 downto 0);
  signal qb : std_logic_vector(g_data_width-1 downto 0);
  signal da : std_logic_vector(g_data_width-1 downto 0);
  signal db : std_logic_vector(g_data_width-1 downto 0);
  signal nba : boolean;
  signal nbb : boolean;
  
begin

  assert (g_addr_conflict_resolution /= "write_first" or (g_dual_clock = false and g_with_byte_enable = false))
  report "generic_dpram: write_first is only possible when dual_clock and g_with_byte_enable are false"
  severity failure;
  
  assert (g_addr_conflict_resolution /= "read_first" or g_dual_clock = false)
  report "generic_dpram: read_first is only possible when dual_clock is false"
  severity failure;
  
  assert (g_addr_conflict_resolution /= "write_first")
  report "generic_dpram: write_first requires a bypass MUX"
  severity note;
  
  case_qb_raw : if (g_addr_conflict_resolution /= "write_first") generate
    qa_o <= qa;
    qb_o <= qb;
  end generate;
  
  case_qb_bypass : if (g_addr_conflict_resolution = "write_first") generate
    qa_o <= qa when nba else db;
    qb_o <= qb when nbb else da;
    
    memoize : process(clka_i) is
    begin
      if rising_edge(clka_i) then
        nba <= aa_i /= ab_i or web_i = '0';
        nbb <= aa_i /= ab_i or wea_i = '0';
        da <= da_i;
        db <= db_i;
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
        width_byteena_b                    => c_num_bytes,
        operation_mode                     => "BIDIR_DUAL_PORT",
        read_during_write_mode_mixed_ports => diffport_order,
        read_during_write_mode_port_a      => sameport_order,
        read_during_write_mode_port_b      => sameport_order,
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
        q_a       => qa,
        
        clock1    => clkb_i,
        wren_b    => web_i,
        address_b => ab_i,
        data_b    => db_i,
        byteena_b => bweb_i,
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
        width_byteena_b                    => c_num_bytes,
        operation_mode                     => "BIDIR_DUAL_PORT",
        read_during_write_mode_mixed_ports => diffport_order,
        read_during_write_mode_port_a      => sameport_order,
        read_during_write_mode_port_b      => sameport_order,
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
        q_a       => qa,
        
        wren_b    => web_i,
        address_b => ab_i,
        data_b    => db_i,
        byteena_b => bweb_i,
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
        operation_mode                     => "BIDIR_DUAL_PORT",
        read_during_write_mode_mixed_ports => diffport_order,
        read_during_write_mode_port_a      => sameport_order,
        read_during_write_mode_port_b      => sameport_order,
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
        q_a       => qa,
        
        clock1    => clkb_i,
        wren_b    => web_i,
        address_b => ab_i,
        data_b    => db_i,
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
        operation_mode                     => "BIDIR_DUAL_PORT",
        read_during_write_mode_mixed_ports => diffport_order,
        read_during_write_mode_port_a      => sameport_order,
        read_during_write_mode_port_b      => sameport_order,
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
        q_a       => qa,
        
        wren_b    => web_i,
        address_b => ab_i,
        data_b    => db_i,
        q_b       => qb);
  end generate;
    
end syn;
