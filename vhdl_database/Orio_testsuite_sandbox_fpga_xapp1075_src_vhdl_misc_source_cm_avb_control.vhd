-------------------------------------------------------------------------------- 
-- Copyright (c) 2010 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow
--  \   \        Filename: $RCSfile: cm_avb_control.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2010-01-11 10:28:56-07 $
-- /___/   /\    Date Created: January 5, 2010
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: cm_avb_control.vhd,rcs $
-- Revision 1.0  2010-01-11 10:28:56-07  jsnow
-- Initial release.
--
-------------------------------------------------------------------------------- 
--   
-- LIMITED WARRANTY AND DISCLAMER. These designs are provided to you "as is" or 
-- as a template to make your own working designs exclusively with Xilinx
-- products. Xilinx and its licensors make and you receive no warranties or 
-- conditions, express, implied, statutory or otherwise, and Xilinx specifically
-- disclaims any implied warranties of merchantability, non-infringement, or 
-- fitness for a particular purpose. Xilinx does not warrant that the functions 
-- contained in these designs will meet your requirements, or that the operation
-- of these designs will be uninterrupted or error free, or that defects in the 
-- Designs will be corrected. Furthermore, Xilinx does not warrant or make any 
-- representations regarding use or the results of the use of the designs in 
-- terms of correctness, accuracy, reliability, or otherwise. The designs are 
-- not covered by any other agreement that you may have with Xilinx. 
--
-- LIMITATION OF LIABILITY. In no event will Xilinx or its licensors be liable 
-- for any damages, including without limitation direct, indirect, incidental, 
-- special, reliance or consequential damages arising from the use or operation 
-- of the designs or accompanying documentation, however caused and on any 
-- theory of liability. This limitation will apply even if Xilinx has been 
-- advised of the possibility of such damage. This limitation shall apply 
-- not-withstanding the failure of the essential purpose of any limited remedies
-- herein.
-------------------------------------------------------------------------------- 
--
-- Module Description:
--
-- This module for FMC carrier boards provides access to the control & status 
-- for a clock module on the Xilinx AVB FMC card. One of these modules is 
-- required for each clock module installed on the AVB FMC card.
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cm_avb_control is
port (

-- Master clock
    clk:                in  std_logic;                      -- 27 MHz clock from AVB FMC card
    rst:                in  std_logic;
    ga:                 in  std_logic;                      -- must be 0 for CML and 1 for CMH

-- SPI signals
    sck:                out std_logic;                      -- SPI SCK
    mosi:               out std_logic;                      -- master-out slave-in serial data
    miso:               in  std_logic;                      -- master-in slave-out serial data
    ss:                 out std_logic;                      -- slave select -- asserted low

-- Module identification
    module_type:        out std_logic_vector(15 downto 0)   -- Clock module type
                            := (others => '0');
    module_rev:         out std_logic_vector(15 downto 0)   -- Clock module revision
                            := (others => '0');
    module_type_valid:  out std_logic := '0';               -- 1 = module type & rev have been read
    module_type_error:  out std_logic := '0';               -- 1 - error reading module type & rev

-- General control
    clkin5_src_sel:     in  std_logic;                      -- Clock module CLKIN 5 source
                                                            -- 0 = 27 MHz, 1 = from FMC connector

-- GPIO direction signals
-- These control the direction of signals between the FPGA on the AVB FMC card
-- and the clock module. A value of 0 indicates an FPGA output to the clock
-- module. A value of 1 indicates an input to the FPGA from the clock module.
--
    gpio_dir_0:         in  std_logic_vector(7 downto 0);   -- GPIO signals [7:0]
    gpio_dir_1:         in  std_logic_vector(7 downto 0);   -- GPIO signals [15:8]
    gpio_dir_2:         in  std_logic_vector(7 downto 0);   -- GPIO signals [23:16]

-- General purpose output values
-- These control the of the GPIO signals when they are outputs from the FPGA
-- on the AVB FMC card to the clock module.
    gp_out_value_0:     in  std_logic_vector(7 downto 0);   -- GPIO signals [7:0]
    gp_out_value_1:     in  std_logic_vector(7 downto 0);   -- GPIO signals [15:8]
    gp_out_value_2:     in  std_logic_vector(7 downto 0);   -- GPIO signals [23:16]

-- General purpose input values
-- The ports reflect the values of the GPIO signals when they are inputs to the
-- FPGA on the AVB FMC card from the clock clock module.
    gp_in_value_0:      out std_logic_vector(7 downto 0)    -- GPIO signals [7:0]
                            := (others => '0');
    gp_in_value_1:      out std_logic_vector(7 downto 0)    -- GPIO signals [15:8]
                            := (others => '0');
    gp_in_value_2:      out std_logic_vector(7 downto 0)    -- GPIO signals [23:16]
                            := (others => '0');
    gp_in:              out std_logic_vector(3 downto 0)    -- GPIN signals [3:0]
                            := (others => '0');

-- I2C bus register peek/poke control
-- These ports provide peek/poke capability to devices connected to the
-- I2C bus on the clock module. To write a value to a device register, set the
-- the slave address, register address, and data to be written and then pulse
-- i2c_reg_wr high for one cycle of the 27 MHz clock. The i2c_reg_rdy signal
-- will go low on the rising edge of the clock when i2c_reg_wr is high and
-- will stay low until the write is completed. To read a register, setup the
-- slave address and register address then pulse i2c_reg_rd high for one cycle
-- of the clock. Again, i2c_reg_rdy will go low until the read cycle is completed.
-- When i2c_reg_rdy goes high, the data read from the register will be present
-- on i2c_reg_dat_rd.
--
    i2c_slave_adr:      in  std_logic_vector(7 downto 0);   -- I2C device slave address
    i2c_reg_adr:        in  std_logic_vector(7 downto 0);   -- I2C device register address
    i2c_reg_dat_wr:     in  std_logic_vector(7 downto 0);   -- Data to be written to device
    i2c_reg_wr:         in  std_logic;                      -- Write request
    i2c_reg_rd:         in  std_logic;                      -- Read request
    i2c_reg_dat_rd:     out std_logic_vector(7 downto 0)    -- Data read from I2C device
                            := (others => '0');
    i2c_reg_rdy:        out std_logic := '0';               -- 1 = peek/poke completed
    i2c_reg_error:      out std_logic := '0';               -- 1  NACK occurred during I2C peek/poke

-- Si5324 module signals
--
-- These ports are only valid if the Si5324 clock module is installed on the
-- AVB FMC card. There are 3 identical sets of ports, one set for each of the
-- three Si5324 parts on the clock module. The out_fsel and in_fsel ports
-- set the predefined frequency synthesis options as follows:
--
--      Si5324_X_in_fsel[4:0] select the input frequency:
--          0x00: 480i (NTSC) HSYNC
--          0x01: 480p HSYNC
--          0x02: 576i (PAL) HSYNC
--          0x03: 576p HSYNC
--          0x04: 720p 24 Hz HSYNC
--          0x05: 720p 23.98 Hz HSYNC
--          0x06: 720p 25 Hz HSYNC
--          0x07: 720p 30 Hz HSYNC
--          0x08: 720p 29.97 Hz HSYNC
--          0x09: 720p 50 Hz HSYNC
--          0x0A: 720p 60 Hz HSYNC
--          0x0B: 720p 59.94 Hz HSYNC
--          0x0C: 1080i 50 Hz HSYNC
--          0x0D: 1080i 60 Hz HSYNC
--          0x0E: 1080i 59.94 Hz HSYNC
--          0x0F: 1080p 24 Hz HSYNC
--          0x10: 1080p 23.98 Hz HSYNC
--          0x11: 1080p 25 Hz HSYNC
--          0x12: 1080p 30 Hz HSYNC
--          0x13: 1080p 29.97 Hz HSYNC
--          0x14: 1080p 50 Hz HSYNC
--          0x15: 1080p 60 Hz HSYNC
--          0x16: 1080p 59.94 Hz HSYNC
--          0x17: 27 MHz
--          0x18: 74.25 MHz
--          0x19: 74.25/1.001 MHz
--          0x1A: 148.5 MHz
--          0x1B: 148.5/1.001 MHz
--          0x1C: 13.5 MHz
--
--      Si5324_out_fsel[3:0] select the output frequency:
--          0x0: 27 MHz
--          0x1: 74.25 MHz
--          0x2: 74.25/1.001 MHz
--          0x3: 148.5 MHz
--          0x4: 148.5/1.001 MHz
--          0x5: 24.576 MHz
--          0x6: 148.5/1.0005 MHz
--          0x7: Invalid
--          0x8: 297 MHz
--          0x9: 297/1.001 MHz
--          0xA: 156.25 MHz
--
-- Note that any HSYNC frequency can only be converted to 27 MHz. Choosing any
-- output frequency except 27 MHz when the input selection is 0x00 through 0x16
-- will result in an error. Any input frequency selected by 0x17 through 0x1B
-- can be converted to any output frequency, with the exception that the
-- 74.25/1.001 and 148.5/1.001 MHz input frequencies can't be converted to 
-- 24.576 MHz.
--
-- The Si5324_x_bw_sel port select the bandwidth of the Si5324. The selected
-- bandwidth MUST be a legal value for the input/output frequency combinations.
--
    Si5324_A_clkin_sel: in  std_logic;                      -- Selects input clock, 0=CKIN1, 1=CKIN2
    Si5324_A_out_fsel:  in  std_logic_vector(3 downto 0);   -- Selects the output frequency
    Si5324_A_in_fsel:   in  std_logic_vector(4 downto 0);   -- Selects the input frequency
    Si5324_A_bw_sel:    in  std_logic_vector(3 downto 0);   -- Selects the PLL bandwdith
    Si5324_A_DHOLD:     in  std_logic;                      -- 1 puts device in digital hold mode
    Si5324_A_FOS2:      out std_logic := '0';               -- 1=frequency offset alarm for CKIN2
    Si5324_A_FOS1:      out std_logic := '0';               -- 1=frequency offset alarm for CKIN1
    Si5324_A_LOL:       out std_logic := '0';               -- 0=PLL locked, 1=PLL unlocked

    Si5324_B_clkin_sel: in  std_logic;                      -- Selects input clock, 0=CKIN1, 1=CKIN2
    Si5324_B_out_fsel:  in  std_logic_vector(3 downto 0);   -- Selects the output frequency
    Si5324_B_in_fsel:   in  std_logic_vector(4 downto 0);   -- Selects the input frequency
    Si5324_B_bw_sel:    in  std_logic_vector(3 downto 0);   -- Selects the PLL bandwdith
    Si5324_B_DHOLD:     in  std_logic;                      -- 1 puts device in digital hold mode
    Si5324_B_FOS2:      out std_logic := '0';               -- 1=frequency offset alarm for CKIN2
    Si5324_B_FOS1:      out std_logic := '0';               -- 1=frequency offset alarm for CKIN1
    Si5324_B_LOL:       out std_logic := '0';               -- 0=PLL locked, 1=PLL unlocked

    Si5324_C_clkin_sel: in  std_logic;                      -- Selects input clock, 0=CKIN1, 1=CKIN2
    Si5324_C_out_fsel:  in  std_logic_vector(3 downto 0);   -- Selects the output frequency
    Si5324_C_in_fsel:   in  std_logic_vector(4 downto 0);   -- Selects the input frequency
    Si5324_C_bw_sel:    in  std_logic_vector(3 downto 0);   -- Selects the PLL bandwdith
    Si5324_C_DHOLD:     in  std_logic;                      -- 1 puts device in digital hold mode
    Si5324_C_FOS2:      out std_logic := '0';               -- 1=frequency offset alarm for CKIN2
    Si5324_C_FOS1:      out std_logic := '0';               -- 1=frequency offset alarm for CKIN1
    Si5324_C_LOL:       out std_logic := '0');              -- 0=PLL locked, 1=PLL unlocked
end cm_avb_control;

architecture xilinx of cm_avb_control is
    
component avbcm
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

component Si5324_fsel_lookup
port (
    clk:            in  std_logic; 
    out_fsel:       in  std_logic_vector(3 downto 0);
    in_fsel:        in  std_logic_vector(4 downto 0);
    fsel:           out std_logic_vector(7 downto 0));
end component;

--
-- Internal signal definitions
--
signal port_id :        std_logic_vector(7 downto 0);                       -- PicoBlaze port ID output
signal write_strobe :   std_logic;                                          -- PicoBlaze write strobe
signal read_strobe :    std_logic;                                          -- PicoBlaze read strobe
signal output_port :    std_logic_vector(7 downto 0);                       -- PicoBlaze output port
signal input_port :     std_logic_vector(7 downto 0) := (others => '0');    -- PicoBlaze input port
signal spi_reg :        std_logic_vector(2 downto 0) := "100";              -- [SS,SCK,MOSI] control bits from pBlaze
signal address :        std_logic_vector(9 downto 0);                       -- PicoBlaze instruction address
signal instruction :    std_logic_vector(17 downto 0);                      -- PicoBlaze instruction ROM output

signal i2c_rd_req :     std_logic := '0';                                   -- I2C bus read request
signal i2c_wr_req :     std_logic := '0';                                   -- I2C bus write request

signal Si5324_A_fsel :  std_logic_vector(7 downto 0);                       -- frequency select for Si5324 A
signal Si5324_B_fsel :  std_logic_vector(7 downto 0);                       -- frequency select for Si5324 B
signal Si5324_C_fsel :  std_logic_vector(7 downto 0);                       -- frequency select for Si5324 C

begin

ss   <= spi_reg(2);
sck  <= spi_reg(1);
mosi <= spi_reg(0);

CM_SPI_CODEROM : avbcm
port map (
    address             => address,
    instruction         => instruction,
    clk                 => clk);

--
-- PicoBlaze processor
--
CM_SPI_PICO : kcpsm3
port map (
    address             => address,
    instruction         => instruction,
    port_id             => port_id,
    write_strobe        => write_strobe,
    out_port            => output_port,
    read_strobe         => read_strobe,
    in_port             => input_port,
    interrupt           => '0',
    interrupt_ack       => open,
    reset               => rst,
    clk                 => clk);

--
-- PicoBlaze output port registers
--
-- SPI control register
--
process(clk)
begin
    if rising_edge(clk) then
        if rst = '1' then
            spi_reg <= "100";
        elsif write_strobe = '1' and port_id(7) = '0' and port_id(6) = '0' then
            spi_reg <= output_port(2 downto 0);
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if write_strobe = '1' and port_id(7) = '0' and port_id(6) = '1' and port_id(2 downto 0) = "000" then
            module_type(15 downto 8) <= output_port;
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if write_strobe = '1' and port_id(7) = '0' and port_id(6) = '1' and port_id(2 downto 0) = "001" then
            module_type(7 downto 0) <= output_port;
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if write_strobe = '1' and port_id(7) = '0' and port_id(6) = '1' and port_id(2 downto 0) = "010" then
            module_rev(15 downto 8) <= output_port;
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if write_strobe = '1' and port_id(7) = '0' and port_id(6) = '1' and port_id(2 downto 0) = "011" then
            module_rev(7 downto 0) <= output_port;
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if write_strobe = '1' and port_id(7) = '0' and port_id(6) = '1' and port_id(2) = '1' then
            module_type_valid <= output_port(0);
            module_type_error <= output_port(1);
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if write_strobe = '1' and port_id(7) = '1' and port_id(3 downto 0) = X"0" then
            gp_in <= output_port(3 downto 0);
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if write_strobe = '1' and port_id(7) = '1' and port_id(3 downto 0) = X"3" then
            gp_in_value_0 <= output_port;
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if write_strobe = '1' and port_id(7) = '1' and port_id(3 downto 0) = X"4" then
            gp_in_value_1 <= output_port;
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if write_strobe = '1' and port_id(7) = '1' and port_id(3 downto 0) = X"5" then
            gp_in_value_2 <= output_port;
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if write_strobe = '1' and port_id(7) = '1' and port_id(3 downto 0) = X"8" then
            i2c_reg_dat_rd <= output_port;
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if i2c_reg_wr = '1' then
            i2c_wr_req <= '1';
        elsif read_strobe = '1' and port_id(3 downto 0) = X"9" then
            i2c_wr_req <= '0';
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if i2c_reg_rd = '1' then
            i2c_rd_req <= '1';
        elsif read_strobe = '1' and port_id(3 downto 0) = X"9" then
            i2c_rd_req <= '0';
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if i2c_reg_wr = '1' or i2c_reg_rd = '1' then
            i2c_reg_rdy <= '0';
        elsif write_strobe = '1' and port_id(7) = '1' and port_id(3 downto 0) = X"7" then
            i2c_reg_rdy <= '1';
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if write_strobe = '1' and port_id(7) = '1' and port_id(3 downto 0) = X"7" then
            i2c_reg_error <= output_port(6);
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if write_strobe = '1' and port_id(7) = '1' and port_id(3 downto 0) = X"A" then
            Si5324_A_FOS2 <= output_port(2);
            Si5324_A_FOS1 <= output_port(1);
            Si5324_A_LOL  <= output_port(0);
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if write_strobe = '1' and port_id(7) = '1' and port_id(3 downto 0) = X"C" then
            Si5324_B_FOS2 <= output_port(2);
            Si5324_B_FOS1 <= output_port(1);
            Si5324_B_LOL  <= output_port(0);
        end if;
    end if;
end process;
    
process(clk)
begin
    if rising_edge(clk) then
        if write_strobe = '1' and port_id(7) = '1' and port_id(3 downto 0) = X"E" then
            Si5324_C_FOS2 <= output_port(2);
            Si5324_C_FOS1 <= output_port(1);
            Si5324_C_LOL  <= output_port(0);
        end if;
    end if;
end process;
    
--
-- PicoBlaze Input Port Mux
--
process(clk)
begin
    if rising_edge(clk) then
        if port_id(7) = '0' then
            input_port <= (ga & "000000" & miso);
        else
            case port_id(4 downto 0) is
                when "00000" => input_port <= gpio_dir_0;
                when "00001" => input_port <= gpio_dir_1;
                when "00010" => input_port <= gpio_dir_2;
                when "00011" => input_port <= gp_out_value_0;
                when "00100" => input_port <= gp_out_value_1;
                when "00101" => input_port <= gp_out_value_2;
                when "00110" => input_port <= i2c_slave_adr;
                when "00111" => input_port <= i2c_reg_adr;
                when "01000" => input_port <= i2c_reg_dat_wr;
                when "01001" => input_port <= ("000000" & i2c_rd_req & i2c_wr_req);
                when "01010" => input_port <= ("000" & Si5324_A_DHOLD & "000" & Si5324_A_clkin_sel);
                when "01011" => input_port <= Si5324_A_fsel;
                when "01100" => input_port <= ("000" & Si5324_B_DHOLD & "000" & Si5324_B_clkin_sel);
                when "01101" => input_port <= Si5324_B_fsel;
                when "01110" => input_port <= ("000" & Si5324_C_DHOLD & "000" & Si5324_C_clkin_sel);
                when "01111" => input_port <= Si5324_C_fsel;
                when "10000" => input_port <= ("0000000" & clkin5_src_sel);
                when "10001" => input_port <= ("0000" & Si5324_A_bw_sel);
                when "10010" => input_port <= ("0000" & Si5324_B_bw_sel);
                when "10011" => input_port <= ("0000" & Si5324_C_bw_sel);
                when others  => input_port <= X"00";
            end case;
        end if;
    end if;
end process;

--
-- Si5324 frequency select mapping
--
-- For all output frequencies selected by Si5324_out_fsel codes 0 through 7,
-- the mapping is simply the concatenation of the LS 3 bits of Si5324_out_fsel
-- with the 5 bits of Si5324_in_fsel, just as was previously done when
-- Si53234_out_fsel was just 3 bits. However, if bit 3 of Si5324_out_fsel is 1,
-- use a mapping looking up ROM.
--

FSELA : Si5324_fsel_lookup
port map (
    clk             => clk,
    in_fsel         => Si5324_A_in_fsel,
    out_fsel        => Si5324_A_out_fsel,
    fsel            => Si5324_A_fsel);

FSELB : Si5324_fsel_lookup
port map (
    clk             => clk,
    in_fsel         => Si5324_B_in_fsel,
    out_fsel        => Si5324_B_out_fsel,
    fsel            => Si5324_B_fsel);

FSELC : Si5324_fsel_lookup
port map (
    clk             => clk,
    in_fsel         => Si5324_C_in_fsel,
    out_fsel        => Si5324_C_out_fsel,
    fsel            => Si5324_C_fsel);

end xilinx;
