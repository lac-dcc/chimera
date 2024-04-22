-- UART Transmitter with integral 16 byte FIFO buffer
--
-- 8 bit, no parity, 1 stop bit
--
-- Version : 1.00
-- Version Date : 14th October 2002
--
-- Start of design entry : 14th October 2002
--
-- Ken Chapman
-- Xilinx Ltd
-- Benchmark House
-- 203 Brooklands Road
-- Weybridge
-- Surrey KT13 ORH
-- United Kingdom
--
-- chapman@xilinx.com
--
------------------------------------------------------------------------------------
--
-- NOTICE:
--
-- Copyright Xilinx, Inc. 2002.   This code may be contain portions patented by other 
-- third parties.  By providing this core as one possible implementation of a standard,
-- Xilinx is making no representation that the provided implementation of this standard 
-- is free from any claims of infringement by any third party.  Xilinx expressly 
-- disclaims any warranty with respect to the adequacy of the implementation, including 
-- but not limited to any warranty or representation that the implementation is free 
-- from claims of any third party.  Futhermore, Xilinx is providing this core as a 
-- courtesy to you and suggests that you contact all third parties to obtain the 
-- necessary rights to use this implementation.
--
------------------------------------------------------------------------------------
--
-- Library declarations
--
-- The Unisim Library is used to define Xilinx primitives. It is also used during
-- simulation. The source can be viewed at %XILINX%\vhdl\src\unisims\unisim_VCOMP.vhd
--
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library unisim;
use unisim.vcomponents.all;
--
------------------------------------------------------------------------------------
--
-- Main Entity for UART_TX
--
entity uart_tx is
    Port (            data_in : in std_logic_vector(7 downto 0);
                 write_buffer : in std_logic;
                 reset_buffer : in std_logic;
                 en_16_x_baud : in std_logic;
                   serial_out : out std_logic;
                  buffer_full : out std_logic;
             buffer_half_full : out std_logic;
                          clk : in std_logic);
    end uart_tx;
--
------------------------------------------------------------------------------------
--
-- Start of Main Architecture for UART_TX
--	 
architecture macro_level_definition of uart_tx is
--
------------------------------------------------------------------------------------
--
-- Components used in UART_TX and defined in subsequent entities.
--	
------------------------------------------------------------------------------------
--
-- Constant (K) Compact UART Transmitter
--
component kcuart_tx 
    Port (        data_in : in std_logic_vector(7 downto 0);
           send_character : in std_logic;
             en_16_x_baud : in std_logic;
               serial_out : out std_logic;
              Tx_complete : out std_logic;
                      clk : in std_logic);
    end component;
--
-- 'Bucket Brigade' FIFO 
--
component bbfifo_16x8 
    Port (       data_in : in std_logic_vector(7 downto 0);
                data_out : out std_logic_vector(7 downto 0);
                   reset : in std_logic;               
                   write : in std_logic; 
                    read : in std_logic;
                    full : out std_logic;
               half_full : out std_logic;
            data_present : out std_logic;
                     clk : in std_logic);
    end component;
--
------------------------------------------------------------------------------------
--
-- Signals used in UART_TX
--
------------------------------------------------------------------------------------
--
signal fifo_data_out      : std_logic_vector(7 downto 0);
signal fifo_data_present  : std_logic;
signal fifo_read          : std_logic;
--
------------------------------------------------------------------------------------
--
-- Start of UART_TX circuit description
--
------------------------------------------------------------------------------------
--	
begin

  -- 8 to 1 multiplexer to convert parallel data to serial

  kcuart: kcuart_tx
  port map (        data_in => fifo_data_out,
             send_character => fifo_data_present,
               en_16_x_baud => en_16_x_baud,
                 serial_out => serial_out,
                Tx_complete => fifo_read,
                        clk => clk);


  buf: bbfifo_16x8 
  port map (       data_in => data_in,
                  data_out => fifo_data_out,
                     reset => reset_buffer,              
                     write => write_buffer,
                      read => fifo_read,
                      full => buffer_full,
                 half_full => buffer_half_full,
              data_present => fifo_data_present,
                       clk => clk);

end macro_level_definition;

------------------------------------------------------------------------------------
--
-- END OF FILE UART_TX.VHD
--
------------------------------------------------------------------------------------


