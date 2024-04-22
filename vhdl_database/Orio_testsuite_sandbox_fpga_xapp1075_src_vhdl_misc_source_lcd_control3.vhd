-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow
--  \   \        Filename: $RCSfile: lcd_control3.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2010-03-08 13:54:18-07 $
-- /___/   /\    Date Created: February 18, 2010
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: lcd_control3.vhd,rcs $
-- Revision 1.0  2010-03-08 13:54:18-07  jsnow
-- Initial release.
--
-------------------------------------------------------------------------------- 
--   
-- (c) Copyright 2010 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of,
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES. 
--
-------------------------------------------------------------------------------- 
--
-- Module Description:
--
-- LCD control module.
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
use std.textio.all;


entity lcd_control3 is
generic (
    ROM_FILE_NAME :         string := "../main_demo/file_name.txt";
    MIN_FMC_FPGA_REVISION:  integer := 8;
    REQUIRED_CML_TYPE:      integer := 0;
    REQUIRED_CMH_TYPE:      integer := 0);
port (
    clk:                    in  std_logic;                          -- 27 MHz FMC clock
    rst:                    in  std_logic;
    sw_c:                   in  std_logic;                          -- center switch
    sw_w:                   in  std_logic;                          -- west switch
    sw_e:                   in  std_logic;                          -- east switch
    sw_n:                   in  std_logic;                          -- north switch
    sw_s:                   in  std_logic;                          -- south switch
    fpga_rev:               in  std_logic_vector(7 downto 0);       -- FMC FPGA revision code
    cml_type:               in  std_logic_vector(15 downto 0);      -- Clock module L type code
    cml_type_valid:         in  std_logic;
    cml_type_error:         in  std_logic;
    cmh_type:               in  std_logic_vector(15 downto 0);      -- Clock module H type code
    cmh_type_valid:         in  std_logic;
    cmh_type_error:         in  std_logic;
    active_rx:              in  std_logic_vector(3 downto 0);       -- Indicates which SDI Rx are active in demo
    rx1_locked:             in  std_logic;
    rx1_mode:               in  std_logic_vector(1 downto 0);
    rx1_level:              in  std_logic;
    rx1_t_format:           in  std_logic_vector(3 downto 0);
    rx1_m:                  in  std_logic;
    rx2_locked:             in  std_logic;
    rx2_mode:               in  std_logic_vector(1 downto 0);
    rx2_level:              in  std_logic;
    rx2_t_format:           in  std_logic_vector(3 downto 0);
    rx2_m:                  in  std_logic;
    rx3_locked:             in  std_logic;
    rx3_mode:               in  std_logic_vector(1 downto 0);
    rx3_level:              in  std_logic;
    rx3_t_format:           in  std_logic_vector(3 downto 0);
    rx3_m:                  in  std_logic;
    rx4_locked:             in  std_logic;
    rx4_mode:               in  std_logic_vector(1 downto 0);
    rx4_level:              in  std_logic;
    rx4_t_format:           in  std_logic_vector(3 downto 0);
    rx4_m:                  in  std_logic;
    sync_active:            in  std_logic;
    sync_enable:            in  std_logic;
    sync_v:                 in  std_logic;
    sync_err:               in  std_logic;
    sync_m:                 in  std_logic;
    sync_frame_rate:        in  std_logic_vector(2 downto 0);
    sync_video_fmt:         in  std_logic_vector(10 downto 0);
    lcd_e:                  out std_logic;
    lcd_rw:                 out std_logic;
    lcd_rs:                 out std_logic;
    lcd_d:                  out std_logic_vector(3 downto 0));
end lcd_control3;

architecture xilinx of lcd_control3 is
    
component lcdctrl3
port (      
    address :       in std_logic_vector(9 downto 0);
    instruction :   out std_logic_vector(17 downto 0);
    clk :           in std_logic);
end component;  

component lcdaux3
port (      
    address :       in std_logic_vector(9 downto 0);
    instruction :   out std_logic_vector(17 downto 0);
    clk :           in std_logic);
end component;  

component kcpsm3
port (
    address :       out std_logic_vector(9 downto 0);
    instruction :   in std_logic_vector(17 downto 0);
    port_id :       out std_logic_vector(7 downto 0);
    write_strobe :  out std_logic;
    out_port :      out std_logic_vector(7 downto 0);
    read_strobe :   out std_logic;
    in_port :       in std_logic_vector(7 downto 0);
    interrupt :     in std_logic;
    interrupt_ack : out std_logic;
    reset :         in std_logic;
    clk :           in std_logic);
end component;
        
--
-- Internal signals
--
type rom_type is array(0 to 31) of bit_vector(7 downto 0);

impure function init_rom (file_name : in string) return rom_type is
    FILE rom_file :     text is in file_name;
    variable ln :       line;
    variable rom :      rom_type;
begin
    for i in rom_type'range loop
        readline(rom_file, ln);
        read(ln, rom(i));
    end loop;
    return rom;
end function;

signal port_id :        std_logic_vector(7 downto 0);
signal write_strobe :   std_logic;
signal read_strobe :    std_logic;
signal output_port :    std_logic_vector(7 downto 0);
signal input_port :     std_logic_vector(7 downto 0);
signal address :        std_logic_vector(9 downto 0);
signal instruction_main:std_logic_vector(17 downto 0);
signal instruction_aux: std_logic_vector(17 downto 0);
signal instruction :    std_logic_vector(17 downto 0);
signal bank_sel :       std_logic := '0';
signal lcd_d_int :      std_logic_vector(3 downto 0);
signal lcd_rs_int :     std_logic;
signal lcd_e_int :      std_logic;
signal sw_c_sync :      std_logic_vector(1 downto 0);
signal sw_w_sync :      std_logic_vector(1 downto 0);
signal sw_e_sync :      std_logic_vector(1 downto 0);
signal sw_n_sync :      std_logic_vector(1 downto 0);
signal sw_s_sync :      std_logic_vector(1 downto 0);
signal name_rom :       rom_type := init_rom(ROM_FILE_NAME);
signal min_fpga_rev:    std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(MIN_FMC_FPGA_REVISION, 8));
signal req_cml_type :   std_logic_vector(15 downto 0) := std_logic_vector(to_unsigned(REQUIRED_CML_TYPE, 16));
signal req_cmh_type :   std_logic_vector(15 downto 0) := std_logic_vector(to_unsigned(REQUIRED_CMH_TYPE, 16));

begin

lcd_d  <= lcd_d_int;
lcd_e  <= lcd_e_int;
lcd_rs <= lcd_rs_int;
lcd_rw <= '0';

CODEROM : lcdctrl3
port map (
    address         => address,
    instruction     => instruction_main,
    clk             => clk);

AUXROM : lcdaux3
port map (
    address         => address,
    instruction     => instruction_aux,
    clk             => clk);

instruction <= instruction_aux when bank_sel = '1' else instruction_main;

--
-- PicoBlaze processor
--
LCD_PICO : kcpsm3
port map (
    address         => address,
    instruction     => instruction,
    port_id         => port_id,
    write_strobe    => write_strobe,
    out_port        => output_port,
    read_strobe     => read_strobe,
    in_port         => input_port,
    interrupt       => '0',
    interrupt_ack   => open,
    reset           => rst,
    clk             => clk);

process(clk)
begin
    if rising_edge(clk) then
        if write_strobe = '1' and port_id(6) = '1' then
            lcd_d_int  <= output_port(7 downto 4);
            lcd_rs_int <= output_port(2);
            lcd_e_int  <= output_port(0);
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if write_strobe = '1' and port_id(7) = '1' then
            bank_sel <= port_id(0);
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        sw_c_sync <= (sw_c_sync(0) & sw_c);
        sw_w_sync <= (sw_w_sync(0) & sw_w);
        sw_e_sync <= (sw_e_sync(0) & sw_e);
        sw_n_sync <= (sw_n_sync(0) & sw_n);
        sw_s_sync <= (sw_s_sync(0) & sw_s);
    end if;
end process;

process(port_id, cml_type, cml_type_error, cml_type_valid, cmh_type, cmh_type_error, cmh_type_valid, fpga_rev, sw_e_sync, sw_w_sync, sw_c_sync, min_fpga_rev, req_cml_type, req_cmh_type)
begin
    if port_id(7) = '1' then
        case port_id(3 downto 0) is
            when X"1"   => input_port <= min_fpga_rev;
            when X"2"   => input_port <= cml_type(15 downto 8);
            when X"3"   => input_port <= cml_type(7 downto 0);
            when X"4"   => input_port <= req_cml_type(15 downto 8);
            when X"5"   => input_port <= req_cml_type(7 downto 0);
            when X"6"   => input_port <= ("000000" & cml_type_error & cml_type_valid);
            when X"8"   => input_port <= cmh_type(15 downto 8);
            when X"9"   => input_port <= cmh_type(7 downto 0);
            when X"A"   => input_port <= req_cmh_type(15 downto 8);
            when X"B"   => input_port <= req_cmh_type(7 downto 0);
            when X"C"   => input_port <= ("000000" & cmh_type_error & cmh_type_valid);
            when others => input_port <= fpga_rev;
        end case;
    elsif port_id(6) = '1' then
        input_port <= to_stdlogicvector(name_rom(conv_integer(port_id(4 downto 0))));
    elsif port_id(5) = '1' then
        case port_id(3 downto 0) is
            when X"0"   => input_port <= (rx1_t_format & rx1_level & rx1_mode & rx1_locked);
            when X"1"   => input_port <= (rx2_t_format & rx2_level & rx2_mode & rx2_locked);
            when X"2"   => input_port <= (rx3_t_format & rx3_level & rx3_mode & rx3_locked);
            when X"3"   => input_port <= (rx4_t_format & rx4_level & rx4_mode & rx4_locked);
            when X"4"   => input_port <= ("0000000" & rx1_m);
            when X"5"   => input_port <= ("0000000" & rx2_m);
            when X"6"   => input_port <= ("0000000" & rx3_m);
            when X"7"   => input_port <= ("0000000" & rx4_m);
            when X"8"   => input_port <= ("0000" & active_rx);
            when X"9"   => input_port <= ((not sync_enable) & sync_active & sync_v & sync_err & sync_m & sync_frame_rate);
            when X"A"   => input_port <= ("00000" & sync_video_fmt(10 downto 8));
            when others => input_port <= sync_video_fmt(7 downto 0);
        end case;
    else
        input_port <= ("000" & sw_s_sync(1) & sw_n_sync(1) & sw_e_sync(1) & sw_w_sync(1) & sw_c_sync(1));
    end if;
end process;

end xilinx;
