---------------------------------------------------------------------------------
--
--   Copyright 2017 - Rutherford Appleton Laboratory and University of Bristol
--
--   Licensed under the Apache License, Version 2.0 (the "License");
--   you may not use this file except in compliance with the License.
--   You may obtain a copy of the License at
--
--       http://www.apache.org/licenses/LICENSE-2.0
--
--   Unless required by applicable law or agreed to in writing, software
--   distributed under the License is distributed on an "AS IS" BASIS,
--   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--   See the License for the specific language governing permissions and
--   limitations under the License.
--
--                                     - - -
--
--   Additional information about ipbus-firmare and the list of ipbus-firmware
--   contacts are available at
--
--       https://ipbus.web.cern.ch/ipbus
--
---------------------------------------------------------------------------------



----------------------------------------------------------------------------------
-- Company: Imperial College London
--
-- Engineer: Greg Iles
--
-- Description: Testbench for SPI uC-FPGA configuration interface.
--              Run test bench for 25 us.  The test bench writes 
--              and read back from the ram.  It then writes/reads 
--              back handshake flags that are stored in the status 
--              reg.  The testbench will abort if there are any 
--              read back errors.
--
-- Revision : 1.0  -- Intial design
-- Revision : 2.0  -- Added config ready/request signals and made fpga
--                    interface compatible with ipbus.
-- Revision : 3.0  -- Added IpBus transaction request for Dave
-- Revision : 3.1  -- Split read and write RAM buffers (Dave)
-- Revision : 4.0  -- Complete rewrite... (AWR)
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity spi_interface is
generic(
  width : integer
);
port(
    -- The fpga clk/rst used to drive the SPI interface
    -- Needs to be musch faster than SPI clk   
    -- Tested with 125MHz fpga clk and 10MHz SPI clk.    
    clk:                in std_logic;
    rst:                in std_logic;
    -- SPI interface
    spi_miso:           out std_logic;
    spi_mosi:           in std_logic;
    spi_sck:            in std_logic;
    spi_cs_b:           in std_logic;

    -- IPBus interface (clk125 domain)
    --- Data to packet buffer
    buf_wdata : OUT std_logic_vector(width-1 DOWNTO 0) := (OTHERS => '0');
    --- Write enable
    buf_we    : OUT std_logic := '0';
    --- Data from packet buffer
    buf_rdata : IN std_logic_vector(width-1 DOWNTO 0);
    --- Read enable
    buf_re    : OUT std_logic := '0';
    --- Request to start processing packet
    buf_req   : OUT std_logic := '0';
    --- Processed packet data available
    buf_done  : IN std_logic := '0'
);  
end spi_interface;


architecture behave of spi_interface is

  signal sck_sreg, si_sreg, cs_sreg: std_logic_vector(2 downto 0);

--  signal SerialInError, SerialInActive, SerialInValid: std_logic;
  signal SerialInActive, SerialInValid: std_logic;
  signal SerialInRegister: std_logic_vector(width-1 downto 0);
  signal SerialInIndex: integer range 0 to width-1;
  signal SerialInTimeout: integer range 0 to 1073741823;

--  signal SerialOutError, SerialOutActive, SerialOutValid, SerialOutValidDelayed, SerialOutValidDelayed2: std_logic;
  signal SerialOutActive, SerialOutValid, SerialOutValidDelayed, SerialOutValidDelayed2: std_logic;
  signal SerialOutRegister: std_logic_vector(width-1 downto 0);
  signal SerialOutIndex: integer range 0 to width-1;
  signal SerialOutTimeout: integer range 0 to 1073741823;

  constant timeout_max: integer := 1073741823;
  signal r_nw: std_logic;

  signal status_reg: std_logic_vector(width-1 downto 0);


--  signal sck_rising_edge, sck_falling_edge: std_logic;
  signal sck_rising_edge: std_logic;

  attribute enum_encoding : string;

  type type_rx_state is (RX_IDLE, RX_ACTIVE);
  attribute enum_encoding of type_rx_state : type is "0 1";
  signal rx_state: type_rx_state := RX_IDLE;

  type type_tx_state is (TX_IDLE, TX_ACTIVE);
  attribute enum_encoding of type_tx_state : type is "0 1";
  signal tx_state: type_tx_state := TX_IDLE;

  type type_mode is ( IDLE_MODE , HEADER_MODE , READ_MODE , WRITE_MODE );
  attribute enum_encoding of type_mode : type is "00 01 10 11";
  signal mode: type_mode := IDLE_MODE;





begin

  sreg_proc: process(clk, rst)
  begin
    if rst = '1' then
      si_sreg <= (others => '0');
      cs_sreg <= (others => '0');
      sck_sreg <= (others => '0');
    elsif (clk'event and clk = '1') then
      -- Oversample SPI clk to avoid metasatbility 
      -- problems and get delayed values.  
      -- FPGA clk >> SPI clk (i.e. 125MHz >> 10MHz)
      si_sreg <= si_sreg(1 downto 0) & spi_mosi;
      cs_sreg <= cs_sreg(1 downto 0) & not spi_cs_b;
      sck_sreg <= sck_sreg(1 downto 0) & spi_sck;
    end if;
  end process;
  
--  sck_falling_edge <= '1' when sck_sreg(2 downto 1) = "10" else '0';
  sck_rising_edge <= '1' when sck_sreg(2 downto 1) = "01" else '0';



  ModeProcess: process(clk, rst)
  begin
    if rst = '1' then
      mode <= IDLE_MODE;
    elsif (clk'event and clk = '1') then

      case mode is
      when IDLE_MODE =>
        if cs_sreg(1) = '1' then
          mode <= HEADER_MODE;
        end if;

      when HEADER_MODE =>
        if cs_sreg(1) = '0' then
          mode <= IDLE_MODE;
        else
          if SerialInValid = '1' then
            if SerialInRegister( 1 ) /= '1' then
              if SerialInRegister( 0 ) = '1' then
                mode <= READ_MODE;
              else
                mode <= WRITE_MODE;
              end if;
            end if;
          end if;
        end if;

      when READ_MODE =>
        if cs_sreg(1) = '0' then
          mode <= IDLE_MODE;
        end if;

      when WRITE_MODE => 

        if cs_sreg(1) = '0' then
          mode <= IDLE_MODE;
        end if;

      end case; 

    end if;
  end process;




  SerialInProcess: process(clk, rst)
  begin
    if rst = '1' then
--      SerialInError <= '0';
      SerialInTimeout <= timeout_max;
      SerialInRegister <= x"0000";
      SerialInValid <= '0';
      SerialInIndex <= 0;
      SerialInActive <= '0';
      rx_state <= RX_IDLE;
    elsif (clk'event and clk = '1') then

 
      if cs_sreg(2 downto 1) = "10" then
        if mode = WRITE_MODE then
          buf_req <= '1';
        else
          buf_req <= '0';
        end if;
      end if;


      buf_we <= '0';
      if mode = WRITE_MODE then
        if SerialInValid = '1' then
          buf_we <= '1'; 
          buf_wdata <= SerialInRegister;
        end if;
      end if;

      case rx_state is
      when RX_IDLE => 
        -- Clear any error
--        SerialInError <= '0';
        SerialInActive <= '0';
        SerialInRegister( width-1 downto 0 ) <= (others=>'0');
        SerialInIndex <= width-1;

        -- Look to see if CS asserted
        if cs_sreg(1) = '1' then
          rx_state <= RX_ACTIVE;
          SerialInTimeout <= timeout_max;
          SerialInActive <= '1';
        end if;

      when RX_ACTIVE => 
        SerialInValid <= '0';
        -- Check for SerialInTimeout (i.e has something gone wrong...)
        if SerialInTimeout = 0 then
          rx_state <= RX_IDLE;
          SerialInActive <= '0';
--          SerialInError <= '1';
        elsif (cs_sreg(1) = '0') then
          -- Transaction ended prematurely
          rx_state <= RX_IDLE;
          SerialInActive <= '0';
--          if SerialInIndex = width-1 then
--            SerialInError <= '0';
--          else
--            SerialInError <= '1';
--          end if;
        else
--          SerialInTimeout <= SerialInTimeout - 1;
          if sck_rising_edge = '1' then
            -- Rising edge of spi_sck.  
            -- Load bits one by one...
            SerialInRegister( SerialInIndex ) <= si_sreg(1);

            if SerialInIndex = 0 then
              -- End of byte
              SerialInValid <= '1';
              SerialInIndex <= width-1;
            else  
              SerialInIndex <= SerialInIndex - 1;
            end if;

          end if;
        end if;    

      end case;
    end if;
  end process;






  SerialOutProcess: process(clk, rst)
  begin
    if rst = '1' then
--      SerialOutError <= '0';
      SerialOutTimeout <= timeout_max;
      SerialOutValid <= '0';
      SerialOutValidDelayed <= '0';
      spi_miso <= '0';
      SerialOutIndex <= 0;
      SerialOutActive <= '0';
      tx_state <= TX_IDLE;
    elsif (clk'event and clk = '1') then


      -- Use the fact that clk is a lot faster than sck_rising_edge to allow us to bring the data in on the clk one cycle after the last data valid flag
      buf_re <= '0';
      if mode = READ_MODE then
        if SerialOutValidDelayed = '1' then
           buf_re <= SerialInRegister( 0 );
        end if;
        if SerialOutValidDelayed2 = '1' then
          SerialOutRegister <= buf_rdata;
        end if;
      else
        if SerialOutValidDelayed2 = '1' then
          SerialOutRegister( 0 ) <= buf_done;
          SerialOutRegister( width-1 downto 1 ) <= ( others => '0' );
        end if;
      end if;

     SerialOutValidDelayed <= SerialOutValid;
     SerialOutValidDelayed2 <= SerialOutValidDelayed;

      case tx_state is
      when TX_IDLE => 
        -- Clear any error
--        SerialOutError <= '0';
        SerialOutActive <= '0';
        SerialOutValid <= '0';
        SerialOutValidDelayed <= '0';

        SerialOutIndex <= width-1;
        spi_miso <= '0';

        -- Look to see if CS asserted
        if cs_sreg(1) = '1' then
          tx_state <= TX_ACTIVE;
          SerialOutTimeout <= timeout_max;
          SerialOutActive <= '1';
        end if;

      when TX_ACTIVE => 
        SerialOutValid <= '0';
        -- Check for SerialOutTimeout (i.e has something gone wrong...)
        if SerialOutTimeout = 0 then
          tx_state <= TX_IDLE;
          SerialOutActive <= '0';
--          SerialOutError <= '1';
        elsif (cs_sreg(1) = '0') then
          -- Transaction ended prematurely
          tx_state <= TX_IDLE;
          SerialOutActive <= '0';
--          if SerialOutIndex = width-1 then
--            SerialOutError <= '0';
--          else
--            SerialOutError <= '1';
--          end if;
        else
--          SerialOutTimeout <= SerialOutTimeout - 1;
          if sck_rising_edge = '1' then
            -- Rising edge of spi_sck.  
            -- Load bits one by one...
            spi_miso <= SerialOutRegister( SerialOutIndex );

            if SerialOutIndex = 0 then
              -- End of byte
              SerialOutIndex <= width-1;
              SerialOutValid <= '1';
            else  
              SerialOutIndex <= SerialOutIndex - 1;
            end if;

          end if;
        end if;    

      end case;
    end if;
  end process;

end behave;





