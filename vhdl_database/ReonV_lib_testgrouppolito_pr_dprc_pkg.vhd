------------------------------------------------------------------------------
-- Copyright (c) 2014, Pascal Trotta - Testgroup (Politecnico di Torino)
-- All rights reserved.
--
-- Redistribution and use in source and binary forms, with or without modification, 
-- are permitted provided that the following conditions are met:
--
-- 1. Redistributions of source code must retain the above copyright notice, this 
--    list of conditions and the following disclaimer.
--
-- 2. Redistributions in binary form must reproduce the above copyright notice, this
--    list of conditions and the following disclaimer in the documentation and/or other 
--    materials provided with the distribution.
--
-- THIS SOURCE CODE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY 
-- EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
-- MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE 
-- COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
-- EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE 
-- GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND 
-- ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE 
-- OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
-- POSSIBILITY OF SUCH DAMAGE.
-----------------------------------------------------------------------------
-- Entity:      dprc_pkg
-- File:        dprc_pkg.vhd
-- Author:      Pascal Trotta (TestGroup research group - Politecnico di Torino)
-- Contacts:    pascal.trotta@polito.it www.testgroup.polito.it
-- Description: dprc package including types definitions, procedures and components declarations
-- Last revision: 29/09/2014
------------------------------------------------------------------------------  

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library grlib;
use grlib.amba.all;
use grlib.devices.all;
use grlib.DMA2AHB_Package.all;
library techmap;
use techmap.gencomp.all;

package dprc_pkg is

  -------------------------------------------------------------------------------
  -- Types
  -------------------------------------------------------------------------------
  -- ICAP I/O signals
  type icap_in_type is record
    idata : std_logic_vector(31 downto 0);
    wen   : std_ulogic;
    cen   : std_ulogic;    
  end record;

  type icap_out_type is record
    odata : std_logic_vector(31 downto 0);
    busy  : std_ulogic;   
  end record;

  -- read-only APB registers
  type dprc_apbregout_type is record
    status : std_logic_vector(31 downto 0);
    timer : std_logic_vector(31 downto 0);
  end record;

  -- control signals for APB registers
  type dprc_apbcontrol_type is record
    status_value : std_logic_vector(31 downto 0);
    control_clr : std_ulogic;
    status_en : std_ulogic;
    status_clr : std_ulogic;
    timer_en : std_ulogic;
    timer_clear : std_ulogic;
  end record;

  -- write/read APB registers
  type dprc_apbregin_type is record
    control : std_logic_vector(31 downto 0);
    address : std_logic_vector(31 downto 0);
    rm_reset : std_logic_vector(31 downto 0);
  end record;


  -------------------------------------------------------------------------------
  -- Functions & Procedures
  -------------------------------------------------------------------------------
  procedure icapbyteswap(signal idata : in std_logic_vector(31 downto 0); signal odata : out std_logic_vector(31 downto 0));
  procedure crc(signal idata : in std_logic_vector(31 downto 0); signal q : in std_logic_vector(31 downto 0); variable d : out std_logic_vector(31 downto 0));
  procedure gray_encoder(variable idata : in std_logic_vector; variable odata : out std_logic_vector);
  procedure gray_decoder(signal idata : in std_logic_vector; constant size : integer; variable odata : out std_logic_vector);
  procedure parity_gen(variable encoded : in std_logic_vector(38 downto 0); variable parity : out std_logic_vector(6 downto 0));
  procedure syndrome_gen_check(signal idata : in std_logic_vector(38 downto 0); signal genparity : in std_logic_vector(6 downto 0); variable odata : out std_logic_vector(31 downto 0); variable sts : out std_logic_vector(1 downto 0));
  
  -------------------------------------------------------------------------------
  -- Components
  -------------------------------------------------------------------------------

  component dprc is
    generic (              
      cfg_clkmul    : integer := 2;                       -- clkraw multiplier
      cfg_clkdiv    : integer := 1;                       -- clkraw divisor
      raw_freq      : integer := 50000;                   -- Board frequency in KHz
      clk_sel       : integer := 0;                       -- Select between clkraw and clk100 for ICAP domain clk when configured in async or d2prc mode
      hindex        : integer := 2;                       -- AMBA AHB master index
      vendorid      : integer := VENDOR_CONTRIB;          -- Vendor ID
      deviceid      : integer := CONTRIB_CORE1;           -- Device ID
      version       : integer := 1;                       -- Device version
      pindex        : integer := 13;                      -- AMBA APB slave index
      paddr         : integer := 13;                      -- Address for APB I/O BAR
      pmask         : integer := 16#fff#;                 -- Mask for APB I/O BAR
      pirq          : integer := 0;                       -- Interrupt index
      technology    : integer := virtex4;                 -- FPGA target technology
      crc_en        : integer := 0;                       -- Enable bitstream verification (d2prc-crc mode)
      edac_en       : integer := 0;                       -- Enable bitstream EDAC (d2prc-edac mode)
      words_block   : integer := 10;                      -- Number of 32-bit words in a CRC-block
      fifo_dcm_inst : integer := 1;                       -- Instantiate clock generator and fifo (async/sync mode)
      fifo_depth    : integer := 9);                      -- Number of addressing bits for the FIFO (true FIFO depth = 2**fifo_depth)
    port (
      rstn          : in  std_ulogic;                     -- Asynchronous Reset input (active low)
      clkm          : in  std_ulogic;                     -- Clock input
      clkraw        : in  std_ulogic;                     -- Raw Clock input
      clk100        : in  std_ulogic;                     -- 100 MHz Clock input
      ahbmi         : in ahb_mst_in_type;                 -- AHB master input
      ahbmo         : out ahb_mst_out_type;               -- AHB master output
      apbi          : in  apb_slv_in_type;                -- APB slave input
      apbo          : out apb_slv_out_type;               -- APB slave output
      rm_reset      : out std_logic_vector(31 downto 0)); -- Reconfigurable modules reset (1 bit for each different reconfigurable partition)
  end component;

  component d2prc_edac is
    generic (
      technology : integer := virtex4;                   -- Target technology
      fifo_depth : integer := 9);                        -- true FIFO depth = 2**fifo_depth                   
    port (
      rstn         : in  std_ulogic;                     -- Asynchronous Reset input (active low)
      clkm         : in  std_ulogic;                     -- Clock input
      clk100       : in  std_ulogic;                     -- 100 MHz Clock input
      dmai         : out DMA_In_Type;                    -- dma signals input
      dmao         : in DMA_Out_Type;                    -- dma signals output
      icapi        : out icap_in_type;                   -- icap input signals
      icapo        : in icap_out_type;                   -- icap output signals
      apbregi      : in dprc_apbregin_type;              -- values from apb registers (control, address, rm_reset)
      apbcontrol   : out dprc_apbcontrol_type;           -- control signals for apb register
      rm_reset     : out std_logic_vector(31 downto 0)); -- Reconfigurable modules reset (1 bit for each different reconfigurable partition);
  end component;

  component d2prc is
    generic (
      technology   : integer := virtex4;                 -- FPGA target technology
      fifo_depth : integer := 9;                         -- true FIFO depth = 2**fifo_depth  
      crc_block    : integer := 10);                     -- Number of 32-bit words in a CRC-block   
    port (
      rstn         : in  std_ulogic;                     -- Asynchronous Reset input (active low)
      clkm         : in  std_ulogic;                     -- Clock input
      clk100       : in  std_ulogic;                     -- 100 MHz Clock input
      dmai         : out DMA_In_Type;                    -- dma signals input
      dmao         : in DMA_Out_Type;                    -- dma signals output
      icapi        : out icap_in_type;                   -- icap input signals
      icapo        : in icap_out_type;                   -- icap output signals
      apbregi      : in dprc_apbregin_type;              -- values from apb registers (control, address, rm_reset)
      apbcontrol   : out dprc_apbcontrol_type;           -- control signals for apb register
      rm_reset     : out std_logic_vector(31 downto 0)); -- Reconfigurable modules reset (1 bit for each different reconfigurable partition));
  end component;

  component async_dprc is
    generic (
      technology : integer := virtex4;                   -- Target technology
      fifo_depth : integer := 9);                        -- true FIFO depth = 2**fifo_depth  
    port (
      rstn         : in  std_ulogic;                     -- Asynchronous Reset input (active low)
      clkm         : in  std_ulogic;                     -- Clock input
      clk100       : in  std_ulogic;                     -- 100 MHz Clock input
      dmai         : out DMA_In_Type;                    -- dma signals input
      dmao         : in DMA_Out_Type;                    -- dma signals output
      icapi        : out icap_in_type;                   -- icap input signals
      icapo        : in icap_out_type;                   -- icap output signals
      apbregi      : in dprc_apbregin_type;              -- values from apb registers (control, address, rm_reset)
      apbcontrol   : out dprc_apbcontrol_type;           -- control signals for apb register
      rm_reset     : out std_logic_vector(31 downto 0)); -- Reconfigurable modules reset (1 bit for each different reconfigurable partition));
  end component;

  component sync_dprc is
    port (
      rstn         : in  std_ulogic;                     -- Asynchronous Reset input (active low)
      clkm         : in  std_ulogic;                     -- Clock input
      dmai         : out DMA_In_Type;                    -- dma signals input
      dmao         : in DMA_Out_Type;                    -- dma signals output
      icapi        : out icap_in_type;                   -- icap input signals
      icapo        : in icap_out_type;                   -- icap output signals
      apbregi      : in dprc_apbregin_type;              -- values from apb registers (control, address, rm_reset)
      apbcontrol   : out dprc_apbcontrol_type;           -- control signals for apb register
      rm_reset     : out std_logic_vector(31 downto 0)); -- Reconfigurable modules reset (1 bit for each different reconfigurable partition));
  end component;

end package;


package body dprc_pkg is

  procedure icapbyteswap(signal idata : in std_logic_vector(31 downto 0); signal odata : out std_logic_vector(31 downto 0)) is
    begin
      for i in 0 to 3 loop
        for j in 0+i*8 to 7+i*8 loop
          odata(j)<=idata(7+i*8-(j-i*8));
        end loop;
      end loop;
    end icapbyteswap;

  procedure crc(signal idata : in std_logic_vector(31 downto 0); signal q : in std_logic_vector(31 downto 0); variable d : out std_logic_vector(31 downto 0)) is
    -------------------------------------------------------------------------------
    -- Copyright (C) 2009 OutputLogic.com
    -- This source file may be used and distributed without restriction
    -- provided that this copyright statement is not removed from the file
    -- and that any derivative work contains the original copyright notice
    -- and the associated disclaimer.
    -- 
    -- THIS SOURCE FILE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS
    -- OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
    -- WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.
    -------------------------------------------------------------------------------

    variable dv : std_logic_vector(31 downto 0);     
  begin 
      d(0) := q(0) xor q(3) xor q(6) xor q(9) xor q(12) xor q(14) xor q(15) xor q(20) xor q(21) xor q(26) xor q(27) xor q(28) xor q(29) xor q(31) xor idata(0) xor idata(3) xor idata(6) xor idata(9) xor idata(12) xor idata(14) xor idata(15) xor idata(20) xor idata(21) xor idata(26) xor idata(27) xor idata(28) xor idata(29) xor idata(31);
    
     d(1) := q(1) xor q(4) xor q(7) xor q(10) xor q(13) xor q(15) xor q(16) xor q(21) xor q(22) xor q(27) xor q(28) xor q(29) xor q(30) xor idata(1) xor idata(4) xor idata(7) xor idata(10) xor idata(13) xor idata(15) xor idata(16) xor idata(21) xor idata(22) xor idata(27) xor idata(28) xor idata(29) xor idata(30);
     
     d(2) := q(2) xor q(5) xor q(8) xor q(11) xor q(14) xor q(16) xor q(17) xor q(22) xor q(23) xor q(28) xor q(29) xor q(30) xor q(31) xor idata(2) xor idata(5) xor idata(8) xor idata(11) xor idata(14) xor idata(16) xor idata(17) xor idata(22) xor idata(23) xor idata(28) xor idata(29) xor idata(30) xor idata(31);
     
     d(3) := q(0) xor q(14) xor q(17) xor q(18) xor q(20) xor q(21) xor q(23) xor q(24) xor q(26) xor q(27) xor q(28) xor q(30) xor idata(0) xor idata(14) xor idata(17) xor idata(18) xor idata(20) xor idata(21) xor idata(23) xor idata(24) xor idata(26) xor idata(27) xor idata(28) xor idata(30);
  
     d(4) := q(1) xor q(15) xor q(18) xor q(19) xor q(21) xor q(22) xor q(24) xor q(25) xor q(27) xor q(28) xor q(29) xor q(31) xor idata(1) xor idata(15) xor idata(18) xor idata(19) xor idata(21) xor idata(22) xor idata(24) xor idata(25) xor idata(27) xor idata(28) xor idata(29) xor idata(31);
   
     d(5) := q(2) xor q(16) xor q(19) xor q(20) xor q(22) xor q(23) xor q(25) xor q(26) xor q(28) xor q(29) xor q(30) xor idata(2) xor idata(16) xor idata(19) xor idata(20) xor idata(22) xor idata(23) xor idata(25) xor idata(26) xor idata(28) xor idata(29) xor idata(30);
    
     d(6) := q(3) xor q(17) xor q(20) xor q(21) xor q(23) xor q(24) xor q(26) xor q(27) xor q(29) xor q(30) xor q(31) xor idata(3) xor idata(17) xor idata(20) xor idata(21) xor idata(23) xor idata(24) xor idata(26) xor idata(27) xor idata(29) xor idata(30) xor idata(31);
   
     d(7) := q(4) xor q(18) xor q(21) xor q(22) xor q(24) xor q(25) xor q(27) xor q(28) xor q(30) xor q(31) xor idata(4) xor idata(18) xor idata(21) xor idata(22) xor idata(24) xor idata(25) xor idata(27) xor idata(28) xor idata(30) xor idata(31);
  
     d(8) := q(5) xor q(19) xor q(22) xor q(23) xor q(25) xor q(26) xor q(28) xor q(29) xor q(31) xor idata(5) xor idata(19) xor idata(22) xor idata(23) xor idata(25) xor idata(26) xor idata(28) xor idata(29) xor idata(31);
  
     d(9) := q(6) xor q(20) xor q(23) xor q(24) xor q(26) xor q(27) xor q(29) xor q(30) xor idata(6) xor idata(20) xor idata(23) xor idata(24) xor idata(26) xor idata(27) xor idata(29) xor idata(30);
     
    d(10) := q(7) xor q(21) xor q(24) xor q(25) xor q(27) xor q(28) xor q(30) xor q(31) xor idata(7) xor idata(21) xor idata(24) xor idata(25) xor idata(27) xor idata(28) xor idata(30) xor idata(31);
    
    d(11) := q(8) xor q(22) xor q(25) xor q(26) xor q(28) xor q(29) xor q(31) xor idata(8) xor idata(22) xor idata(25) xor idata(26) xor idata(28) xor idata(29) xor idata(31);
    
    d(12) := q(9) xor q(23) xor q(26) xor q(27) xor q(29) xor q(30) xor idata(9) xor idata(23) xor idata(26) xor idata(27) xor idata(29) xor idata(30);
    
    d(13) := q(10) xor q(24) xor q(27) xor q(28) xor q(30) xor q(31) xor idata(10) xor idata(24) xor idata(27) xor idata(28) xor idata(30) xor idata(31);
    
    d(14) := q(0) xor q(3) xor q(6) xor q(9) xor q(11) xor q(12) xor q(14) xor q(15) xor q(20) xor q(21) xor q(25) xor q(26) xor q(27) xor idata(0) xor idata(3) xor idata(6) xor idata(9) xor idata(11) xor idata(12) xor idata(14) xor idata(15) xor idata(20) xor idata(21) xor idata(25) xor idata(26) xor idata(27);
    
    d(15) := q(1) xor q(4) xor q(7) xor q(10) xor q(12) xor q(13) xor q(15) xor q(16) xor q(21) xor q(22) xor q(26) xor q(27) xor q(28) xor idata(1) xor idata(4) xor idata(7) xor idata(10) xor idata(12) xor idata(13) xor idata(15) xor idata(16) xor idata(21) xor idata(22) xor idata(26) xor idata(27) xor idata(28);
    
    d(16) := q(2) xor q(5) xor q(8) xor q(11) xor q(13) xor q(14) xor q(16) xor q(17) xor q(22) xor q(23) xor q(27) xor q(28) xor q(29) xor idata(2) xor idata(5) xor idata(8) xor idata(11) xor idata(13) xor idata(14) xor idata(16) xor idata(17) xor idata(22) xor idata(23) xor idata(27) xor idata(28) xor idata(29);
    
    d(17) := q(3) xor q(6) xor q(9) xor q(12) xor q(14) xor q(15) xor q(17) xor q(18) xor q(23) xor q(24) xor q(28) xor q(29) xor q(30) xor idata(3) xor idata(6) xor idata(9) xor idata(12) xor idata(14) xor idata(15) xor idata(17) xor idata(18) xor idata(23) xor idata(24) xor idata(28) xor idata(29) xor idata(30);
    
    d(18) := q(0) xor q(3) xor q(4) xor q(6) xor q(7) xor q(9) xor q(10) xor q(12) xor q(13) xor q(14) xor q(16) xor q(18) xor q(19) xor q(20) xor q(21) xor q(24) xor q(25) xor q(26) xor q(27) xor q(28) xor q(30) xor idata(0) xor idata(3) xor idata(4) xor idata(6) xor idata(7) xor idata(9) xor idata(10) xor idata(12) xor idata(13) xor idata(14) xor idata(16) xor idata(18) xor idata(19) xor idata(20) xor idata(21) xor idata(24) xor idata(25) xor idata(26) xor idata(27) xor idata(28) xor idata(30);
    
    d(19) := q(1) xor q(4) xor q(5) xor q(7) xor q(8) xor q(10) xor q(11) xor q(13) xor q(14) xor q(15) xor q(17) xor q(19) xor q(20) xor q(21) xor q(22) xor q(25) xor q(26) xor q(27) xor q(28) xor q(29) xor q(31) xor idata(1) xor idata(4) xor idata(5) xor idata(7) xor idata(8) xor idata(10) xor idata(11) xor idata(13) xor idata(14) xor idata(15) xor idata(17) xor idata(19) xor idata(20) xor idata(21) xor idata(22) xor idata(25) xor idata(26) xor idata(27) xor idata(28) xor idata(29) xor idata(31);
    
    d(20) := q(2) xor q(5) xor q(6) xor q(8) xor q(9) xor q(11) xor q(12) xor q(14) xor q(15) xor q(16) xor q(18) xor q(20) xor q(21) xor q(22) xor q(23) xor q(26) xor q(27) xor q(28) xor q(29) xor q(30) xor idata(2) xor idata(5) xor idata(6) xor idata(8) xor idata(9) xor idata(11) xor idata(12) xor idata(14) xor idata(15) xor idata(16) xor idata(18) xor idata(20) xor idata(21) xor idata(22) xor idata(23) xor idata(26) xor idata(27) xor idata(28) xor idata(29) xor idata(30);
    
    d(21) := q(3) xor q(6) xor q(7) xor q(9) xor q(10) xor q(12) xor q(13) xor q(15) xor q(16) xor q(17) xor q(19) xor q(21) xor q(22) xor q(23) xor q(24) xor q(27) xor q(28) xor q(29) xor q(30) xor q(31) xor idata(3) xor idata(6) xor idata(7) xor idata(9) xor idata(10) xor idata(12) xor idata(13) xor idata(15) xor idata(16) xor idata(17) xor idata(19) xor idata(21) xor idata(22) xor idata(23) xor idata(24) xor idata(27) xor idata(28) xor idata(29) xor idata(30) xor idata(31);
    
    d(22) := q(4) xor q(7) xor q(8) xor q(10) xor q(11) xor q(13) xor q(14) xor q(16) xor q(17) xor q(18) xor q(20) xor q(22) xor q(23) xor q(24) xor q(25) xor q(28) xor q(29) xor q(30) xor q(31) xor idata(4) xor idata(7) xor idata(8) xor idata(10) xor idata(11) xor idata(13) xor idata(14) xor idata(16) xor idata(17) xor idata(18) xor idata(20) xor idata(22) xor idata(23) xor idata(24) xor idata(25) xor idata(28) xor idata(29) xor idata(30) xor idata(31);
    
    d(23) := q(5) xor q(8) xor q(9) xor q(11) xor q(12) xor q(14) xor q(15) xor q(17) xor q(18) xor q(19) xor q(21) xor q(23) xor q(24) xor q(25) xor q(26) xor q(29) xor q(30) xor q(31) xor idata(5) xor idata(8) xor idata(9) xor idata(11) xor idata(12) xor idata(14) xor idata(15) xor idata(17) xor idata(18) xor idata(19) xor idata(21) xor idata(23) xor idata(24) xor idata(25) xor idata(26) xor idata(29) xor idata(30) xor idata(31);
    
    d(24) := q(6) xor q(9) xor q(10) xor q(12) xor q(13) xor q(15) xor q(16) xor q(18) xor q(19) xor q(20) xor q(22) xor q(24) xor q(25) xor q(26) xor q(27) xor q(30) xor q(31) xor idata(6) xor idata(9) xor idata(10) xor idata(12) xor idata(13) xor idata(15) xor idata(16) xor idata(18) xor idata(19) xor idata(20) xor idata(22) xor idata(24) xor idata(25) xor idata(26) xor idata(27) xor idata(30) xor idata(31);
    
    d(25) := q(7) xor q(10) xor q(11) xor q(13) xor q(14) xor q(16) xor q(17) xor q(19) xor q(20) xor q(21) xor q(23) xor q(25) xor q(26) xor q(27) xor q(28) xor q(31) xor idata(7) xor idata(10) xor idata(11) xor idata(13) xor idata(14) xor idata(16) xor idata(17) xor idata(19) xor idata(20) xor idata(21) xor idata(23) xor idata(25) xor idata(26) xor idata(27) xor idata(28) xor idata(31);
    
    d(26) := q(8) xor q(11) xor q(12) xor q(14) xor q(15) xor q(17) xor q(18) xor q(20) xor q(21) xor q(22) xor q(24) xor q(26) xor q(27) xor q(28) xor q(29) xor idata(8) xor idata(11) xor idata(12) xor idata(14) xor idata(15) xor idata(17) xor idata(18) xor idata(20) xor idata(21) xor idata(22) xor idata(24) xor idata(26) xor idata(27) xor idata(28) xor idata(29);
    
    d(27) := q(9) xor q(12) xor q(13) xor q(15) xor q(16) xor q(18) xor q(19) xor q(21) xor q(22) xor q(23) xor q(25) xor q(27) xor q(28) xor q(29) xor q(30) xor idata(9) xor idata(12) xor idata(13) xor idata(15) xor idata(16) xor idata(18) xor idata(19) xor idata(21) xor idata(22) xor idata(23) xor idata(25) xor idata(27) xor idata(28) xor idata(29) xor idata(30);
    
    d(28) := q(10) xor q(13) xor q(14) xor q(16) xor q(17) xor q(19) xor q(20) xor q(22) xor q(23) xor q(24) xor q(26) xor q(28) xor q(29) xor q(30) xor q(31) xor idata(10) xor idata(13) xor idata(14) xor idata(16) xor idata(17) xor idata(19) xor idata(20) xor idata(22) xor idata(23) xor idata(24) xor idata(26) xor idata(28) xor idata(29) xor idata(30) xor idata(31);
    
    d(29) := q(0) xor q(3) xor q(6) xor q(9) xor q(11) xor q(12) xor q(17) xor q(18) xor q(23) xor q(24) xor q(25) xor q(26) xor q(28) xor q(30) xor idata(0) xor idata(3) xor idata(6) xor idata(9) xor idata(11) xor idata(12) xor idata(17) xor idata(18) xor idata(23) xor idata(24) xor idata(25) xor idata(26) xor idata(28) xor idata(30);
    
    d(30) := q(1) xor q(4) xor q(7) xor q(10) xor q(12) xor q(13) xor q(18) xor q(19) xor q(24) xor q(25) xor q(26) xor q(27) xor q(29) xor q(31) xor idata(1) xor idata(4) xor idata(7) xor idata(10) xor idata(12) xor idata(13) xor idata(18) xor idata(19) xor idata(24) xor idata(25) xor idata(26) xor idata(27) xor idata(29) xor idata(31);
    
    d(31) := q(2) xor q(5) xor q(8) xor q(11) xor q(13) xor q(14) xor q(19) xor q(20) xor q(25) xor q(26) xor q(27) xor q(28) xor q(30) xor idata(2) xor idata(5) xor idata(8) xor idata(11) xor idata(13) xor idata(14) xor idata(19) xor idata(20) xor idata(25) xor idata(26) xor idata(27) xor idata(28) xor idata(30);

  end crc;

  procedure gray_encoder(variable idata : in std_logic_vector; variable odata : out std_logic_vector) is
  begin
    for i in 0 to (idata'left)-1 loop
      odata(i) := idata(i) xor idata(i+1);
    end loop;
    odata(odata'left) := idata(idata'left);
  end gray_encoder;

  procedure gray_decoder(signal idata : in std_logic_vector; constant size : integer; variable odata : out std_logic_vector) is
    variable vdata : std_logic_vector(size downto 0);
  begin
    vdata(vdata'left) := idata(idata'left);
    for i in (idata'left)-1 downto 0 loop
      vdata(i) := idata(i) xor vdata(i+1);
    end loop;
    odata := vdata;    
  end gray_decoder;

  -- Parity calculation
  -- Inputs: encoded=39-bit received data.
  -- Output: parity=7 SECDED checkbits.
  procedure parity_gen(variable encoded : in std_logic_vector(38 downto 0); variable parity : out std_logic_vector(6 downto 0)) is
    variable idata : std_logic_vector(31 downto 0);
    variable int_parity : std_logic_vector(6 downto 0);
  begin

    idata := encoded(38) & encoded(37) & encoded(36) & encoded(35) & encoded(34) & encoded(33) & encoded(31) & encoded(30) & 
              encoded(29) & encoded(28) & encoded(27) & encoded(26) & encoded(25) & encoded(24) & encoded(23) & encoded(22) &
              encoded(21) & encoded(20) & encoded(19) & encoded(18) & encoded(17) & encoded(15) & encoded(14) & encoded(13) & 
              encoded(12) & encoded(11) & encoded(10) & encoded(9) & encoded(7) & encoded(6) & encoded(5) & encoded(3);

    int_parity(1) :=  idata(0) xor idata(1) xor idata(3) xor idata(4) xor idata(6) xor idata(8) xor idata(10) xor 
                  idata(11) xor idata(13) xor idata(15) xor idata(17) xor idata(19) xor idata(21) xor idata(23) xor 
                  idata(25) xor idata(26) xor idata(28) xor idata(30);

    int_parity(2) :=  idata(0) xor idata(2) xor idata(3) xor idata(5) xor idata(6) xor idata(9) xor idata(10) xor idata(12) xor
                  idata(13) xor idata(16) xor idata(17) xor idata(20) xor idata(21) xor idata(24) xor idata(25) xor 
                  idata(27) xor idata(28) xor idata(31);

    int_parity(3) :=  idata(1) xor idata(2) xor idata(3) xor idata(7) xor idata(8) xor idata(9) xor idata(10) xor idata(14) xor
                  idata(15) xor idata(16) xor idata(17) xor idata(22) xor idata(23) xor idata(24) xor idata(25) xor 
                  idata(29) xor idata(30) xor idata(31);

    int_parity(4) :=  idata(4) xor idata(5) xor idata(6) xor idata(7) xor idata(8) xor idata(9) xor idata(10) xor idata(18) xor
                  idata(19) xor idata(20) xor idata(21) xor idata(22) xor idata(23) xor idata(24) xor idata(25);

    int_parity(5) :=  idata(11) xor idata(12) xor idata(13) xor idata(14) xor idata(15) xor idata(16) xor idata(17) xor 
                  idata(18) xor idata(19) xor idata(20) xor idata(21) xor idata(22) xor idata(23) xor idata(24) xor idata(25);

    int_parity(6) :=  idata(26) xor idata(27) xor idata(28) xor idata(29) xor idata(30) xor idata(31);
  
    int_parity(0) :=  idata(0) xor idata(1) xor idata(2) xor idata(3) xor idata(4) xor idata(5) xor idata(6) xor idata(7) xor
                  idata(8) xor idata(9) xor idata(10) xor idata(11) xor idata(12) xor idata(13) xor idata(14) xor idata(15) xor 
                  idata(16) xor idata(17) xor idata(18) xor idata(19) xor idata(20) xor idata(21) xor idata(22) xor 
                  idata(23) xor idata(24) xor idata(25) xor idata(26) xor idata(27) xor idata(28) xor idata(29) xor 
                  idata(30) xor idata(31) xor int_parity(1) xor int_parity(2) xor int_parity(3) xor int_parity(4) xor 
                  int_parity(5) xor int_parity(6);

    parity := int_parity;
  
  end parity_gen;

  -- Syndrome generation, error detection and correction
  -- Inputs: idata=encoded 39-bit data, genparity=7 checkbits generated by parity_gen procedure.
  -- Outputs: odata=decoded 32-bit data, sts=number of detected errors.
  procedure syndrome_gen_check(signal idata : in std_logic_vector(38 downto 0); signal genparity : in std_logic_vector(6 downto 0); variable odata : out std_logic_vector(31 downto 0); variable sts : out std_logic_vector(1 downto 0)) is
    variable encoded : std_logic_vector(38 downto 0);
    variable rx_parity : std_logic_vector(6 downto 0); 
    variable syndrome : std_logic_vector(5 downto 0);
    variable err_pos : integer;
    variable overall : std_logic;
  begin
  
    encoded := idata;
    rx_parity := encoded(32)&encoded(16)&encoded(8)&encoded(4)&encoded(2)&encoded(1)&encoded(0);

    overall := rx_parity(0) xor rx_parity(1) xor rx_parity(2) xor rx_parity(3) xor rx_parity(4) xor rx_parity(5) xor rx_parity(6) xor
               genparity(0) xor genparity(1) xor genparity(2) xor genparity(3) xor genparity(4) xor genparity(5) xor genparity(6);

    syndrome := rx_parity(6 downto 1) xor genparity(6 downto 1);
    
    err_pos := to_integer(unsigned(syndrome));
    if (overall = '1') and (err_pos<39) then
      encoded(err_pos) := not encoded(err_pos);
      sts := "01";
    elsif (syndrome/= "000000") or (err_pos>38) then     
      sts := "10";
    else
      sts := "00";
    end if;
    
    odata :=  encoded(38) & encoded(37) & encoded(36) & encoded(35) & encoded(34) & encoded(33) & encoded(31) & encoded(30) & 
              encoded(29) & encoded(28) & encoded(27) & encoded(26) & encoded(25) & encoded(24) & encoded(23) & encoded(22) &
              encoded(21) & encoded(20) & encoded(19) & encoded(18) & encoded(17) & encoded(15) & encoded(14) & encoded(13) & 
              encoded(12) & encoded(11) & encoded(10) & encoded(9) & encoded(7) & encoded(6) & encoded(5) & encoded(3);

  end syndrome_gen_check;

end package body;
