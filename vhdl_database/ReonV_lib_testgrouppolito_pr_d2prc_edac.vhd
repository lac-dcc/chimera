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
-- Entity:      d2prc_edac
-- File:        d2prc_edac.vhd
-- Author:      Pascal Trotta (TestGroup research group - Politecnico di Torino)
-- Contacts:    pascal.trotta@polito.it www.testgroup.polito.it
-- Description: dprc secded mode (see the DPR IP-core user manual for operations details).
-- Last revision: 14/08/2015
------------------------------------------------------------------------------ 

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
library grlib;
use grlib.amba.all;
use grlib.devices.all;
use grlib.DMA2AHB_Package.all;
library testgrouppolito;
use testgrouppolito.dprc_pkg.all;
library techmap;
use techmap.gencomp.all;

entity d2prc_edac is
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
end d2prc_edac;

architecture d2prc_edac_rtl of d2prc_edac is

  type icap_state is (IDLE, START, READ_LENGTH, WRITE_ICAP, WRITE_ICAP_VERIFY, END_CONFIG, ABORT, ICAP_ERROR_LATENCY, ABORT_DED);
  signal pstate, nstate : icap_state;
  
  type ahb_state is (IDLE_AHB, START_AHB, GRANTED, WAIT_WRITE_END, BUS_CNTL_ERROR, FIFO_FULL, ICAP_ERROR, SECDED_ERROR);
  signal present_state, next_state : ahb_state;

  -- fifo types
  type ififo_type is record
    wen : std_ulogic;
    waddress : std_logic_vector(fifo_depth downto 0);
    waddress_gray : std_logic_vector(fifo_depth downto 0);
    idata : std_logic_vector(31 downto 0);
    full : std_ulogic;
  end record;

  type ofifo_type is record
    ren : std_ulogic;
    raddress : std_logic_vector(fifo_depth downto 0);
    raddress_gray : std_logic_vector(fifo_depth downto 0);
    odata : std_logic_vector(31 downto 0);
    empty : std_ulogic;
  end record;

  -- cdc control signals for async_dprc
  type cdc_async is record
    start : std_ulogic;
    stop : std_ulogic;
    icap_errn : std_ulogic;
    icap_end : std_ulogic;
    secded_err : std_ulogic;
  end record;

  signal fifo_in, regfifo_in : ififo_type;
  signal fifo_out, regfifo_out : ofifo_type;
  signal raddr_sync, waddr_sync : std_logic_vector(fifo_depth downto 0);
  signal cdc_ahb, rcdc_ahb, cdc_icap, rcdc_icap : cdc_async;

  type regs_ahb is record
    c_grant : std_logic_vector(19 downto 0);
    c_ready : std_logic_vector(19 downto 0);
    c_latency : std_logic_vector(2 downto 0);
    rm_reset : std_logic_vector(31 downto 0);
    address : std_logic_vector(31 downto 0);
    rst_persist : std_ulogic;
  end record;

  type regs_icap is record
    c_bitstream : std_logic_vector(19 downto 0);
    c_latency : std_logic_vector(2 downto 0);
  end record;

  signal reg, regin : regs_ahb;
  signal regicap, reginicap :regs_icap;

  signal rstact : std_ulogic;

  type encoded_data_buffer_in is record
    renable : std_logic;
    renable_d : std_logic;
    raddress : std_logic_vector(2 downto 0);
    raddress_d : std_logic_vector(2 downto 0);
    idata : std_logic_vector(31 downto 0);
    wenable : std_logic;
    waddress : std_logic_vector(2 downto 0);
    words_cnt : std_logic_vector(19 downto 0);
  end record;
  
  signal data_buf, rdata_buf : encoded_data_buffer_in;
  signal data_buf_odata : std_logic_vector(31 downto 0);
  signal secded5, r_secded5 : std_logic_vector(31 downto 0);

  type decoding_type is record
    encoded : std_logic_vector(38 downto 0);
    parity : std_logic_vector(6 downto 0);
  end record;

  signal dec_sig, rdec_sig : decoding_type;
  signal sec_cnt, rsec_cnt, rsec_cnt_ahb : std_logic_vector(19 downto 0);

begin

  -- fixed signals
  dmai.Data <= (others => '0');
  dmai.Beat <= HINCR;
  dmai.Size <= HSIZE32;
  dmai.Store <= '0';    --Only read transfer requests
  dmai.Reset <= not(rstn);
  dmai.Address <= reg.address;
  rm_reset <= reg.rm_reset;
  fifo_in.idata <= dmao.Data;

  -------------------------------
  -- ahb bus clock domain
  -------------------------------
  ahbcomb: process(raddr_sync, regfifo_in, fifo_in, rcdc_ahb, cdc_ahb, reg, present_state, rstn, rstact, apbregi, dmao, rsec_cnt_ahb)
    variable vfifo_in : ififo_type;
    variable vcdc_ahb : cdc_async;
    variable regv : regs_ahb;
    variable raddr_sync_decoded : std_logic_vector(fifo_depth downto 0);
  begin

    apbcontrol.timer_clear <= '0';
    apbcontrol.status_clr <= '0';
    dmai.Request <= '0';
    dmai.Burst <= '0';
    dmai.Lock <= '0';
    apbcontrol.status_value(23 downto 4) <= rsec_cnt_ahb;
    apbcontrol.status_value(31 downto 24) <= (others=>'0');
    apbcontrol.status_value(3 downto 0) <= (others=>'0');
    apbcontrol.status_en <= '0';
    apbcontrol.control_clr <= '0';
    apbcontrol.timer_en <= '0';
    rstact <= '0';
    

    regv := reg;
    
    vcdc_ahb := rcdc_ahb;
    vcdc_ahb.start := '0';
    vcdc_ahb.stop := '0';

    -- initialize fifo signals
    vfifo_in.waddress := regfifo_in.waddress;
    vfifo_in.full := '0';
    fifo_in.wen <= '0';

    -- fifo full generation
    gray_decoder(raddr_sync,fifo_depth,raddr_sync_decoded);
    if (vfifo_in.waddress(fifo_depth)=raddr_sync_decoded(fifo_depth) and (vfifo_in.waddress(fifo_depth-1 downto 0)-raddr_sync_decoded(fifo_depth-1 downto 0))>(2**fifo_depth-16)) then  
        vfifo_in.full := '1';
    elsif (vfifo_in.waddress(fifo_depth)/= raddr_sync_decoded(fifo_depth) and (raddr_sync_decoded(fifo_depth-1 downto 0)-vfifo_in.waddress(fifo_depth-1 downto 0))<16) then
        vfifo_in.full := '1';
    end if;


    case present_state is
      when IDLE_AHB =>
        if (apbregi.control(19 downto 0)/=X"00000") then
          next_state <= START_AHB;
          apbcontrol.timer_clear <= '1';  -- clear timer register
          apbcontrol.status_clr <= '1';   -- clear status register
          regv.c_grant := apbregi.control(19 downto 0);
          regv.c_ready := apbregi.control(19 downto 0);
          regv.address := apbregi.address;
          vcdc_ahb.start := '1'; -- start icap write controller
        else
          next_state <= IDLE_AHB;
        end if;

      when START_AHB =>
        if (dmao.Grant and dmao.Ready)='1' then
          next_state <= GRANTED;
        else
          next_state <= START_AHB;
        end if;
        dmai.Request <= '1';  -- Request data
        dmai.Burst <= '1';  -- Burst transfer
        dmai.Lock <= '1';  -- Locked transfer
        vcdc_ahb.start := '1'; -- start icap write controller
        fifo_in.wen <= dmao.Ready;
       
      when GRANTED =>
        if (regv.c_grant=0) then	-- if the number of granted requests is equal to the bitstream words, no more requests are needed
          next_state <= WAIT_WRITE_END;
        elsif (vfifo_in.full='1') then
          next_state<=FIFO_FULL;
        else
          next_state <= GRANTED;
          dmai.Request <= '1';  -- Request data
          dmai.Burst <= '1';  -- Burst transfer
          dmai.Lock <= '1';  -- Locked transfer
        end if;
        fifo_in.wen <= dmao.Ready;

      when FIFO_FULL =>
        if ((regv.c_grant=regv.c_ready) and (vfifo_in.full='0')) then
          next_state <= GRANTED;
        else
          next_state <= FIFO_FULL;
        end if; 
        fifo_in.wen <= dmao.Ready;       

      when WAIT_WRITE_END =>
        if (cdc_ahb.icap_end='1') then 
          next_state <= IDLE_AHB;
          regv.rst_persist := '0'; 
          apbcontrol.status_value(3 downto 0) <= "1111";
          apbcontrol.status_en <= '1';  -- Write Status Register
          apbcontrol.control_clr <= '1';  -- Clear Control Register 
          vfifo_in.waddress := (others=>'0');
        else
          next_state <= WAIT_WRITE_END;
        end if;
        fifo_in.wen <= dmao.Ready;
     
      when BUS_CNTL_ERROR =>
        next_state <= IDLE_AHB;
        regv.rst_persist := '1';
        apbcontrol.status_value(3 downto 0) <= "0100";
        apbcontrol.status_en <= '1';  -- Write Status Register
        apbcontrol.control_clr <= '1';  -- Clear Control Register
        vfifo_in.waddress := (others=>'0');
        vcdc_ahb.stop := '1';
   
      when ICAP_ERROR =>
        next_state <= IDLE_AHB;
        regv.rst_persist := '1';
        apbcontrol.status_value(3 downto 0) <= "1000";
        apbcontrol.status_en <= '1';  -- Write Status Register
        apbcontrol.control_clr <= '1';  -- Clear Control Register
        vfifo_in.waddress := (others=>'0');

      when SECDED_ERROR =>
        next_state <= IDLE_AHB;
        regv.rst_persist := '1';
        apbcontrol.status_value(3 downto 0) <= "0010";
        apbcontrol.status_en <= '1';  -- Write Status Register
        apbcontrol.control_clr <= '1';  -- Clear Control Register
        vfifo_in.waddress := (others=>'0');

  end case;

    if (present_state/=IDLE_AHB) and (cdc_ahb.icap_errn='0') then
      next_state <= ICAP_ERROR;
    end if;

    if (present_state/=IDLE_AHB) and (cdc_ahb.secded_err='1') then
      next_state <= SECDED_ERROR;
    end if;

    if (present_state/=IDLE_AHB) then
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
      vcdc_ahb.stop := '1';
    end if;

    -- write fifo
    if fifo_in.wen = '1' then
      vfifo_in.waddress := vfifo_in.waddress +1;
    end if;
    gray_encoder(vfifo_in.waddress,vfifo_in.waddress_gray);

    -- latched fifo write address
    fifo_in.waddress <= vfifo_in.waddress;
    fifo_in.waddress_gray <= vfifo_in.waddress_gray;
  
    -- update fifo full
    fifo_in.full <= vfifo_in.full;

    -- reconfigurable modules synchrounous reset generation (active high)
    for i in 0 to 31 loop
      regv.rm_reset(i) := not(rstn) or (apbregi.rm_reset(i) and (rstact or regv.rst_persist));
    end loop;

    -- registers assignment 
    cdc_ahb.start <= vcdc_ahb.start;
    cdc_ahb.stop <= vcdc_ahb.stop;
    regin <= regv;

end process;

  ahbreg: process(clkm,rstn)
  begin
    if rstn='0' then
      regfifo_in.waddress <= (others =>'0');
      regfifo_in.waddress_gray <= (others =>'0');
      rcdc_ahb.start <= '0';
      rcdc_ahb.stop <= '0';
      present_state <= IDLE_AHB;
      reg.rm_reset <= (others=>'0');
      reg.c_grant <= (others=>'0');
      reg.c_ready <= (others=>'0');
      reg.c_latency <= (others=>'0');
      reg.address <= (others=>'0');
      reg.rst_persist <= '0';
    elsif rising_edge(clkm) then
      regfifo_in <= fifo_in;
      rcdc_ahb <= cdc_ahb;
      present_state <= next_state;
      reg <= regin;
    end if;
  end process;

  -------------------------------
  -- synchronization registers
  -------------------------------
  -- input d is already registered in the source clock domain
  syn_gen0: for i in 0 to fifo_depth generate  -- fifo addresses
    syncreg_inst0: syncreg generic map (tech => technology, stages => 2)
    port map(clk => clk100, d => regfifo_in.waddress_gray(i), q => waddr_sync(i));

    syncreg_inst1: syncreg generic map (tech => technology, stages => 2)
    port map(clk => clkm, d => regfifo_out.raddress_gray(i), q => raddr_sync(i));
  end generate;

  -- CDC control signals
  syncreg_inst2: syncreg generic map (tech => technology, stages => 2)
    port map(clk => clkm, d => rcdc_icap.icap_errn, q => cdc_ahb.icap_errn);
  syncreg_inst3: syncreg generic map (tech => technology, stages => 2)
    port map(clk => clkm, d => rcdc_icap.icap_end, q => cdc_ahb.icap_end);
  syncreg_inst4: syncreg generic map (tech => technology, stages => 2)
    port map(clk => clk100, d => rcdc_ahb.start, q => cdc_icap.start);
  syncreg_inst5: syncreg generic map (tech => technology, stages => 2)
    port map(clk => clk100, d => rcdc_ahb.stop, q => cdc_icap.stop);
  syncreg_inst6: syncreg generic map (tech => technology, stages => 2)
    port map(clk => clkm, d => rcdc_icap.secded_err, q => cdc_ahb.secded_err);

  syn_gen1: for i in 0 to 19 generate
    syncreg_inst1: syncreg generic map (tech => technology, stages => 2)
    port map(clk => clkm, d => rsec_cnt(i), q => rsec_cnt_ahb(i));
  end generate;

  -------------------------------
  -- icap clock domain
  -------------------------------
  icapcomb: process(waddr_sync, regfifo_out, fifo_out, cdc_icap, pstate, regicap, icapo, rdata_buf, data_buf_odata, rdec_sig, r_secded5, rsec_cnt)
    variable vfifo_out : ofifo_type;
    variable vcdc_icap : cdc_async;
    variable vregicap : regs_icap;
    variable vdata_buf : encoded_data_buffer_in;
    variable vdec_sig : decoding_type;
    variable checkbits : std_logic_vector(31 downto 0);
    variable v_secded5 : std_logic_vector(31 downto 0);
    variable status : std_logic_vector(1 downto 0);
    variable vsec_cnt : std_logic_vector(19 downto 0);
    variable decoded_data : std_logic_vector(31 downto 0);
  begin
    icapi.cen <= '1';
    icapi.wen <= '1';

    vcdc_icap.icap_end := '0';
    vcdc_icap.icap_errn := '1';
    vcdc_icap.secded_err := '0';
    
    vregicap := regicap;

    -- initialize buffer signals
    vdata_buf.renable := rdata_buf.renable;
    vdata_buf.renable_d := vdata_buf.renable;
    vdata_buf.wenable := '0';
    vdata_buf.idata := fifo_out.odata;
    vdata_buf.raddress := rdata_buf.raddress;
    vdata_buf.raddress_d := vdata_buf.raddress;
    vdata_buf.waddress := rdata_buf.waddress;
    vdata_buf.words_cnt := rdata_buf.words_cnt;
    vdec_sig := rdec_sig;
    v_secded5 := r_secded5;

    vsec_cnt := rsec_cnt;

    -- initialize fifo signals
    vfifo_out.raddress := regfifo_out.raddress;
    vfifo_out.empty := '0';
    vfifo_out.ren := '0';

    -- fifo empty generation
    gray_encoder(vfifo_out.raddress,vfifo_out.raddress_gray);
    if (vfifo_out.raddress_gray=waddr_sync) then  
        vfifo_out.empty := '1';
    end if;
 
    case pstate is
      when IDLE =>
        if (cdc_icap.start='1') then
          nstate <= START;
        else
          nstate <= IDLE;
        end if;
        vdata_buf.words_cnt := (others => '0');

      when START =>
        if (fifo_out.empty='0') then
          vfifo_out.ren := '1';
          nstate <= READ_LENGTH;
        else
          nstate <= START;
        end if;
        icapi.wen <= '0';
        vsec_cnt := (others=>'0'); -- reset SEC counter

      when READ_LENGTH =>
        nstate <= WRITE_ICAP;
        -- Extract bitstream length removing out checkbits (i.e, bitstream length is represented on 20 bits, its value will be checked later)
        vregicap.c_bitstream := fifo_out.odata(25 downto 17)&fifo_out.odata(15 downto 9)&fifo_out.odata(7 downto 5)&fifo_out.odata(3);
        if (fifo_out.empty='0') then
          vfifo_out.ren := '1';
        end if;
        icapi.wen <= '0';

      when WRITE_ICAP =>
        if (icapo.odata(7) = '1') then	-- if the ICAP is correctly initialized, then monitor ICAP status
          nstate <= WRITE_ICAP_VERIFY;
        elsif (vregicap.c_bitstream=0) then
          nstate <= ICAP_ERROR_LATENCY;
        elsif (fifo_out.empty='0') then
          nstate <= WRITE_ICAP;
          vfifo_out.ren := '1';
        else
          nstate <= WRITE_ICAP;
        end if;
        icapi.wen <= '0';
        if vdata_buf.words_cnt/=x"00000" then  -- do not send first word to ICAP (i.e., bitstream words count)
          icapi.cen <= not(rdata_buf.renable_d);
        end if;

      when WRITE_ICAP_VERIFY =>        
        if (icapo.odata(7) = '0') then	-- verify ICAP status for configuration errors
          nstate <= ABORT;
          vcdc_icap.icap_errn:='0';  -- signal icap error to the ahb clock domain
        elsif (vregicap.c_bitstream=0) then
          nstate <= ICAP_ERROR_LATENCY;
        elsif (fifo_out.empty='0') then
          nstate <= WRITE_ICAP_VERIFY;
          vfifo_out.ren := '1';
        else
          nstate <= WRITE_ICAP_VERIFY;
        end if;
        icapi.wen <= '0';
        if vdata_buf.words_cnt/=x"00000" then
          icapi.cen <= not(rdata_buf.renable_d);
        end if;

      when END_CONFIG =>
        nstate <= IDLE;
        vfifo_out.raddress := (others=>'0');
        vcdc_icap.icap_end := '1';

      when ABORT =>
        if (vregicap.c_latency=4) then
          nstate <= IDLE;
          vregicap.c_latency := (others=>'0');
        else
          nstate <= ABORT;
          vregicap.c_latency := vregicap.c_latency+1;
        end if;
        icapi.cen <= '0'; -- continue abort sequence
        vcdc_icap.icap_errn:='0';  -- signal icap error to the ahb clock domain
        vfifo_out.raddress := (others=>'0');

      when ABORT_DED =>
        if (vregicap.c_latency=4) then
          nstate <= IDLE;
          vregicap.c_latency := (others=>'0');
        else
          nstate <= ABORT_DED;
          vregicap.c_latency := vregicap.c_latency+1;
        end if;
        icapi.cen <= '0'; -- continue abort sequence
        vcdc_icap.secded_err := '1'; -- uncorrectable error
        vfifo_out.raddress := (others=>'0');
        vdata_buf.raddress := (others=>'0');
        vdata_buf.waddress := (others=>'0');
        vdata_buf.renable  := '0';

      when ICAP_ERROR_LATENCY =>
         if (icapo.odata(7) = '0') then	-- verify ICAP status for configuration errors
          nstate <= ABORT;
          vregicap.c_latency := (others=>'0');
          vcdc_icap.icap_errn:='0';  -- signal icap error to the ahb clock domain
        elsif (vregicap.c_latency=7) then -- to ensure that the last SECDED has been also verified
          nstate <= END_CONFIG;
          vregicap.c_latency := (others=>'0');
          vcdc_icap.icap_end := '1';
        else
          nstate <= ICAP_ERROR_LATENCY;
          vregicap.c_latency := vregicap.c_latency+1;
        end if;
        icapi.wen <= '0';
        icapi.cen <= not(rdata_buf.renable_d);

    end case; 

    if (cdc_icap.stop='1') then
     nstate <= ABORT;
     vregicap.c_latency := (others=>'0');
     vfifo_out.ren := '1';
    end if;
    
    -- read fifo
    if vfifo_out.ren = '1' then
      vfifo_out.raddress := vfifo_out.raddress +1;
    end if;

    if regfifo_out.ren = '1' then
      vregicap.c_bitstream := vregicap.c_bitstream -1; -- because fifo introduces 1-cycle latency on output data
    end if;

    -- latched fifo read address
    fifo_out.raddress <= vfifo_out.raddress;
    fifo_out.raddress_gray <= vfifo_out.raddress_gray;

    -- update fifo empty
    fifo_out.empty <= vfifo_out.empty;

    cdc_icap.icap_errn <= vcdc_icap.icap_errn;
    cdc_icap.icap_end <= vcdc_icap.icap_end;
    cdc_icap.secded_err <= vcdc_icap.secded_err;
    reginicap <= vregicap;
    fifo_out.ren <= vfifo_out.ren;

    -- read data from FIFO and write into 4-elements RAM (the 5th element of each SECDED group is stored in a register)
    if (regfifo_out.ren = '1') then
      if (rdata_buf.waddress/="100") then
        vdata_buf.wenable := '1';
        vdata_buf.waddress := vdata_buf.waddress + '1';
      else
        vdata_buf.waddress := (others=>'0');
        v_secded5 := fifo_out.odata;
        vdata_buf.renable := '1'; -- start decoding at the next cycle
      end if;
    end if;

    -- decoding and error correction/detection
    if rdata_buf.raddress="100" then
      vdata_buf.renable := '0';
      vdata_buf.raddress := (others=>'0');
    end if;
    if vdata_buf.renable = '1' then
      vdata_buf.raddress := vdata_buf.raddress + '1';
    end if;
    if rdata_buf.renable = '1' then
      vdec_sig.encoded := r_secded5(to_integer(unsigned(rdata_buf.raddress_d))*8+6 downto to_integer(unsigned(rdata_buf.raddress_d))*8)&data_buf_odata;
    end if;

    parity_gen(vdec_sig.encoded,vdec_sig.parity);
    syndrome_gen_check(rdec_sig.encoded, rdec_sig.parity, decoded_data, status);
    icapi.idata <= decoded_data;

    if rdata_buf.renable_d='1' then
      if ((status="10") or ((status="01") and (vdata_buf.words_cnt=x"00000"))) then -- abort is double error or if single error on bitstream size word
        nstate <= ABORT_DED;
      elsif status="01" then
        vsec_cnt := rsec_cnt + '1';
      end if;
    end if; 

    if rdata_buf.renable_d = '1' then
      vdata_buf.words_cnt := vdata_buf.words_cnt + '1'; -- counts words sent to the ICAP (debug) 
    end if;
    dec_sig <= vdec_sig;

    -- update buffer signals
    data_buf <= vdata_buf;
    secded5 <= v_secded5;
    sec_cnt <= vsec_cnt;
  end process;

  icapreg: process(clk100,rstn)
  begin
    if rstn='0' then
      regfifo_out.raddress <= (others =>'0');
      regfifo_out.raddress_gray <= (others =>'0');
      regfifo_out.ren <= '0';
      regicap.c_bitstream <= (others =>'0');
      regicap.c_latency <= (others =>'0');
      rcdc_icap.start <= '0';
      rcdc_icap.stop <= '0';
      rcdc_icap.secded_err <= '0';
      rdata_buf.raddress <= (others =>'0');
      rdata_buf.raddress_d <= (others =>'0');
      rdata_buf.waddress <= (others =>'0');
      rdata_buf.renable <= '0';
      rdata_buf.renable_d <= '0';
      rdata_buf.idata <= (others =>'0');
      rdata_buf.wenable <= '0';
      rdata_buf.words_cnt <= (others =>'0');
      rdec_sig.encoded <= (others=>'0');
      rdec_sig.parity <= (others=>'0');
      r_secded5 <= (others=>'0');
      rsec_cnt <= (others=>'0');
    elsif rising_edge(clk100) then
      regfifo_out <= fifo_out;
      pstate <= nstate;
      regicap <= reginicap;
      rcdc_icap <= cdc_icap;
      rdata_buf <= data_buf;
      rdec_sig <= dec_sig;
      r_secded5 <= secded5;
      rsec_cnt <= sec_cnt;
    end if;
  end process;

  ram0 : syncram_2p generic map ( tech => technology, abits => fifo_depth, dbits => 32, sepclk => 1) -- 2**fifo_depth 32-bit data RAM
  port map (clk100, fifo_out.ren, fifo_out.raddress(fifo_depth-1 downto 0), fifo_out.odata, clkm, fifo_in.wen, fifo_in.waddress(fifo_depth-1 downto 0), fifo_in.idata);

  ram1 : syncram_2p generic map ( tech => technology, abits => 2, dbits => 32, sepclk => 0)
  port map (clk100, data_buf.renable, rdata_buf.raddress(1 downto 0), data_buf_odata, clk100, data_buf.wenable, rdata_buf.waddress(1 downto 0), data_buf.idata);

end d2prc_edac_rtl;
