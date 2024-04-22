-------------------------------------------------------------------------------
-- Title      : Parametrizable dual-port synchronous RAM (Altera version)
-- Project    : Generics RAMs and FIFOs collection
-------------------------------------------------------------------------------
-- File       : generic_dpram.vhd
-- Author     : C. Prados
-- Company    : GSI
-- Created    : 2014-08-25
-- Last update: 
-- Platform   : 
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description: True dual-port synchronous RAM for Altera FPGAs with:
-- - configurable address and data bus width
-- - byte-addressing mode (data bus width restricted to multiple of 8 bits)
-------------------------------------------------------------------------------
-- Copyright (c) 2013 GSI
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2014-08-25  1.0      Prados        Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.genram_pkg.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

entity generic_dpram_mixed is
  generic(
    -- standard parameters
    g_data_a_width             : natural;
    g_data_b_width             : natural;
    g_size                     : natural;
    g_addr_conflict_resolution : string := "dont_care";
    g_init_file                : string := "none";
    g_dual_clock               : boolean := true);
  port(
    rst_n_i : in std_logic := '1';      -- synchronous reset, active LO

    -- Port A
    clka_i : in  std_logic;
    bwea_i : in  std_logic_vector((g_data_a_width+7)/8-1 downto 0);
    wea_i  : in  std_logic;
    aa_i   : in  std_logic_vector(f_log2_size(g_size)-1 downto 0);
    da_i   : in  std_logic_vector(g_data_a_width-1 downto 0);
    qa_o   : out std_logic_vector(g_data_a_width-1 downto 0);
    
    -- Port B
    clkb_i : in  std_logic;
    bweb_i : in  std_logic_vector((g_data_b_width+7)/8-1 downto 0);
    web_i  : in  std_logic;
    ab_i   : in  std_logic_vector(f_log2_size(g_data_a_width*g_size/g_data_b_width)-1 downto 0);
    db_i   : in  std_logic_vector(g_data_b_width-1 downto 0);
    qb_o   : out std_logic_vector(g_data_b_width-1 downto 0)
    );

end generic_dpram_mixed;

architecture syn of generic_dpram_mixed is

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
  
  function f_filename(x : string) return string is
  begin
    if x'length = 0 or x = "none" then
      return "UNUSED";
    else
      return x;
    end if;
  end f_filename;
  
  constant c_num_a_bytes   : integer := (g_data_a_width+7)/8;
  constant c_num_b_bytes   : integer := (g_data_b_width+7)/8;
  constant c_addr_a_width  : integer := f_log2_size(g_size);
  constant c_addr_b_width  : integer := f_log2_size(g_data_a_width*g_size/g_data_b_width);
  constant sameport_order  : string  := f_sameport_order(g_addr_conflict_resolution);
  constant c_init_file     : string  := f_filename(g_init_file);
  
  signal qa : std_logic_vector(g_data_a_width-1 downto 0);
  signal qb : std_logic_vector(g_data_b_width-1 downto 0);
  signal da : std_logic_vector(g_data_a_width-1 downto 0);
  signal db : std_logic_vector(g_data_b_width-1 downto 0);
  signal nba : boolean;
  signal nbb : boolean;
  
begin

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
 	
  ram : altsyncram
	generic map (
		byte_size                 => 8,
		address_reg_b             => "clock1",
		byteena_reg_b             => "clock1",
		indata_reg_b              => "clock1",
		wrcontrol_wraddress_reg_b => "clock1",
		clock_enable_input_a      => "bypass",
		clock_enable_input_b      => "bypass",
		clock_enable_output_a     => "bypass",
		clock_enable_output_b     => "bypass",
		init_file                 => c_init_file,
		init_file_layout          => "port_a",
		lpm_type                  => "altsyncram",
		operation_mode            => "bidir_dual_port",
		outdata_aclr_a            => "none",
		outdata_aclr_b            => "none",
		outdata_reg_a             => "unregistered",
		outdata_reg_b             => "unregistered",
		power_up_uninitialized    => "false",
		read_during_write_mode_port_a => sameport_order,
		read_during_write_mode_port_b => sameport_order,
      numwords_a                => g_size,
		numwords_b                => g_size*g_data_a_width/g_data_b_width,
		widthad_a                 => f_log2_size(g_size),
		widthad_b                 => f_log2_size(g_data_a_width*g_size/g_data_b_width),
		width_a                   => g_data_a_width,
		width_b                   => g_data_b_width,
		width_byteena_a           => (g_data_a_width+7)/8,
		width_byteena_b           => (g_data_b_width+7)/8
	)  

	port map (
		clock0    => clka_i,
      address_a => aa_i,
		data_a    => da_i,
		q_a       => qa,
      byteena_a => bwea_i,		
		wren_a    => wea_i,
		clock1    => clkb_i,
		address_b => ab_i,
		data_b    => db_i,
		q_b       => qb,
		byteena_b => bweb_i,
		wren_b    => web_i);
 
end syn;
