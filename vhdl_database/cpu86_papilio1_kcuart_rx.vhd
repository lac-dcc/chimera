-- Constant (K) Compact UART Receiver
--
-- Version : 1.10 
-- Version Date : 3rd December 2003
-- Reason : '--translate' directives changed to '--synthesis translate' directives
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
-- Main Entity for KCUART_RX
--
entity kcuart_rx is
    Port (      serial_in : in std_logic;  
                 data_out : out std_logic_vector(7 downto 0);
              data_strobe : out std_logic;
             en_16_x_baud : in std_logic;
                      clk : in std_logic);
    end kcuart_rx;
--
------------------------------------------------------------------------------------
--
-- Start of Main Architecture for KCUART_RX
--	 
architecture low_level_definition of kcuart_rx is
--
------------------------------------------------------------------------------------
--
------------------------------------------------------------------------------------
--
-- Signals used in KCUART_RX
--
------------------------------------------------------------------------------------
--
signal sync_serial        : std_logic;
signal stop_bit           : std_logic;
signal data_int           : std_logic_vector(7 downto 0);
signal data_delay         : std_logic_vector(7 downto 0);
signal start_delay        : std_logic;
signal start_bit          : std_logic;
signal edge_delay         : std_logic;
signal start_edge         : std_logic;
signal decode_valid_char  : std_logic;
signal valid_char         : std_logic;
signal decode_purge       : std_logic;
signal purge              : std_logic;
signal valid_srl_delay    : std_logic_vector(8 downto 0);
signal valid_reg_delay    : std_logic_vector(8 downto 0);
signal decode_data_strobe : std_logic;
--
--
------------------------------------------------------------------------------------
--
-- Attributes to define LUT contents during implementation 
-- The information is repeated in the generic map for functional simulation--
--
------------------------------------------------------------------------------------
--
attribute INIT : string; 
attribute INIT of start_srl     : label is "0000";
attribute INIT of edge_srl      : label is "0000";
attribute INIT of valid_lut     : label is "0040";
attribute INIT of purge_lut     : label is "54";
attribute INIT of strobe_lut    : label is "8";
--
------------------------------------------------------------------------------------
--
-- Start of KCUART_RX circuit description
--
------------------------------------------------------------------------------------
--	
begin

  -- Synchronise input serial data to system clock

  sync_reg: FD
  port map ( D => serial_in,
             Q => sync_serial,
             C => clk);

  stop_reg: FD
  port map ( D => sync_serial,
             Q => stop_bit,
             C => clk);


  -- Data delays to capture data at 16 time baud rate
  -- Each SRL16E is followed by a flip-flop for best timing

  data_loop: for i in 0 to 7 generate
  begin

     lsbs: if i<7 generate
     --
     attribute INIT : string; 
     attribute INIT of delay15_srl : label is "0000"; 
     --
     begin

       delay15_srl: SRL16E
       --synthesis translate_off
       generic map (INIT => X"0000")
       --synthesis translate_on
       port map(   D => data_int(i+1),
                  CE => en_16_x_baud,
                 CLK => clk,
                  A0 => '0',
                  A1 => '1',
                  A2 => '1',
                  A3 => '1',
                   Q => data_delay(i) );

     end generate lsbs;

     msb: if i=7 generate
     --
     attribute INIT : string; 
     attribute INIT of delay15_srl : label is "0000"; 
     --
     begin

       delay15_srl: SRL16E
       --synthesis translate_off
       generic map (INIT => X"0000")
       --synthesis translate_on
       port map(   D => stop_bit,
                  CE => en_16_x_baud,
                 CLK => clk,
                  A0 => '0',
                  A1 => '1',
                  A2 => '1',
                  A3 => '1',
                   Q => data_delay(i) );

     end generate msb;

     data_reg: FDE
     port map ( D => data_delay(i),
                Q => data_int(i),
               CE => en_16_x_baud,
                C => clk);

  end generate data_loop;

  -- Assign internal signals to outputs

  data_out <= data_int;
 
  -- Data delays to capture start bit at 16 time baud rate

  start_srl: SRL16E
  --synthesis translate_off
  generic map (INIT => X"0000")
  --synthesis translate_on
  port map(   D => data_int(0),
             CE => en_16_x_baud,
            CLK => clk,
             A0 => '0',
             A1 => '1',
             A2 => '1',
             A3 => '1',
              Q => start_delay );

  start_reg: FDE
  port map ( D => start_delay,
             Q => start_bit,
            CE => en_16_x_baud,
             C => clk);


  -- Data delays to capture start bit leading edge at 16 time baud rate
  -- Delay ensures data is captured at mid-bit position

  edge_srl: SRL16E
  --synthesis translate_off
  generic map (INIT => X"0000")
  --synthesis translate_on
  port map(   D => start_bit,
             CE => en_16_x_baud,
            CLK => clk,
             A0 => '1',
             A1 => '0',
             A2 => '1',
             A3 => '0',
              Q => edge_delay );

  edge_reg: FDE
  port map ( D => edge_delay,
             Q => start_edge,
            CE => en_16_x_baud,
             C => clk);

  -- Detect a valid character 

  valid_lut: LUT4
  --synthesis translate_off
  generic map (INIT => X"0040")
  --synthesis translate_on
  port map( I0 => purge,
            I1 => stop_bit,
            I2 => start_edge,
            I3 => edge_delay,
             O => decode_valid_char );  

  valid_reg: FDE
  port map ( D => decode_valid_char,
             Q => valid_char,
            CE => en_16_x_baud,
             C => clk);

  -- Purge of data status 

  purge_lut: LUT3
  --synthesis translate_off
  generic map (INIT => X"54")
  --synthesis translate_on
  port map( I0 => valid_reg_delay(8),
            I1 => valid_char,
            I2 => purge,
             O => decode_purge );  

  purge_reg: FDE
  port map ( D => decode_purge,
             Q => purge,
            CE => en_16_x_baud,
             C => clk);

  -- Delay of valid_char pulse of length equivalent to the time taken 
  -- to purge data shift register of all data which has been used.
  -- Requires 9x16 + 8 delays which is achieved by packing of SRL16E with 
  -- up to 16 delays and utilising the dedicated flip flop in each stage.

  valid_loop: for i in 0 to 8 generate
  begin

     lsb: if i=0 generate
     --
     attribute INIT : string; 
     attribute INIT of delay15_srl : label is "0000"; 
     --
     begin

       delay15_srl: SRL16E
       --synthesis translate_off
       generic map (INIT => X"0000")
       --synthesis translate_on
       port map(   D => valid_char,
                  CE => en_16_x_baud,
                 CLK => clk,
                  A0 => '0',
                  A1 => '1',
                  A2 => '1',
                  A3 => '1',
                   Q => valid_srl_delay(i) );

     end generate lsb;

     msbs: if i>0 generate
     --
     attribute INIT : string; 
     attribute INIT of delay16_srl : label is "0000"; 
     --
     begin

       delay16_srl: SRL16E
       --synthesis translate_off
       generic map (INIT => X"0000")
       --synthesis translate_on
       port map(   D => valid_reg_delay(i-1),
                  CE => en_16_x_baud,
                 CLK => clk,
                  A0 => '1',
                  A1 => '1',
                  A2 => '1',
                  A3 => '1',
                   Q => valid_srl_delay(i) );

     end generate msbs;

     data_reg: FDE
     port map ( D => valid_srl_delay(i),
                Q => valid_reg_delay(i),
               CE => en_16_x_baud,
                C => clk);

  end generate valid_loop;

  -- Form data strobe

  strobe_lut: LUT2
  --synthesis translate_off
  generic map (INIT => X"8")
  --synthesis translate_on
  port map( I0 => valid_char,
            I1 => en_16_x_baud,
             O => decode_data_strobe );

  strobe_reg: FD
  port map ( D => decode_data_strobe,
             Q => data_strobe,
             C => clk);

end low_level_definition;

------------------------------------------------------------------------------------
--
-- END OF FILE KCUART_RX.VHD
--
------------------------------------------------------------------------------------


