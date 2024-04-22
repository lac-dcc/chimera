-------------------------------------------------------------------------------
-- Title      : AXI4-lite data types
-- Project    : SKA
-------------------------------------------------------------------------------
-- File       : axi4lite_pkg.vhd
-- Author     : Riccardo Chiello  <riccardo.chiello@gmail.com>
-- Last modified by : $Author: comore $
-- Company    : Oxford University
-- Created    : 2015-02-12
-- Last update: 2015-02-12
-- Platform   :
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description:
--
-- Data types to abstract an AXI4-lite data bus
-- Signals from master to slave are grouped in t_axi4lite_mosi record type
-- Signals from slave to master are grouped in t_axi4lite_miso record type
--  
-- Array of busses are implemented by 
-- t_axi4lite_mosi_arr and t_axi4lite_miso_arr  arrays of records
--
-- A simple ready/ack interface is implemented in records 
-- t_ipb_mosi/t_ipb_miso 
-- If no acknowledge is required, i.e. write data are always accepted and read
-- data sent back in the next clock cycle, the 
-- t_ipb_miso.wack and t_ipb_miso.rack signals can be tied to '1'. 
--
-------------------------------------------------------------------------------
--
-------------------------------------------------------------------------------
-- Copyright (c) 2015 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- $Log: $
-------------------------------------------------------------------------------
--
-- libraries
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;

package axi4lite_pkg is

   constant c_axi4lite_addr_w   : natural := 32;
   constant c_axi4lite_data_w   : natural := 32;
   constant c_axi4lite_stb_w    : natural := c_axi4lite_data_w/8;
   constant c_axi4lite_resp_w   : natural := 2;
   
   type t_axi4lite_miso is record -- master in, slave out
      -- write address stream
      awready   : std_logic;
      -- write stream
      wready    : std_logic;
      -- write response
      bresp     : std_logic_vector(c_axi4lite_resp_w-1 downto 0);
      bvalid    : std_logic;
      -- read address stream
      arready   : std_logic;
      -- read response
      rresp     : std_logic_vector(c_axi4lite_resp_w-1 downto 0);
      rdata     : std_logic_vector(c_axi4lite_data_w-1 downto 0);
      rvalid    : std_logic;
   end record; 

   type t_axi4lite_mosi is record -- master out, slave in
      -- write address stream
      awaddr    : std_logic_vector(c_axi4lite_addr_w-1 downto 0); 
      awvalid   : std_logic;
      -- write stream
      wdata     : std_logic_vector(c_axi4lite_data_w-1 downto 0); 
      wvalid    : std_logic;
      wstrb     : std_logic_vector(c_axi4lite_stb_w-1  downto 0);
      ---- write response
      --wready    : std_logic;
      -- read address stream
      araddr    : std_logic_vector(c_axi4lite_addr_w-1 downto 0); 
      arvalid   : std_logic;
      -- read response
      rready    : std_logic;
      bready    : std_logic;
   end record; 
   
   -- multi port array for axi4 records
   type t_axi4lite_miso_arr is array (integer range <>) of t_axi4lite_miso;
   type t_axi4lite_mosi_arr is array (integer range <>) of t_axi4lite_mosi;
   
   -- blank records
   constant c_axi4lite_miso_rst : t_axi4lite_miso :=
    ('0', '0', (others=>'0'),'0', '0', (others=>'0'),(others=>'0'),'0');
    
   constant c_axi4lite_mosi_rst : t_axi4lite_mosi :=
    ((others=>'0'),'0', (others=>'0'),'0',(others=>'0'), 
     (others=>'0'),'0', '0','0');

   -- response values
   constant c_axi4lite_resp_okay  :std_logic_vector(c_axi4lite_resp_w-1 downto 0):="00";
   constant c_axi4lite_resp_exokay:std_logic_vector(c_axi4lite_resp_w-1 downto 0):="01";
   constant c_axi4lite_resp_slverr:std_logic_vector(c_axi4lite_resp_w-1 downto 0):="10";
   constant c_axi4lite_resp_decerr:std_logic_vector(c_axi4lite_resp_w-1 downto 0):="11";
  
   type t_ipb_mosi is record
      addr : std_logic_vector(c_axi4lite_addr_w-1 downto 0);
      wdat : std_logic_vector(c_axi4lite_data_w-1 downto 0);
      wreq : std_logic;
      rreq : std_logic;
   end record;
   
   type t_ipb_miso is record
      wack : std_logic;    
      rdat : std_logic_vector(c_axi4lite_data_w-1 downto 0);
      rack : std_logic;
   end record;
   
   CONSTANT c_axi4stream_tdata_w : INTEGER := 256;
   CONSTANT c_axi4stream_tid_w   : INTEGER := 32;
   CONSTANT c_axi4stream_tkeep_w : INTEGER := c_axi4stream_tdata_w/8;
   
   TYPE t_axi4stream_sosi IS RECORD
      tdata : STD_LOGIC_VECTOR(c_axi4stream_tdata_w-1 DOWNTO 0); 
      tkeep : STD_LOGIC_VECTOR(c_axi4stream_tkeep_w-1 DOWNTO 0);
      tid   : STD_LOGIC_VECTOR(c_axi4stream_tid_w-1   DOWNTO 0); 
      tlast : STD_LOGIC;
      tvalid: STD_LOGIC; 
   END RECORD;   

   TYPE t_axi4stream_siso IS RECORD
      tready : STD_LOGIC;
   END RECORD;

   CONSTANT c_axi4stream_sosi_rst : t_axi4stream_sosi := 
     ((OTHERS => '0'), (OTHERS => '0'), (OTHERS => '0'), '0', '0');
   CONSTANT c_axi4stream_siso_rst : t_axi4stream_siso := 
    (tready => '0');
end axi4lite_pkg; 
