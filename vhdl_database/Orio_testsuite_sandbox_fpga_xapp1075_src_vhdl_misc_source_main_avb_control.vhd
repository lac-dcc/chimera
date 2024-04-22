-------------------------------------------------------------------------------- 
-- Copyright (c) 2010 Xilinx, Inc. 
-- All Rights Reserved 
-------------------------------------------------------------------------------- 
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /   Vendor: Xilinx 
-- \   \   \/    Author: John F. Snow
--  \   \        Filename: $RCSfile: main_avb_control.vhd,rcs $
--  /   /        Date Last Modified:  $Date: 2010-01-11 10:29:10-07 $
-- /___/   /\    Date Created: January 5, 2010
-- \   \  /  \ 
--  \___\/\___\ 
-- 
--
-- Revision History: 
-- $Log: main_avb_control.vhd,rcs $
-- Revision 1.0  2010-01-11 10:29:10-07  jsnow
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
-- This module for FMC carrier boards provides the main control & status for the
-- Xilinx AVB FMC card.
--
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity main_avb_control is
port (
-- Clock & reset
    clk:                in  std_logic;                      -- 27 MHz clock from AVB FMC card
    rst:                in  std_logic;

-- Main SPI interface to FMC card
    sck:                out std_logic;                      -- SPI SCK
    mosi:               out std_logic;                      -- master-out slave-in serial data
    miso:               in  std_logic;                      -- master-in slave-out serial data
    ss:                 out std_logic;                      -- slave select -- asserted low

-- General status signals
    fpga_rev:           out std_logic_vector(7 downto 0);   -- AVB FPGA revision
    exp_brd_prsnt:      out std_logic;                      -- 1 if expansion board is present
    board_options:      out std_logic_vector(7 downto 0);   -- indicates board strapping options

-- Clock XBAR control signals
--
-- For XBAR 1, each output can be driven by any of the four inputs as follows:
--      00 selects clock from Si5324
--      01 selects clock module L CLK OUT 1
--      10 selects clock module L CLK OUT 2
--      11 selects OUT 0 of XBAR 3
-- 
    xbar1_out0_sel:     in  std_logic_vector(1 downto 0);   -- Drives FMC GTTCLK0_M2C
    xbar1_out1_sel:     in  std_logic_vector(1 downto 0);   -- Drives FMC CLK2_M2C
    xbar1_out2_sel:     in  std_logic_vector(1 downto 0);   -- Drives FMC CLK1_M2C
    xbar1_out3_sel:     in  std_logic_vector(1 downto 0);   -- Drives clock module L CLK IN 4

--
-- For XBAR 2, each output can be driven by any of the four inuts as follows:
--      00 selects OUT 3 of XBAR 3
--      01 selects clock module H CLK OUT 1
--      10 selects clock module H CLK OUT 2
--      11 selects clock module H CLK OUT 3
--
    xbar2_out0_sel:     in  std_logic_vector(1 downto 0);   -- Drives FMC GBTCLK1_M2C
    xbar2_out1_sel:     in  std_logic_vector(1 downto 0);   -- Drives FMC HB17
    xbar2_out2_sel:     in  std_logic_vector(1 downto 0);   -- Drives FMC HA17
    xbar2_out3_sel:     in  std_logic_vector(1 downto 0);   -- Drives clock module H CLK IN 4

--
-- For XBAR 3, each output can be driven by any of the four inputs as follows:
--      00 selects FMC HA19
--      01 selects FMC LA22
--      10 selects FMC DP0 (LPC compatible MGT)
--      11 selects FMC DP1 (HPC compatible MGT)
--
    xbar3_out0_sel:     in  std_logic_vector(1 downto 0);   -- Drives IN 3 of XBAR 1
    xbar3_out1_sel:     in  std_logic_vector(1 downto 0);   -- Drives SDI TX1 cable driver
    xbar3_out2_sel:     in  std_logic_vector(1 downto 0);   -- Drives SDI TX2 cable driver
    xbar3_out3_sel:     in  std_logic_vector(1 downto 0);   -- Drives IN 0 of XBAR 2

-- Si5324 Status & Control
--
-- The Si5324_clkin_sel port controls the clock input selection for the Si5324.
-- There are three possible clock sources: 27 MHz XO, FPGA signal, and the HSYNC
-- signal from the clock separator. If the HSYNC signal is chosen, the device can be
-- put into auto frequency select mode where the controller automatically determines
-- the external HSYNC frequency and selects the proper frequency synthesis
-- settings to produce 27 MHz out of the Si5324. If Si5324_clkin_sel is anything
-- other than 01 (auto HSYNC mode), the frequency synthesis of the Si5324 is
-- controlled by the Si5324_in_fsel and Si5324_out_fsel ports as follows:
--
--      Si5324_in_fsel[4:0] select the input frequency:
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
-- For custom frequency synthesis, use the Si5324 register peek/poke facility
-- to modify individual registers on a custom basis.
--
-- The Si5324_bw_sel port selects the bandwidth of the Si5324 device. The
-- bandwidth selection must be a legal bandwidth value for the specified
-- input/output frequency combination.
--
    Si5324_reset:       in  std_logic;                      -- 1 resets Si5324
    Si5324_clkin_sel:   in  std_logic_vector(1 downto 0);   -- Controls input clock source selection for Si5324
                                                            -- 00=27MHz, 01=sync sep HSYNC (auto fsel mode)
                                                            -- 10=FMC LA29, 11=sync sep HSYNC(manual fsel mode)
    Si5324_out_fsel:    in  std_logic_vector(3 downto 0);   -- selects the output frequency
    Si5324_in_fsel:     in  std_logic_vector(4 downto 0);   -- selects the input frequency
    Si5324_bw_sel:      in  std_logic_vector(3 downto 0);   -- selects the PLL bandwidth
    Si5324_DHOLD:       in  std_logic;                      -- 1 puts the Si5324 in digital hold mode
    Si5324_FOS2:        out std_logic;                      -- 1 = frequency offset alarm for CKIN2
    Si5324_FOS1:        out std_logic;                      -- 1 = frequency offset alarm for CKIN1
    Si5324_LOL:         out std_logic;                      -- 0=PLL locked, 1=PLL unlocked

    Si5324_reg_adr:     in  std_logic_vector(7 downto 0);   -- Si5324 peek/poke register address
    Si5324_reg_wr_dat:  in  std_logic_vector(7 downto 0);   -- Si5324 peek/poke register write data
    Si5324_reg_rd_dat:  out std_logic_vector(7 downto 0)    -- Si5324 peek/poke register read data
                            := (others => '0');
    Si5324_reg_wr:      in  std_logic;                      -- Si5324 poke request, assert High for one clk
    Si5324_reg_rd:      in  std_logic;                      -- Si5324 peek request, assert High for one clk
    Si5324_reg_rdy:     out std_logic := '0';               -- Si5324 peek/poke cycle done when 1
    Si5324_error:       out std_logic := '0';               -- Si5324 peek/poke error when 1 (transfer was NACKed on I2C bus)

--
-- These ports are associated with the LMH1981 sync separator.  Note that the
-- actual sync signals are available directly to the FPGA via FMC signals. The
-- sync_video_frame value is a count of the number of lines in a field or frame
-- as captured directly by the LMH1981. The sync_m and sync_frame_rate indicate
-- the frame rate of the video signal as shown below. 
--
--      sync_frame_rate     Frame Rate      sync_m
--              000         23.98 Hz            1
--              001         24 Hz               0
--              010         25 Hz               0
--              011         29.97 Hz            1
--              100         30 Hz               0
--              101         50 Hz               0
--              110         59.94 Hz            1
--              111         60 Hz               0
--
    sync_video_fmt:     out std_logic_vector(10 downto 0)   -- count of lines per field/frame
                            := (others => '0');
    sync_updating:      out std_logic := '0';               -- sync_video_frame only valid when this port is 0
    sync_frame_rate:    out std_logic_vector(2 downto 0)    -- frame rate indicator
                            := (others => '0');
    sync_m:             out std_logic := '0';               -- 1 = frame rate is 1000/1001
    sync_err:           out std_logic := '0';               -- 1 = error detected in frame rate

--
-- LED control ports
--

-- The eight two-color LEDs associated with the SDI RX connectors are controlled
-- by 2 bits each as follows:
--      00 = off
--      01 = green
--      10 = red
--      11 = controlled by cable EQ CD signal (green when carrier detected, else red)
--
    sdi_rx1_led:        in  std_logic_vector(1 downto 0);   -- controls the SDI RX1 LED
    sdi_rx2_led:        in  std_logic_vector(1 downto 0);   -- controls the SDI RX2 LED
    sdi_rx3_led:        in  std_logic_vector(1 downto 0);   -- controls the SDI RX3 LED
    sdi_rx4_led:        in  std_logic_vector(1 downto 0);   -- controls the SDI RX4 LED
    sdi_rx5_led:        in  std_logic_vector(1 downto 0);   -- controls the SDI RX5 LED
    sdi_rx6_led:        in  std_logic_vector(1 downto 0);   -- controls the SDI RX6 LED
    sdi_rx7_led:        in  std_logic_vector(1 downto 0);   -- controls the SDI RX7 LED
    sdi_rx8_led:        in  std_logic_vector(1 downto 0);   -- controls the SDI RX8 LED

-- All other LEDs have separate 2-bit control ports for both the red and green LEDs
-- so that the red and green sides of the LED are independently controlled like this:
--      00 = off
--      01 = on
--      10 = flash slowly
--      11 = flash quickly
--
    sdi_tx1_red_led:    in  std_logic_vector(1 downto 0);   -- controls the SDI TX1 red LED
    sdi_tx1_grn_led:    in  std_logic_vector(1 downto 0);   -- controls the SDI TX1 green LED
    sdi_tx2_red_led:    in  std_logic_vector(1 downto 0);   -- controls the SDI TX2 red LED
    sdi_tx2_grn_led:    in  std_logic_vector(1 downto 0);   -- controls the SDI TX2 green LED
    sdi_tx3_red_led:    in  std_logic_vector(1 downto 0);   -- controls the SDI TX3 red LED
    sdi_tx3_grn_led:    in  std_logic_vector(1 downto 0);   -- controls the SDI TX3 green LED
    sdi_tx4_red_led:    in  std_logic_vector(1 downto 0);   -- controls the SDI TX4 red LED
    sdi_tx4_grn_led:    in  std_logic_vector(1 downto 0);   -- controls the SDI TX4 green LED
    sdi_tx5_red_led:    in  std_logic_vector(1 downto 0);   -- controls the SDI TX5 red LED
    sdi_tx5_grn_led:    in  std_logic_vector(1 downto 0);   -- controls the SDI TX5 green LED
    sdi_tx6_red_led:    in  std_logic_vector(1 downto 0);   -- controls the SDI TX6 red LED
    sdi_tx6_grn_led:    in  std_logic_vector(1 downto 0);   -- controls the SDI TX6 green LED
    sdi_tx7_red_led:    in  std_logic_vector(1 downto 0);   -- controls the SDI TX7 red LED
    sdi_tx7_grn_led:    in  std_logic_vector(1 downto 0);   -- controls the SDI TX7 green LED
    sdi_tx8_red_led:    in  std_logic_vector(1 downto 0);   -- controls the SDI TX8 red LED
    sdi_tx8_grn_led:    in  std_logic_vector(1 downto 0);   -- controls the SDI TX8 green LED

    aes_rx1_red_led:    in  std_logic_vector(1 downto 0);   -- controls the AES3 RX1 red LED
    aes_rx1_grn_led:    in  std_logic_vector(1 downto 0);   -- controls the AES3 RX1 green LED
    aes_rx2_red_led:    in  std_logic_vector(1 downto 0);   -- controls the AES3 RX2 red LED
    aes_rx2_grn_led:    in  std_logic_vector(1 downto 0);   -- controls the AES3 RX2 green LED
    aes_tx1_red_led:    in  std_logic_vector(1 downto 0);   -- controls the AES3 TX1 red LED
    aes_tx1_grn_led:    in  std_logic_vector(1 downto 0);   -- controls the AES3 TX1 green LED
    aes_tx2_red_led:    in  std_logic_vector(1 downto 0);   -- controls the AES3 TX2 red LED
    aes_tx2_grn_led:    in  std_logic_vector(1 downto 0);   -- controls the AES3 TX2 green LED
    madi_rx_red_led:    in  std_logic_vector(1 downto 0);   -- controls the MADI RX red LED
    madi_rx_grn_led:    in  std_logic_vector(1 downto 0);   -- controls the MADI RX green LED
    madi_tx_red_led:    in  std_logic_vector(1 downto 0);   -- controls the MADI TX red LED
    madi_tx_grn_led:    in  std_logic_vector(1 downto 0);   -- controls the MADI TX green LED
    sync_red_led:       in  std_logic_vector(1 downto 0);   -- controls the external sync red LED
    sync_grn_led:       in  std_logic_vector(1 downto 0);   -- controls the extenral sync green LED

-- SDI Cable EQ control & status
--
-- In the first two ports, there is one bit for each possible cable EQ device with
-- bit 0 for SDI RX1 and bit 7 for SDI RX8.
--
    sdi_eq_cd_n:        out std_logic_vector(7 downto 0)    -- carrier detects from cable drivers, asserted low
                            := (others => '0');
    sdi_eq_ext_3G_reach:in  std_logic_vector(7 downto 0);   -- Enable bits for extended 3G reach mode, 1=enable, 0=disable
    sdi_eq_select:      in  std_logic_vector(2 downto 0);   -- selects which EQ's status signals drive port below
    sdi_eq_cli:         out std_logic_vector(4 downto 0)    -- cable length indicator
                            := (others => '0');

-- SDI Cable Driver control & status
--
-- For these ports, there is one bit for each possible cable driver device with
-- bit 0 for SDI TX1 and bit 7 for SDI TX8.
--
    sdi_drv_hd_sd:      in  std_logic_vector(7 downto 0);   -- Sets slew rate of each cable driver, 1=SD, 0=HD/3G
    sdi_drv_enable:     in  std_logic_vector(7 downto 0);   -- 1 enables the driver, 0 powers down driver
    sdi_drv_fault_n:    out std_logic_vector(7 downto 0)    -- 1 = normal operation, 0 = fault
                            := (others => '0'));

end main_avb_control;

architecture xilinx of main_avb_control is

component avbspi
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
signal port_id :            std_logic_vector(7 downto 0);                       -- PicoBlaze port ID output
signal write_strobe :       std_logic;                                          -- PicoBlaze write strobe
signal read_strobe :        std_logic;                                          -- PicoBlaze read strobe
signal output_port :        std_logic_vector(7 downto 0);                       -- PicoBlaze output port
signal input_port :         std_logic_vector(7 downto 0) := (others => '0');    -- PicoBlaze input port
signal spi_reg :            std_logic_vector(2 downto 0) := "100";              -- [SS,SCK,MOSI] control bits from pBlaze
signal address :            std_logic_vector(9 downto 0);                       -- PicoBlaze ROM address
signal instruction :        std_logic_vector(17 downto 0);                      -- PicoBlaze instruction ROM output

signal Si5324_reg_wr_req :  std_logic := '0';
signal Si5324_reg_rd_req :  std_logic := '0';
signal Si5324_fsel :        std_logic_vector(7 downto 0);

begin

ss   <= spi_reg(2);
sck  <= spi_reg(1);
mosi <= spi_reg(0);

MAIN_SPI_CODEROM : avbspi
port map (
    address             => address,
    instruction         => instruction,
    clk                 => clk);

--
-- PicoBlaze processor
--
MAIN_SPI_PICO : kcpsm3
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
        elsif write_strobe = '1' and port_id(7) = '0' then
            spi_reg <= output_port(2 downto 0);
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if write_strobe = '1' and port_id = X"80" then
            fpga_rev <= output_port;
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if write_strobe = '1' and port_id = X"81" then
            exp_brd_prsnt <= output_port(0);
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if write_strobe = '1' and port_id = X"82" then
            board_options <= output_port;
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if write_strobe = '1' and port_id = X"83" then
            Si5324_FOS2 <= output_port(2);
            Si5324_FOS1 <= output_port(1);
            Si5324_LOL  <= output_port(0);
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if write_strobe = '1' and port_id = X"84" then
            sync_video_fmt(7 downto 0) <= output_port;
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if write_strobe = '1' and port_id = X"85" then
            sync_video_fmt(10 downto 8) <= output_port(2 downto 0);
            sync_updating <= output_port(7);
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if write_strobe = '1' and port_id = X"86" then
            sync_frame_rate <= output_port(2 downto 0);
            sync_m <= output_port(6);
            sync_err <= output_port(7);
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if write_strobe = '1' and port_id = X"87" then
            sdi_eq_cd_n <= output_port;
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if write_strobe = '1' and port_id = X"88" then
            sdi_eq_cli <= output_port(4 downto 0);
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if write_strobe = '1' and port_id = X"89" then
            sdi_drv_fault_n <= output_port;
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if write_strobe = '1' and port_id = X"94" then
            Si5324_reg_rd_dat <= output_port;
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if Si5324_reg_wr = '1' then
            Si5324_reg_wr_req <= '1';
        elsif read_strobe = '1' and port_id = X"95" then
            Si5324_reg_wr_req <= '0';
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if Si5324_reg_rd = '1' then
            Si5324_reg_rd_req <= '1';
        elsif read_strobe = '1' and port_id = X"95" then
            Si5324_reg_rd_req <= '0';
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if Si5324_reg_rd = '1' or Si5324_reg_wr = '1' then
            Si5324_reg_rdy <= '0';
        elsif write_strobe = '1' and port_id = X"96" then
            Si5324_reg_rdy <= '1';
        end if;
    end if;
end process;

process(clk)
begin
    if rising_edge(clk) then
        if write_strobe = '1' and port_id = X"96" then
            Si5324_error <= output_port(6);
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
            input_port <= ("0000000" & miso);
        else
            case port_id(4 downto 0) is
                when "00000" => input_port <= (xbar1_out3_sel & xbar1_out2_sel & xbar1_out1_sel & xbar1_out0_sel);
                when "00001" => input_port <= (xbar2_out3_sel & xbar2_out2_sel & xbar2_out1_sel & xbar2_out0_sel);
                when "00010" => input_port <= (xbar3_out3_sel & xbar3_out2_sel & xbar3_out1_sel & xbar3_out0_sel);
                when "00011" => input_port <= ("000" & Si5324_DHOLD & '0' & Si5324_reset & Si5324_clkin_sel);
                when "00100" => input_port <= Si5324_fsel;
                when "00101" => input_port <= (sdi_rx4_led & sdi_rx3_led & sdi_rx2_led & sdi_rx1_led);
                when "00110" => input_port <= (sdi_rx8_led & sdi_rx7_led & sdi_rx6_led & sdi_rx5_led);
                when "00111" => input_port <= (sdi_tx2_red_led & sdi_tx2_grn_led & sdi_tx1_red_led & sdi_tx1_grn_led);
                when "01000" => input_port <= (sdi_tx4_red_led & sdi_tx4_grn_led & sdi_tx3_red_led & sdi_tx3_grn_led);
                when "01001" => input_port <= (sdi_tx6_red_led & sdi_tx6_grn_led & sdi_tx5_red_led & sdi_tx5_grn_led);
                when "01010" => input_port <= (sdi_tx8_red_led & sdi_tx8_grn_led & sdi_tx7_red_led & sdi_tx7_grn_led);
                when "01011" => input_port <= (aes_rx2_red_led & aes_rx2_grn_led & aes_rx1_red_led & aes_rx1_grn_led);
                when "01100" => input_port <= (aes_tx2_red_led & aes_tx2_grn_led & aes_tx1_red_led & aes_tx1_grn_led);
                when "01101" => input_port <= (madi_tx_red_led & madi_tx_grn_led & madi_rx_red_led & madi_rx_grn_led);
                when "01110" => input_port <= ("0000" & sync_red_led & sync_grn_led);
                when "01111" => input_port <= sdi_eq_ext_3G_reach;
                when "10000" => input_port <= ("00000" & sdi_eq_select);
                when "10001" => input_port <= sdi_drv_hd_sd;
                when "10010" => input_port <= sdi_drv_enable;
                when "10011" => input_port <= Si5324_reg_adr;
                when "10100" => input_port <= Si5324_reg_wr_dat;
                when "10101" => input_port <= ("000000" & Si5324_reg_rd_req & Si5324_reg_wr_req);
                when "10110" => input_port <= ("0000" & Si5324_bw_sel);
                when others  => input_port <= (others => '0');
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

FSEL : Si5324_fsel_lookup
port map (
    clk             => clk,
    in_fsel         => Si5324_in_fsel,
    out_fsel        => Si5324_out_fsel,
    fsel            => Si5324_fsel);

end xilinx;

