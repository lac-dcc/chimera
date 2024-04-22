-- (C) 2001-2021 Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions and other 
-- software and tools, and its AMPP partner logic functions, and any output 
-- files from any of the foregoing (including device programming or simulation 
-- files), and any associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License Subscription 
-- Agreement, Intel FPGA IP License Agreement, or other applicable 
-- license agreement, including, without limitation, that your use is for the 
-- sole purpose of programming logic devices manufactured by Intel and sold by 
-- Intel or its authorized distributors.  Please refer to the applicable 
-- agreement for further details.


library IEEE;
use IEEE.std_logic_1164.all;
use work.auk_dspip_lib_pkg_hpfir.all;
use work.auk_dspip_math_pkg_hpfir.all;

entity fir_2ch_audio_0002 is
  port (
    clk : in STD_LOGIC;    
    reset_n : in STD_LOGIC;
    ast_sink_data : in STD_LOGIC_VECTOR((0 + 1*16) * 1 + 0 - 1 downto 0);
    ast_sink_valid : in STD_LOGIC;
    ast_sink_sop : in STD_LOGIC;
    ast_sink_eop : in STD_LOGIC;
    ast_sink_error : in STD_LOGIC_VECTOR(1 downto 0);
    ast_source_data : out STD_LOGIC_VECTOR(24 * 1*1 - 1 downto 0);
    ast_source_valid : out STD_LOGIC;
    ast_source_sop : out STD_LOGIC;
    ast_source_eop : out STD_LOGIC;
    ast_source_channel : out STD_LOGIC_VECTOR(log2_ceil_one(2) - 1 downto 0);
    ast_source_error : out STD_LOGIC_VECTOR(1 downto 0)
  );
end fir_2ch_audio_0002;


architecture syn of fir_2ch_audio_0002 is
  component fir_2ch_audio_0002_ast
  port (
    clk : in STD_LOGIC;
    reset_n : in STD_LOGIC;
    ast_sink_data : in STD_LOGIC_VECTOR((0 + 1*16) * 1 + 0 - 1 downto 0);
    ast_sink_valid : in STD_LOGIC;
    ast_sink_ready : out STD_LOGIC;
    ast_sink_sop : in STD_LOGIC;
    ast_sink_eop : in STD_LOGIC;
    ast_sink_error : in STD_LOGIC_VECTOR(1 downto 0);
    ast_source_data : out STD_LOGIC_VECTOR(1*24 * 1 - 1 downto 0);
    ast_source_ready : in STD_LOGIC;
    ast_source_valid : out STD_LOGIC;
    ast_source_sop : out STD_LOGIC;
    ast_source_eop : out STD_LOGIC;
    ast_source_channel : out STD_LOGIC_VECTOR(log2_ceil_one(2) - 1 downto 0);
    ast_source_error : out STD_LOGIC_VECTOR(1 downto 0)
  );
end component;

    signal coeff_in_read_sig : std_logic;

begin

    coeff_in_read_sig  <= '1';



  fir_2ch_audio_0002_ast_inst : fir_2ch_audio_0002_ast
  port map (
    clk => clk,
    reset_n => reset_n,
    ast_sink_data => ast_sink_data,
    ast_source_data => ast_source_data,
    ast_sink_valid => ast_sink_valid,
        ast_sink_ready => open,
        ast_source_ready => '1',
    ast_source_valid => ast_source_valid,
        ast_sink_sop => ast_sink_sop,
        ast_sink_eop => ast_sink_eop,
    ast_sink_error => ast_sink_error,
        ast_source_sop => ast_source_sop,
        ast_source_eop => ast_source_eop,
        ast_source_channel => ast_source_channel,
    ast_source_error => ast_source_error
  );
end syn;


