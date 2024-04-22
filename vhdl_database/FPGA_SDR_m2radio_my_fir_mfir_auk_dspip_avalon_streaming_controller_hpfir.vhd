-- (C) 2001-2013 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions and other 
-- software and tools, and its AMPP partner logic functions, and any output 
-- files any of the foregoing (including device programming or simulation 
-- files), and any associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License Subscription 
-- Agreement, Altera MegaCore Function License Agreement, or other applicable 
-- license agreement, including, without limitation, that your use is for the 
-- sole purpose of programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the applicable 
-- agreement for further details.


-------------------------------------------------------------------------
-------------------------------------------------------------------------
--
-- $Revision: #1 $
-- $Date: 2009/07/29 $
-- Author : Boon Hong Oh
--
-- Project : Avalon Streaming Wrapper for HP FIR
--
-- Description : 
--
-- This file is the Interface controller for the Avalon Streaming Wrapper.
-- The control signals between sink, core, and source modules are communicated
-- via the controller. The stall output is used as the core enable signal in
-- the wrapper.
--
-- ALTERA Confidential and Proprietary
-- Copyright 2006 (c) Altera Corporation
-- All rights reserved
--
-------------------------------------------------------------------------
-------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;


entity auk_dspip_avalon_streaming_controller_hpfir is
  port(
    clk                 : in  std_logic;
    --clk_en              : in  std_logic := '1';
    reset_n             : in  std_logic;
    --ready               : in  std_logic;
    sink_packet_error   : in  std_logic_vector (1 downto 0);
    --sink_stall          : in  std_logic;
    source_stall        : in  std_logic;
    valid               : in  std_logic;
    reset_design        : out std_logic;
    sink_ready_ctrl     : out std_logic;
    source_packet_error : out std_logic_vector (1 downto 0) := (others => '0');
    source_valid_ctrl   : out std_logic;
    stall               : out std_logic
    );

-- Declarations

end auk_dspip_avalon_streaming_controller_hpfir;

-- hds interface_end

architecture struct of auk_dspip_avalon_streaming_controller_hpfir is

--  signal stall_int        : std_logic;
--  signal stall_reg        : std_logic;

--  attribute maxfan              : integer;
--  attribute maxfan of stall_reg : signal is 500;
  
begin

  reset_design <= not reset_n;
  
  --should not stop sending data to source module when the sink module is stalled
  --should only stop sending when the source module is stalled

  --Disable the FIR core when backpressure
  stall <= source_stall;
  source_valid_ctrl <= valid;

  -- Sink FIFO and FIR core are disabled at the same time
  sink_ready_ctrl <= not(source_stall);

  source_packet_error <= sink_packet_error;  
  
end struct;
