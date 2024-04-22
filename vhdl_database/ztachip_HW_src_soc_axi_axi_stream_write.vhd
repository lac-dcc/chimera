------------------------------------------------------------------------------
-- Copyright [2014] [Ztachip Technologies Inc]
--
-- Author: Vuong Nguyen
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
-- http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
------------------------------------------------------------------------------

-----------------------------------------------------------------------------
-- Engine for writing to DDR from AXI-stream write interface
-----------------------------------------------------------------------------

library std;
use std.standard.all;
LIBRARY ieee;
USE ieee.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.ztachip_pkg.all;

entity axi_stream_write is
   generic (
      WRITE_BUF_DEPTH       : integer:=4;
      WRITE_STREAM_DEPTH    : integer:=9;
      WRITE_PAGE_SIZE       : integer;
      WRITE_MAX_PENDING     : integer
   );
   port 
   (
      signal clock_in          : IN std_logic;
      signal reset_in          : IN std_logic;
      
      -- DDR write bus
      
      signal ddr_awaddr_out    : OUT axi_awaddr_t;
      signal ddr_awlen_out     : OUT axi_awlen_t;
      signal ddr_awvalid_out   : OUT axi_awvalid_t;
      signal ddr_wvalid_out    : OUT axi_wvalid_t;
      signal ddr_wdata_out     : OUT axi_wdata64_t;
      signal ddr_wlast_out     : OUT axi_wlast_t;
      signal ddr_wstrb_out     : OUT axi_wstrb8_t;
      signal ddr_awready_in    : IN axi_awready_t;
      signal ddr_wready_in     : IN axi_wready_t;
      signal ddr_bresp_in      : IN axi_bresp_t;
      signal ddr_bid_in        : IN axi_bid_t;
      signal ddr_bvalid_in     : IN axi_bvalid_t;
      signal ddr_awburst_out   : OUT axi_awburst_t;
      signal ddr_awcache_out   : OUT axi_awcache_t;
      signal ddr_awid_out      : OUT axi_awid_t;
      signal ddr_awlock_out    : OUT axi_awlock_t;
      signal ddr_awprot_out    : OUT axi_awprot_t;
      signal ddr_awqos_out     : OUT axi_awqos_t;
      signal ddr_awsize_out    : OUT axi_awsize_t;
      signal ddr_bready_out    : OUT axi_bready_t;
      
      -- Streaming write bus (camera->DDR)
      
      signal s_wclk_in         : in std_logic;
      signal s_wdata_in        : in std_logic_vector(31 downto 0);
      signal s_wready_out      : out std_logic;
      signal s_wvalid_in       : in std_logic;
      signal s_wlast_in        : in std_logic;
      
      -- APB bus signal
      
      signal apb_paddr          : IN STD_LOGIC_VECTOR(19 downto 0);
      signal apb_penable        : IN STD_LOGIC;
      signal apb_pready         : OUT STD_LOGIC;
      signal apb_pwrite         : IN STD_LOGIC;
      signal apb_pwdata         : IN STD_LOGIC_VECTOR(31 downto 0);
      signal apb_prdata         : OUT STD_LOGIC_VECTOR(31 downto 0);
      signal apb_pslverror      : OUT STD_LOGIC;
      
      -- Ready out
      signal ready_out          : OUT STD_LOGIC
   );
end axi_stream_write;

architecture rtl of axi_stream_write is

signal write_fifo_empty:std_logic;
signal write_fifo_full:std_logic;
signal write_fifo_read:std_logic_vector(63 downto 0);
signal write_fifo_write:std_logic_vector(63 downto 0);
signal write_req_r:signed(7 downto 0);
signal write_rsp_r:signed(7 downto 0);
signal write_size_r:unsigned(23 downto 0);
signal ddr_awaddr_r:axi_awaddr_t;
signal ready_r:std_logic;
signal s_wnext:unsigned(WRITE_BUF_DEPTH-1 downto 0);
signal s_wcurr_r:unsigned(WRITE_BUF_DEPTH-1 downto 0);
signal s_wcurr_next:unsigned(WRITE_BUF_DEPTH-1 downto 0);
signal valid:std_logic;
signal s_wbuf_r :axi_awaddrs_t(2**WRITE_BUF_DEPTH-1 downto 0);
signal apb_wvdma_enable_match:std_logic;
signal apb_wvdma_buf0_match:std_logic;
signal apb_wvdma_buf1_match:std_logic;
signal apb_wvdma_buf2_match:std_logic;
signal apb_wvdma_buf3_match:std_logic;
signal apb_wvdma_get_curr_match:std_logic;
signal apb_match:std_logic;
signal ready:std_logic;
signal full2:std_logic;
signal xfer:std_logic;
signal write_fifo_empty2:std_logic;
signal write_fifo_read2:std_logic_vector(63 downto 0);
signal burst_remain_r:unsigned(WRITE_STREAM_DEPTH-1 downto 0);
signal ravail:std_logic_vector(WRITE_STREAM_DEPTH-1 downto 0);
signal s_wdata_r:std_logic_vector(31 downto 0);
signal toggle_r:std_logic;
signal s_write:std_logic;
constant stride_c:integer:=8;
begin

s_wcurr_next <= s_wcurr_r+to_unsigned(1,s_wcurr_r'length);

s_wready_out <= (not write_fifo_full) and ready;

s_wnext <= s_wcurr_r+to_unsigned(1,s_wcurr_r'length);
    
apb_wvdma_enable_match <= '1' when (apb_paddr(apb_addr_len_c-1 downto 0)=std_logic_vector(to_unsigned(apb_wvdma_enable_c,apb_addr_len_c)))
                          else '0';

apb_wvdma_buf0_match <= '1' when (apb_paddr(apb_addr_len_c-1 downto 0)=std_logic_vector(to_unsigned(apb_wvdma_buf0_c,apb_addr_len_c)))
                          else '0';
                          
apb_wvdma_buf1_match <= '1' when (apb_paddr(apb_addr_len_c-1 downto 0)=std_logic_vector(to_unsigned(apb_wvdma_buf1_c,apb_addr_len_c)))
                          else '0';
                          
apb_wvdma_buf2_match <= '1' when (apb_paddr(apb_addr_len_c-1 downto 0)=std_logic_vector(to_unsigned(apb_wvdma_buf2_c,apb_addr_len_c)))
                          else '0';
    
apb_wvdma_buf3_match <= '1' when (apb_paddr(apb_addr_len_c-1 downto 0)=std_logic_vector(to_unsigned(apb_wvdma_buf3_c,apb_addr_len_c)))
                          else '0';

apb_wvdma_get_curr_match <= '1' when (apb_paddr(apb_addr_len_c-1 downto 0)=std_logic_vector(to_unsigned(apb_wvdma_get_curr_c,apb_addr_len_c)))
                          else '0';
                          
apb_match <= '1' when (apb_wvdma_enable_match='1' or apb_wvdma_buf0_match='1' or
                       apb_wvdma_buf1_match='1' or apb_wvdma_buf2_match='1' or
                       apb_wvdma_buf3_match='1' or apb_wvdma_get_curr_match='1')
                       else
                       '0'; 
                  
apb_pready <= '1' when (apb_match='1' and apb_penable='1') else 'Z';

apb_pslverror <= '0' when (apb_match='1' and apb_penable='1') else 'Z';                      
     
apb_prdata(apb_prdata'length-1 downto s_wcurr_r'length) <= 
                                           (others=>'0') 
                                           when 
                                           (apb_wvdma_get_curr_match='1' and apb_penable='1' and apb_pwrite='0') 
                                           else 
                                           (others=>'Z');
                                           
apb_prdata(s_wcurr_r'length-1 downto 0) <= std_logic_vector(s_wcurr_r) 
                                           when 
                                           (apb_wvdma_get_curr_match='1' and apb_penable='1' and apb_pwrite='0') 
                                           else 
                                           (others=>'Z');   
ready_out <= ready_r;
      
sync_i:CCD_SYNC
   generic map
   (
      WIDTH=>1
   )
   port map 
   (
      reset_in=>reset_in,
      inclock_in=>clock_in,
      outclock_in=>s_wclk_in,
      input_in(0)=>ready_r,
      output_out(0)=>ready
   );
     
write_fifo_write <= s_wdata_in & s_wdata_r;
       
s_write <= '1' when (s_wvalid_in='1' and toggle_r='1') else '0';

write_fifo:afifo
   generic map
   (
      DATA_WIDTH=>64,
      FIFO_DEPTH=>5
   )
   port map 
   (
      rclock_in=>clock_in,
      wclock_in=>s_wclk_in,
      reset_in=>reset_in,
      data_in=>write_fifo_write,
      write_in=>s_write,
      read_in=>xfer,
      q_out=>write_fifo_read2,
      empty_out=>write_fifo_empty2,
      full_out=>write_fifo_full
   );

xfer <= '1' when write_fifo_empty2='0' and full2='0' else '0';

write_fifo2:scfifo
   generic map
   (
      DATA_WIDTH=>64,
      FIFO_DEPTH=>WRITE_STREAM_DEPTH,
      LOOKAHEAD=>TRUE
   )
   port map 
   (
      clock_in=>clock_in,
      reset_in=>reset_in,
      data_in=>write_fifo_read2,
      write_in=>xfer,
      read_in=>valid,
      q_out=>write_fifo_read,
      empty_out=>write_fifo_empty,
      ravail_out=>ravail,
      full_out=>full2
   );

valid <= '1' when (burst_remain_r /= to_unsigned(0,burst_remain_r'length)) and 
                  (ddr_wready_in='1') and
                  (ddr_awready_in='1') 
                  else '0';

ddr_awaddr_out <= ddr_awaddr_r;
ddr_awvalid_out <= valid;
ddr_wvalid_out <= valid;
ddr_awlen_out <= (others=>'0');
ddr_wdata_out <= write_fifo_read;
ddr_wlast_out <= '1';
ddr_wstrb_out <= (others=>'1');
ddr_awburst_out <= "01";
ddr_awcache_out <= "0000";
ddr_awid_out <= "0";
ddr_awlock_out <= "0";
ddr_awprot_out <= "000";
ddr_awqos_out <= "0000";
ddr_awsize_out <= "011";
ddr_bready_out <= '1';

process(s_wclk_in,reset_in)
begin
   if reset_in='0' then
      s_wdata_r <= (others=>'0');
      toggle_r <= '0';
   else
      if s_wclk_in'event and s_wclk_in='1' then
         if(s_wvalid_in='1') then
            s_wdata_r <= s_wdata_in;
            toggle_r <= not toggle_r;
         end if;
      end if;
   end if;
end process;   

process(clock_in,reset_in)
begin
   if reset_in='0' then
      write_req_r <= (others=>'0');
      write_rsp_r <= (others=>'0');
      write_size_r <= (others=>'0');
      ddr_awaddr_r <= (others=>'0');
      s_wcurr_r <= (others=>'0');  
      s_wbuf_r <= (others=>(others=>'0'));  
      ready_r <= '0';
      burst_remain_r <= (others=>'0');
   else
      if clock_in'event and clock_in='1' then
         if valid='1' then
            -- Just succesfully send a write
            burst_remain_r <= burst_remain_r - to_unsigned(1,burst_remain_r'length);
            write_req_r <= write_req_r + to_signed(1,write_req_r'length);
            if(write_size_r < to_unsigned(WRITE_PAGE_SIZE-stride_c,write_size_r'length)) then
               -- Continue on current page
               write_size_r <= write_size_r + to_unsigned(stride_c,write_size_r'length);
               ddr_awaddr_r <= std_logic_vector(unsigned(ddr_awaddr_r) + to_unsigned(stride_c,ddr_awaddr_r'length));
            else
               -- Advance to next page
               write_size_r <= (others=>'0');
               ddr_awaddr_r <= s_wbuf_r(to_integer(s_wnext));
               s_wcurr_r <= s_wnext; 
            end if;
         elsif(burst_remain_r=to_unsigned(0,burst_remain_r'length) and 
               unsigned(write_req_r)=unsigned(write_rsp_r) and
               unsigned(ravail) > to_unsigned(WRITE_MAX_PENDING,ravail'length)) then
            -- Let start another burst if current burst is complete and acknowledge and
            -- there are enough data on FIFO for the next burst
            burst_remain_r <= to_unsigned(WRITE_MAX_PENDING,burst_remain_r'length);
         end if;
         
         if(ddr_bvalid_in='1') then
            write_rsp_r <= write_rsp_r+to_signed(1,write_rsp_r'length);
         end if;
            
            -- Process APB bus request
            
         if(apb_penable='1') then
            if(apb_wvdma_enable_match='1') then
               ready_r <= apb_pwdata(0);
               if(apb_pwdata(0)='1') then
                  write_size_r <= (others=>'0');
                  s_wcurr_r <= (others=>'0');
                  ddr_awaddr_r <= s_wbuf_r(0);
               end if;
            end if;
            if(apb_wvdma_buf0_match='1') then
               s_wbuf_r(0) <= apb_pwdata;
            end if;
            if(apb_wvdma_buf1_match='1') then
               s_wbuf_r(1) <= apb_pwdata;
            end if;
            if(apb_wvdma_buf2_match='1') then
               s_wbuf_r(2) <= apb_pwdata;
            end if;
            if(apb_wvdma_buf3_match='1') then
               s_wbuf_r(3) <= apb_pwdata;
            end if;
         end if;          
      end if;
   end if;
end process;

end rtl;