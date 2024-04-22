-- UART Receiver with integral 16 byte FIFO buffer
--
-- 8 bit, no parity, 1 stop bit
--
-- Version : 1.00
-- Version Date : 16th October 2002
--
-- Start of design entry : 16th October 2002
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
-- Main Entity for UART_RX
--
entity uart_rx is
    Port (            serial_in : in std_logic;
                       data_out : out std_logic_vector(7 downto 0);
                    read_buffer : in std_logic;
                   reset_buffer : in std_logic;
                   en_16_x_baud : in std_logic;
            buffer_data_present : out std_logic;
                    buffer_full : out std_logic;
               buffer_half_full : out std_logic;
                            clk : in std_logic);
    end uart_rx;
--
------------------------------------------------------------------------------------
--
-- Start of Main Architecture for UART_RX
--	 
architecture macro_level_definition of uart_rx is
--
------------------------------------------------------------------------------------
--
-- Components used in UART_RX and defined in subsequent entities.
--	
------------------------------------------------------------------------------------
--
-- Constant (K) Compact UART Receiver
--
component kcuart_rx 
    Port (      serial_in : in std_logic;  
                 data_out : out std_logic_vector(7 downto 0);
              data_strobe : out std_logic;
             en_16_x_baud : in std_logic;
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
-- Signals used in UART_RX
--
------------------------------------------------------------------------------------
--
signal uart_data_out      : std_logic_vector(7 downto 0);
signal fifo_write          : std_logic;
--
------------------------------------------------------------------------------------
--
-- Start of UART_RX circuit description
--
------------------------------------------------------------------------------------
--	
begin

  -- 8 to 1 multiplexer to convert parallel data to serial

  kcuart: kcuart_rx
  port map (     serial_in => serial_in,
                  data_out => uart_data_out,
               data_strobe => fifo_write,
              en_16_x_baud => en_16_x_baud,
                       clk => clk );


  buf: bbfifo_16x8 
  port map (       data_in => uart_data_out,
                  data_out => data_out,
                     reset => reset_buffer,              
                     write => fifo_write,
                      read => read_buffer,
                      full => buffer_full,
                 half_full => buffer_half_full,
              data_present => buffer_data_present,
                       clk => clk);

end macro_level_definition;

------------------------------------------------------------------------------------
--
-- END OF FILE UART_RX.VHD
--
------------------------------------------------------------------------------------


