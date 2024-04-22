--Copyright (C) 2017  Intel Corporation. All rights reserved.
--Your use of Intel Corporation's design tools, logic functions 
--and other software and tools, and its AMPP partner logic 
--functions, and any output files from any of the foregoing 
--(including device programming or simulation files), and any 
--associated documentation or information are expressly subject 
--to the terms and conditions of the Intel Program License 
--Subscription Agreement, the Intel Quartus Prime License Agreement,
--the Intel FPGA IP License Agreement, or other applicable license
--agreement, including, without limitation, that your use is for
--the sole purpose of programming logic devices manufactured by
--Intel and sold by Intel or its authorized distributors.  Please
--refer to the applicable agreement for further details.

library ieee;
  use ieee.std_logic_1164.all;

library altera_mf;
  use altera_mf.altera_mf_components.all;

entity dpram is
  generic (
    addr_width_g : integer := 8;
    data_width_g : integer := 8
  );
  port (
    address_a : in  std_logic_vector(addr_width_g - 1 downto 0);
    address_b : in  std_logic_vector(addr_width_g - 1 downto 0);
    clock_a   : in  std_logic := '1';
    clock_b   : in  std_logic;
    data_a    : in  std_logic_vector(data_width_g - 1 downto 0);
    data_b    : in  std_logic_vector(data_width_g - 1 downto 0) := (others => '0');
    enable_a  : in  std_logic := '1';
    enable_b  : in  std_logic := '1';
    wren_a    : in  std_logic := '0';
    wren_b    : in  std_logic := '0';
    q_a       : out std_logic_vector(data_width_g - 1 downto 0);
    q_b       : out std_logic_vector(data_width_g - 1 downto 0)
  );
end entity dpram;

architecture syn of dpram is

begin

  altsyncram_component : component altsyncram
    generic map (
      address_reg_b                 => "CLOCK1",
      clock_enable_input_a          => "NORMAL",
      clock_enable_input_b          => "NORMAL",
      clock_enable_output_a         => "BYPASS",
      clock_enable_output_b         => "BYPASS",
      indata_reg_b                  => "CLOCK1",
      intended_device_family        => "Cyclone V",
      lpm_type                      => "altsyncram",
      numwords_a                    => 2 ** addr_width_g,
      numwords_b                    => 2 ** addr_width_g,
      operation_mode                => "BIDIR_DUAL_PORT",
      outdata_aclr_a                => "NONE",
      outdata_aclr_b                => "NONE",
      outdata_reg_a                 => "UNREGISTERED",
      outdata_reg_b                 => "UNREGISTERED",
      power_up_uninitialized        => "FALSE",
      read_during_write_mode_port_a => "NEW_DATA_NO_NBE_READ",
      read_during_write_mode_port_b => "NEW_DATA_NO_NBE_READ",
      widthad_a                     => addr_width_g,
      widthad_b                     => addr_width_g,
      width_a                       => data_width_g,
      width_b                       => data_width_g,
      width_byteena_a               => 1,
      width_byteena_b               => 1,
      wrcontrol_wraddress_reg_b     => "CLOCK1"
    )
    port map (
      address_a => address_a,
      address_b => address_b,
      clock0    => clock_a,
      clock1    => clock_b,
      clocken0  => enable_a,
      clocken1  => enable_b,
      data_a    => data_a,
      data_b    => data_b,
      wren_a    => wren_a,
      wren_b    => wren_b,
      q_a       => q_a,
      q_b       => q_b
    );

end architecture syn;
