-- Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
-- Date        : Mon Sep 16 05:33:22 2019
-- Host        : varun-laptop running 64-bit Service Pack 1  (build 7601)
-- Command     : write_vhdl -force -mode synth_stub -rename_top design_1_pointer_basic_0_1 -prefix
--               design_1_pointer_basic_0_1_ design_1_pointer_basic_0_1_stub.vhdl
-- Design      : design_1_pointer_basic_0_1
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_pointer_basic_0_1 is
  Port ( 
    s_axi_pointer_basic_io_AWADDR : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axi_pointer_basic_io_AWVALID : in STD_LOGIC;
    s_axi_pointer_basic_io_AWREADY : out STD_LOGIC;
    s_axi_pointer_basic_io_WDATA : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_pointer_basic_io_WSTRB : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_pointer_basic_io_WVALID : in STD_LOGIC;
    s_axi_pointer_basic_io_WREADY : out STD_LOGIC;
    s_axi_pointer_basic_io_BRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_pointer_basic_io_BVALID : out STD_LOGIC;
    s_axi_pointer_basic_io_BREADY : in STD_LOGIC;
    s_axi_pointer_basic_io_ARADDR : in STD_LOGIC_VECTOR ( 4 downto 0 );
    s_axi_pointer_basic_io_ARVALID : in STD_LOGIC;
    s_axi_pointer_basic_io_ARREADY : out STD_LOGIC;
    s_axi_pointer_basic_io_RDATA : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_pointer_basic_io_RRESP : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_pointer_basic_io_RVALID : out STD_LOGIC;
    s_axi_pointer_basic_io_RREADY : in STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC;
    interrupt : out STD_LOGIC
  );

end design_1_pointer_basic_0_1;

architecture stub of design_1_pointer_basic_0_1 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axi_pointer_basic_io_AWADDR[4:0],s_axi_pointer_basic_io_AWVALID,s_axi_pointer_basic_io_AWREADY,s_axi_pointer_basic_io_WDATA[31:0],s_axi_pointer_basic_io_WSTRB[3:0],s_axi_pointer_basic_io_WVALID,s_axi_pointer_basic_io_WREADY,s_axi_pointer_basic_io_BRESP[1:0],s_axi_pointer_basic_io_BVALID,s_axi_pointer_basic_io_BREADY,s_axi_pointer_basic_io_ARADDR[4:0],s_axi_pointer_basic_io_ARVALID,s_axi_pointer_basic_io_ARREADY,s_axi_pointer_basic_io_RDATA[31:0],s_axi_pointer_basic_io_RRESP[1:0],s_axi_pointer_basic_io_RVALID,s_axi_pointer_basic_io_RREADY,ap_clk,ap_rst_n,interrupt";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "pointer_basic,Vivado 2018.2";
begin
end;
