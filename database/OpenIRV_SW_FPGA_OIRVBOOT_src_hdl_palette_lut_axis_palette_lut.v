/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: axis_palette_lut.v
 *  Purpose:  AXI4-Stream wrapper for palette LUT RAM.
 * ----------------------------------------------------------------------------
 *  Copyright © 2020-2021, Vaagn Oganesyan <ovgn@protonmail.com>
 *  
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *  
 *      http://www.apache.org/licenses/LICENSE-2.0
 *  
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 * ----------------------------------------------------------------------------
 */


`default_nettype none
`timescale 1ps / 1ps


module axis_palette_lut #
(
    parameter integer COLOR_WIDTH = 16
)
(
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_RSTIF, POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S_RSTIF RST" *)
    input   wire    axis_aresetn,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_CLKIF, ASSOCIATED_BUSIF S_AXIS:M_AXIS, ASSOCIATED_RESET axis_aresetn" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S_CLKIF CLK" *)
    input   wire    axis_aclk,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA"  *)  input   wire    [7:0]               s_axis_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *)  input   wire                        s_axis_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *)  output  wire                        s_axis_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TUSER"  *)  input   wire                        s_axis_tuser,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA"  *)  output  wire    [COLOR_WIDTH - 1:0] m_axis_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *)  output  wire                        m_axis_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *)  input   wire                        m_axis_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TUSER"  *)  output  wire                        m_axis_tuser,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME LUT_RAM, MEM_SIZE 1024, MASTER_TYPE BRAM_CTRL, MEM_WIDTH 32, MEM_ECC NONE, READ_LATENCY 1, READ_WRITE_MODE READ_WRITE" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 LUT_RAM CLK"   *)  output  wire                        lut_ram_clk,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 LUT_RAM RST"   *)  output  wire                        lut_ram_rst,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 LUT_RAM EN "   *)  output  wire                        lut_ram_ena,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 LUT_RAM WE"    *)  output  wire    [3:0]               lut_ram_we,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 LUT_RAM ADDR"  *)  output  wire    [31:0]              lut_ram_addr,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 LUT_RAM DIN"   *)  output  wire    [31:0]              lut_ram_wdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:bram:1.0 LUT_RAM DOUT"  *)  input   wire    [31:0]              lut_ram_rdata
);
    
    localparam  integer PIPE_DATA_IN_WIDTH  = 8;
    localparam  integer PIPE_DATA_OUT_WIDTH = COLOR_WIDTH;
    localparam  integer PIPE_QUAL_WIDTH     = 1;
    localparam  integer PIPE_STAGES         = 1;

/*-------------------------------------------------------------------------------------------------------------------------------------*/

    wire                                pipe_cen;
    wire    [PIPE_DATA_IN_WIDTH - 1:0]  pipe_in_data;
    wire    [PIPE_DATA_OUT_WIDTH - 1:0] pipe_out_data;
    
    
    axis_pipeliner #
    (
        .PIPE_DATA_IN_WIDTH ( PIPE_DATA_IN_WIDTH  ),
        .PIPE_DATA_OUT_WIDTH( PIPE_DATA_OUT_WIDTH ),
        .PIPE_QUAL_WIDTH    ( PIPE_QUAL_WIDTH     ),
        .PIPE_STAGES        ( PIPE_STAGES         )
    )
    axis_pipeliner
    (
        .axis_aclk      ( axis_aclk     ),
        .axis_aresetn   ( axis_aresetn  ),
        
        .s_axis_tdata   ( s_axis_tdata  ),
        .s_axis_tuser   ( s_axis_tuser  ),
        .s_axis_tvalid  ( s_axis_tvalid ),
        .s_axis_tready  ( s_axis_tready ),
        .s_axis_tlast   ( 1'b0          ),
        
        .m_axis_tdata   ( m_axis_tdata  ),
        .m_axis_tuser   ( m_axis_tuser  ),
        .m_axis_tvalid  ( m_axis_tvalid ),
        .m_axis_tready  ( m_axis_tready ),
        .m_axis_tlast   ( /*---NC---*/  ),
        
        .pipe_cen       ( pipe_cen      ),
        .pipe_in_data   ( pipe_in_data  ),
        .pipe_out_data  ( pipe_out_data )
    );
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    assign  lut_ram_clk   = axis_aclk;
    assign  lut_ram_rst   = 1'b0;
    assign  lut_ram_ena   = pipe_cen;
    assign  lut_ram_we    = 4'b0000;
    assign  lut_ram_addr  = {{22{1'b0}}, pipe_in_data, {2{1'b0}}};
    assign  lut_ram_wdata = {32{1'b0}};
    assign  pipe_out_data = lut_ram_rdata[COLOR_WIDTH - 1:0];
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
