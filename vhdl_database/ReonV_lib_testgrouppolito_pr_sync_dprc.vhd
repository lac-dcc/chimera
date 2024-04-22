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
-- Entity:      sync_dprc
-- File:        sync_dprc.vhd
-- Author:      Pascal Trotta (TestGroup research group - Politecnico di Torino)
-- Contacts:    pascal.trotta@polito.it www.testgroup.polito.it
-- Description: dprc sync mode (see the DPR IP-core user manual for operations details).
-- Last revision: 08/10/2014
------------------------------------------------------------------------------ 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
library grlib;
use grlib.amba.all;
use grlib.devices.all;
use grlib.DMA2AHB_Package.all;
library testgrouppolito;
use testgrouppolito.dprc_pkg.all;

entity sync_dprc is
  port (
    rstn         : in  std_ulogic;                     -- Asynchronous Reset input (active low)
    clkm         : in  std_ulogic;                     -- Clock input
    dmai         : out DMA_In_Type;                    -- dma signals input
    dmao         : in DMA_Out_Type;                    -- dma signals output
    icapi        : out icap_in_type;                   -- icap input signals
    icapo        : in icap_out_type;                   -- icap output signals
    apbregi      : in dprc_apbregin_type;              -- values from apb registers (control, address, rm_reset)
    apbcontrol   : out dprc_apbcontrol_type;           -- control signals for apb register
    rm_reset     : out std_logic_vector(31 downto 0)); -- Reconfigurable modules reset (1 bit for each different reconfigurable partition);
end sync_dprc;

architecture syncdprc_rtl of sync_dprc is
   
  type dprc_state is (IDLE, START, GRANTED, GRANTED_VERIFY, WAIT_WRITE_END, END_STATE, BUS_CNTL_ERROR, ICAP_ERROR_STATE, ABORT, ICAP_ERROR_LATENCY);
  signal present_state, next_state : dprc_state;

  type regs is record
    c_grant : std_logic_vector(19 downto 0);
    c_ready : std_logic_vector(19 downto 0);
    c_latency : std_logic_vector(2 downto 0);
    rm_reset : std_logic_vector(31 downto 0);
    address : std_logic_vector(31 downto 0);
    rst_persist : std_ulogic;
  end record;

  signal reg, regin : regs;

  signal rstact : std_ulogic;
   
begin
  
  -- fixed signals
  dmai.Data <= (others => '0');
  dmai.Beat <= HINCR;
  dmai.Size <= HSIZE32;
  dmai.Store <= '0';    --Only read transfer requests
  dmai.Reset <= not(rstn);
  dmai.Address <= reg.address;
  rm_reset <= reg.rm_reset;
  icapi.idata <= dmao.Data;

  comb: process(dmao, icapo, apbregi, rstn, present_state, rstact, reg)
    variable regv : regs;
  begin
    apbcontrol.timer_clear <= '0';
    apbcontrol.status_clr <= '0';
    dmai.Request <= '0';
    dmai.Burst <= '0';
    dmai.Lock <= '0';
    apbcontrol.status_value <= (others=>'0');
    apbcontrol.status_en <= '0';
    apbcontrol.control_clr <= '0';
    apbcontrol.timer_en <= '0';
    icapi.cen <= '1';
    icapi.wen <= '1';
    rstact <= '0';

    regv := reg;

    case present_state is
      when IDLE =>
        if (apbregi.control(19 downto 0)/=X"00000") then
          next_state <= START;
          apbcontrol.timer_clear <= '1';  -- clear timer register
          apbcontrol.status_clr <= '1';   -- clear status register
          regv.c_grant := apbregi.control(19 downto 0);
          regv.c_ready := apbregi.control(19 downto 0);
          regv.address := apbregi.address;
        else
          next_state <= IDLE;
        end if;

      when START =>
        if (dmao.Grant and dmao.Ready)='1' then
          next_state <= GRANTED;
        else
          next_state <= START;
        end if;
        dmai.Request <= '1';  -- Request data
        dmai.Burst <= '1';  -- Burst transfer
        dmai.Lock <= '1';  -- Locked transfer
        icapi.wen <= '0';  -- assert icap write enable

      when GRANTED =>
        if (icapo.odata(7) = '1') then	-- if the ICAP is correctly initialized, then monitor ICAP status
          next_state <= GRANTED_VERIFY;
          dmai.Request <= '1';  -- Request data
          dmai.Burst <= '1';  -- Burst transfer
          dmai.Lock <= '1';  -- Locked transfer
        elsif (regv.c_grant=0) then	-- if the number of granted requests is equal to the bitstream words, no more requests are needed
          next_state <= WAIT_WRITE_END;  -- This line is inserted to cover the case of Virtex-4 ICAP incorrect initialization during device programming with Impact
        else
          next_state <= GRANTED;
          dmai.Request <= '1';  -- Request data
          dmai.Burst <= '1';  -- Burst transfer
          dmai.Lock <= '1';  -- Locked transfer
        end if;
        icapi.wen <= '0';  -- assert icap write enable
        icapi.cen <= not(dmao.Ready); --if valid data, write it into ICAP

      when GRANTED_VERIFY =>
        if (icapo.odata(7) = '0') then	-- verify ICAP status for configuration errors
          next_state <= ICAP_ERROR_STATE;
        elsif (regv.c_grant=0) then	-- if the number of granted requests is equal to the bitstream words, no more requests are needed
          next_state <= WAIT_WRITE_END;
        else
          next_state <= GRANTED_VERIFY;
          dmai.Request <= '1';  -- Request data
          dmai.Burst <= '1';  -- Burst transfer
          dmai.Lock <= '1';  -- Locked transfer
        end if;
        icapi.wen <= '0';  -- assert icap write enable
        icapi.cen <= not(dmao.Ready); --if valid data, write it into ICAP

      when WAIT_WRITE_END =>
        if (icapo.odata(7) = '0') then	-- verify ICAP status for configuration errors
          next_state <= ICAP_ERROR_STATE;
        elsif (regv.c_ready=0) then
          next_state <= ICAP_ERROR_LATENCY;
        else
          next_state <= WAIT_WRITE_END;
        end if;
        icapi.wen <= '0';  -- assert icap write enable
        icapi.cen <= not(dmao.Ready); --if valid data, write it into ICAP

      when ICAP_ERROR_LATENCY =>
        if (icapo.odata(7) = '0') then	-- verify ICAP status for configuration errors
          next_state <= ICAP_ERROR_STATE;
          regv.c_latency := (others=>'0');
        elsif (regv.c_latency=4) then
          next_state <= END_STATE;
          regv.c_latency := (others=>'0');
        else
          next_state <= ICAP_ERROR_LATENCY;
          regv.c_latency := regv.c_latency+1;
        end if;
        icapi.wen <= '0';
        
      when END_STATE =>
        next_state <= IDLE;
        apbcontrol.status_value(3 downto 0) <= "1111";
        apbcontrol.status_en <= '1';  -- Write Status Register
        apbcontrol.control_clr <= '1';  -- Clear Control Register
        regv.rst_persist := '0';  
      
      when BUS_CNTL_ERROR =>
        next_state <= ABORT;
        apbcontrol.status_value(3 downto 0) <= "0100";
        apbcontrol.status_en <= '1';  -- Write Status Register
        apbcontrol.control_clr <= '1';  -- Clear Control Register
        icapi.cen <= '0'; -- Start an 'abort configuration' sequence
        regv.c_latency := (others=>'0');
	
      when ICAP_ERROR_STATE =>
        next_state <= ABORT;
        apbcontrol.status_value(3 downto 0) <= "1000";
        apbcontrol.status_en <= '1';  -- Write Status Register
        apbcontrol.control_clr <= '1';  -- Clear Control Register
        icapi.cen <= '0'; -- Start an 'abort configuration' sequence
        regv.c_latency := (others=>'0');
		
      when ABORT =>
        if (regv.c_latency=4) then
          next_state <= IDLE;
          regv.c_latency := (others=>'0');
          regv.rst_persist := '1';
        else
          next_state <= ABORT;
          regv.c_latency := regv.c_latency+1;
        end if;
        icapi.cen <= '0'; -- continue abort sequence
	
    end case;

    if (present_state/=IDLE) then
      apbcontrol.timer_en <= '1';  -- Enable timer
      rstact <= '1';
      if dmao.Ready='1' then
        regv.c_ready:=regv.c_ready-1;
      end if;
      if dmao.Grant='1' then
        regv.c_grant:=regv.c_grant-1;
        regv.address:=regv.address+4;
      end if;
    end if;	

    if (dmao.Fault or dmao.Retry)='1' then
      next_state <= BUS_CNTL_ERROR;
    end if;

    -- reconfigurable modules synchrounous reset generation (active high)
    for i in 0 to 31 loop
      regv.rm_reset(i) := not(rstn) or (apbregi.rm_reset(i) and (rstact or regv.rst_persist));
    end loop;

    -- registers assignment   
    regin <= regv;

  end process;
  
  reg_proc: process(rstn, clkm)
  begin
    if rstn='0' then
      present_state <= IDLE;
      reg.rm_reset <= (others=>'0');
      reg.c_grant <= (others=>'0');
      reg.c_ready <= (others=>'0');
      reg.c_latency <= (others=>'0');
      reg.address <= (others=>'0');
      reg.rst_persist <= '0';
    elsif rising_edge(clkm) then
      present_state <= next_state;
      reg <= regin;
    end if;
  end process;
  
end syncdprc_rtl;
