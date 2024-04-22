-------------------------------------------------------------------------------
-- Title      : AXI4-lite base slave interface
-- Project    : SKA
-------------------------------------------------------------------------------
-- File       : axi4lite_slave_logic.vhd
-- Author     : Riccardo Chiello <riccardo.chiello@gmail.com>
-- Last modified by : $Author: comore $
-- Company    : Oxford University
-- Created    : 2015-02-12
-- Last update: 2015-02-12
-- Platform   :
-- Standard   : VHDL'93
-------------------------------------------------------------------------------
-- Description:
--
-- Basic AXI4-lite slave interface logic
-- 
-- Generates all the handshake logic for a basic AXI4-lite slave.
-- 
-- Produces as output a simple memory mapped interface, with a ready/ack
-- simple protocol. The protocol can eb furter similified by tying the ack
-- signals to '1' (transactions always immediately acknowledged). 
-- 
-- Further logic is required for register selection or more complex protocols, 
-- but this is independent from the AXI4 layer
--  
-------------------------------------------------------------------------------
--
-- Signals:
--
-- axi4lite_aclk, axi4lite_aresetn: IN STD_LOGIC   AXI4 clock and reset signals
-- axi4lite_mosi 
-- axi4lite_miso  Bus from master. MOSI = master out, slave in 
--
-- ipb_mosi Simple bus with address, data and write/read strobes
-- ipb_miso Return bus to master. Read data bus, and acknowledges
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

library work;
use work.axi4lite_pkg.all;
     
entity axi4lite_slave_logic is
   port(
      axi4lite_aclk     : in std_logic; 
      axi4lite_aresetn  : in std_logic; 
      axi4lite_mosi     : in t_axi4lite_mosi;
      axi4lite_miso     : out t_axi4lite_miso;
      
      ipb_mosi          : out t_ipb_mosi;
      ipb_miso          : in t_ipb_miso
   );
end entity;     

architecture axi4lite_slave_logic_a of axi4lite_slave_logic is 

   type fsm_enum is (idle,reading,read_wait,writing,write_wait);
   signal fsm: fsm_enum;
   signal ipb_mosi_int : t_ipb_mosi;
    
begin
   
   process(axi4lite_aclk,axi4lite_aresetn)
   begin
      if rising_edge(axi4lite_aclk) then 
         
         case fsm is 
            when idle =>
               axi4lite_miso.arready <= '1';
               axi4lite_miso.awready <= '1';
               if axi4lite_mosi.arvalid = '1' then
                  axi4lite_miso.arready <= '0';
                  axi4lite_miso.awready <= '0';
                  ipb_mosi_int.addr <= axi4lite_mosi.araddr;
                  ipb_mosi_int.rreq <= '1';
                  fsm <= reading;
               elsif axi4lite_mosi.awvalid = '1' then
                  axi4lite_miso.arready <= '0';
                  axi4lite_miso.awready <= '0';
                  ipb_mosi_int.addr <= axi4lite_mosi.awaddr;
                  fsm <= writing;
               end if;
            when reading =>
               if ipb_miso.rack = '1' then
                  axi4lite_miso.rvalid <= '1';
                  axi4lite_miso.rdata <= ipb_miso.rdat;
                  ipb_mosi_int.rreq <= '0';
                  fsm <= read_wait;
               end if;
            when read_wait =>
               if axi4lite_mosi.rready = '1' then
                  axi4lite_miso.rvalid <= '0';
                  axi4lite_miso.rdata <= (others=>'0');
                  axi4lite_miso.arready <= '1';
                  axi4lite_miso.awready <= '1';
                  fsm <= idle;
               end if;
            when writing =>
               ipb_mosi_int.wreq <= axi4lite_mosi.wvalid;
               if ipb_miso.wack = '1' and ipb_mosi_int.wreq = '1' then
                  ipb_mosi_int.wreq <= '0';
                  axi4lite_miso.bvalid <= '1';
                  axi4lite_miso.wready <= '1';
                  fsm <= write_wait;
               end if;
            when write_wait =>
               if axi4lite_mosi.bready = '1' then
                  axi4lite_miso.bvalid <= '0';
                  axi4lite_miso.wready <= '0';
                  axi4lite_miso.arready <= '1';
                  axi4lite_miso.awready <= '1';
                  fsm <= idle;
               end if;
         end case;

      end if;
      if axi4lite_aresetn = '0' then 
         axi4lite_miso.arready <= '0';
         axi4lite_miso.awready <= '0';
         axi4lite_miso.rvalid <= '0';
         axi4lite_miso.wready <= '0';
         axi4lite_miso.rdata <= (others=>'0');
         axi4lite_miso.bvalid <= '0';
         ipb_mosi_int.rreq <= '0';
         ipb_mosi_int.wreq <= '0';
         fsm <= idle;
      end if;
   end process; 
   
   ipb_mosi_int.wdat <= axi4lite_mosi.wdata;
   ipb_mosi <= ipb_mosi_int;
   
   axi4lite_miso.rresp <= c_axi4lite_resp_okay;
   axi4lite_miso.bresp <= c_axi4lite_resp_okay;

end architecture;

