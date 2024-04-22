--*****************************************************************************
-- DISCLAIMER OF LIABILITY
--
-- This file contains proprietary and confidential information of
-- Xilinx, Inc. ("Xilinx"), that is distributed under a license
-- from Xilinx, and may be used, copied and/or disclosed only
-- pursuant to the terms of a valid license agreement with Xilinx.
--
-- XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION
-- ("MATERIALS") "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
-- EXPRESSED, IMPLIED, OR STATUTORY, INCLUDING WITHOUT
-- LIMITATION, ANY WARRANTY WITH RESPECT TO NONINFRINGEMENT,
-- MERCHANTABILITY OR FITNESS FOR ANY PARTICULAR PURPOSE. Xilinx
-- does not warrant that functions included in the Materials will
-- meet the requirements of Licensee, or that the operation of the
-- Materials will be uninterrupted or error-free, or that defects
-- in the Materials will be corrected. Furthermore, Xilinx does
-- not warrant or make any representations regarding use, or the
-- results of the use, of the Materials in terms of correctness,
-- accuracy, reliability or otherwise.
--
-- Xilinx products are not designed or intended to be fail-safe,
-- or for use in any application requiring fail-safe performance,
-- such as life-support or safety devices or systems, Class III
-- medical devices, nuclear facilities, applications related to
-- the deployment of airbags, or any other applications that could
-- lead to death, personal injury or severe property or
-- environmental damage (individually and collectively, "critical
-- applications"). Customer assumes the sole risk and liability
-- of any use of Xilinx products in critical applications,
-- subject only to applicable laws and regulations governing
-- limitations on product liability.
--
-- Copyright 2005, 2006, 2007, 2008 Xilinx, Inc.
-- All rights reserved.
--
-- This disclaimer and copyright notice must be retained as part
-- of this file at all times.
--*****************************************************************************
--   ____  ____
--  /   /\/   /
-- /___/  \  /   Vendor             : Xilinx
-- \   \   \/    Version	    : 3.6.1
--  \   \        Application	    : MIG
--  /   /        Filename           : DDR2_Ram_Core_data_path_0.vhd
-- /___/   /\    Date Last Modified : $Date: 2010/11/26 18:25:42 $
-- \   \  /  \   Date Created       : Mon May 2 2005
--  \___\/\___\
-- Device      : Spartan-3/3A/3A-DSP
-- Design Name : DDR2 SDRAM
-- Purpose     : This module has the write and read data paths for the
--               DDR2 memory interface. The write data along with write enable
--               signals are forwarded to the DDR IOB FFs. The read data is
--               captured in CLB FFs and finally input to FIFOs.
--*****************************************************************************

library ieee;
library UNISIM;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use UNISIM.VCOMPONENTS.all;
use work.DDR2_Ram_Core_parameters_0.all;

entity DDR2_Ram_Core_data_path_0 is
  port(
    user_input_data    : in  std_logic_vector(((2*DATA_WIDTH)-1) downto 0);
    user_data_mask     : in  std_logic_vector((2*DATA_MASK_WIDTH-1) downto 0);
    clk                : in  std_logic;
    clk90              : in  std_logic;
    reset              : in  std_logic;
    reset90            : in  std_logic;
    write_enable       : in  std_logic;
    rst_dqs_div_in     : in  std_logic;
    delay_sel          : in  std_logic_vector(4 downto 0);
    dqs_int_delay_in   : in std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
    dq                 : in  std_logic_vector((DATA_WIDTH-1) downto 0);
    u_data_val         : out std_logic;
    user_output_data   : out std_logic_vector(((2*DATA_WIDTH)-1) downto 0);
    write_en_val       : out std_logic;
    data_mask_f        : out std_logic_vector((DATA_MASK_WIDTH-1) downto 0);
    data_mask_r        : out std_logic_vector((DATA_MASK_WIDTH-1) downto 0);
    write_data_falling : out std_logic_vector((DATA_WIDTH-1) downto 0);
    write_data_rising  : out std_logic_vector((DATA_WIDTH-1) downto 0);
    read_fifo_rden     : in std_logic;  -- Added new signal
    -- debug signals
    vio_out_dqs            : in  std_logic_vector(4 downto 0);
    vio_out_dqs_en         : in  std_logic;
    vio_out_rst_dqs_div    : in  std_logic_vector(4 downto 0);
    vio_out_rst_dqs_div_en : in  std_logic
    );
end DDR2_Ram_Core_data_path_0;

architecture arc of DDR2_Ram_Core_data_path_0 is

  component DDR2_Ram_Core_data_read_0
    port(
      clk90             : in  std_logic;
      reset90           : in  std_logic;
      ddr_dq_in         : in  std_logic_vector((DATA_WIDTH-1) downto 0);
      fifo_0_wr_en      : in std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
      fifo_1_wr_en      : in std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
      fifo_0_wr_addr    : in std_logic_vector((4*DATA_STROBE_WIDTH)-1 downto 0);
      fifo_1_wr_addr    : in std_logic_vector((4*DATA_STROBE_WIDTH)-1 downto 0);
      dqs_delayed_col0  : in std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
      dqs_delayed_col1  : in std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
      read_fifo_rden    : in std_logic;  
      user_output_data  : out std_logic_vector(((2*DATA_WIDTH)-1) downto 0);
      u_data_val        : out std_logic

      );
  end component;

  component DDR2_Ram_Core_data_read_controller_0
    port(
      clk                    : in  std_logic;
      reset                  : in  std_logic;
      rst_dqs_div_in         : in  std_logic;
      delay_sel              : in  std_logic_vector(4 downto 0);
      dqs_int_delay_in       : in std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
      fifo_0_wr_en_val       : out std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
      fifo_1_wr_en_val       : out std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
      fifo_0_wr_addr_val     : out std_logic_vector((4*DATA_STROBE_WIDTH)-1 downto 0);
      fifo_1_wr_addr_val     : out std_logic_vector((4*DATA_STROBE_WIDTH)-1 downto 0);
      dqs_delayed_col0_val   : out std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
      dqs_delayed_col1_val   : out std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
      vio_out_dqs            : in  std_logic_vector(4 downto 0);
      vio_out_dqs_en         : in  std_logic;
      vio_out_rst_dqs_div    : in  std_logic_vector(4 downto 0);
      vio_out_rst_dqs_div_en : in  std_logic
      );
  end component;

  component DDR2_Ram_Core_data_write_0
    port(
      user_input_data    : in  std_logic_vector(((2*DATA_WIDTH)-1) downto 0);
      user_data_mask     : in  std_logic_vector((2*DATA_MASK_WIDTH-1) downto 0);
      clk90              : in  std_logic;
      write_enable       : in  std_logic;
      write_en_val       : out std_logic;
      data_mask_f        : out std_logic_vector((DATA_MASK_WIDTH-1) downto 0);
      data_mask_r        : out std_logic_vector((DATA_MASK_WIDTH-1) downto 0);
      write_data_falling : out std_logic_vector((DATA_WIDTH-1) downto 0);
      write_data_rising  : out std_logic_vector((DATA_WIDTH-1) downto 0)
      );
  end component;


  signal fifo0_rd_addr     : std_logic_vector(3 downto 0);
  signal fifo1_rd_addr     : std_logic_vector(3 downto 0);
  signal read_valid_data_1 : std_logic;
  signal fifo_0_wr_addr    : std_logic_vector((4*DATA_STROBE_WIDTH)-1 downto 0);
  signal fifo_1_wr_addr    : std_logic_vector((4*DATA_STROBE_WIDTH)-1 downto 0);
  signal fifo_0_wr_en      : std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
  signal fifo_1_wr_en      : std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
  signal dqs_delayed_col0  : std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);
  signal dqs_delayed_col1  : std_logic_vector((DATA_STROBE_WIDTH-1) downto 0);

begin

  data_read0 : DDR2_Ram_Core_data_read_0
    port map (
      clk90             => clk90,
      reset90           => reset90,
      ddr_dq_in         => dq,
      fifo_0_wr_en      => fifo_0_wr_en,
      fifo_1_wr_en      => fifo_1_wr_en,
      fifo_0_wr_addr    => fifo_0_wr_addr,
      fifo_1_wr_addr    => fifo_1_wr_addr,
      dqs_delayed_col0  => dqs_delayed_col0,
      dqs_delayed_col1  => dqs_delayed_col1,
      read_fifo_rden    => read_fifo_rden,
      user_output_data  => user_output_data,
      u_data_val        => u_data_val
      );

  data_read_controller0 : DDR2_Ram_Core_data_read_controller_0
    port map (
      clk                    => clk,
      reset                  => reset,
      rst_dqs_div_in         => rst_dqs_div_in,
      delay_sel              => delay_sel,
      dqs_int_delay_in       => dqs_int_delay_in,
      fifo_0_wr_en_val       => fifo_0_wr_en,
      fifo_1_wr_en_val       => fifo_1_wr_en,
      fifo_0_wr_addr_val     => fifo_0_wr_addr,
      fifo_1_wr_addr_val     => fifo_1_wr_addr,
      dqs_delayed_col0_val   => dqs_delayed_col0,
      dqs_delayed_col1_val   => dqs_delayed_col1,
      vio_out_dqs            => vio_out_dqs,
      vio_out_dqs_en         => vio_out_dqs_en,
      vio_out_rst_dqs_div    => vio_out_rst_dqs_div,
      vio_out_rst_dqs_div_en => vio_out_rst_dqs_div_en
      );

  data_write0 : DDR2_Ram_Core_data_write_0
    port map (
      user_input_data    => user_input_data,
      user_data_mask     => user_data_mask,
      clk90              => clk90,
      write_enable       => write_enable,
      write_en_val       => write_en_val,
      write_data_falling => write_data_falling,
      write_data_rising  => write_data_rising,
      data_mask_f        => data_mask_f,
      data_mask_r        => data_mask_r
      );



end arc;
