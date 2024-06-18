// This program was cloned from: https://github.com/OVGN/OpenIRV
// License: Apache License 2.0

/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: axis_hist_remapper.v
 *  Purpose:  AXI4-Stream wrapper for histogram LUT RAM. Current module allows
 *            to rebuild incoming image histogram over RAM-based lookup table.
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


module axis_hist_remapper
(
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RSTIF RST" *)
    input   wire            axis_aresetn,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLKIF, ASSOCIATED_BUSIF S_AXIS:M_AXIS, ASSOCIATED_RESET axis_aresetn" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLKIF CLK" *)
    input   wire            axis_aclk,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA"  *)  input   wire    [15:0]  s_axis_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *)  input   wire            s_axis_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *)  output  wire            s_axis_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TLAST"  *)  input   wire            s_axis_tlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TUSER"  *)  input   wire            s_axis_tuser,
    
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA"  *)  output  wire    [31:0]  m_axis_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *)  output  wire            m_axis_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *)  input   wire            m_axis_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TLAST"  *)  output  wire            m_axis_tlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TUSER"  *)  output  wire            m_axis_tuser,
    
    input   wire            hist_lut_ram_we,
    input   wire    [13:0]  hist_lut_ram_addr,
    input   wire    [7:0]   hist_lut_ram_din
);
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/

    localparam  PIPE_DATA_IN_WIDTH  = 14;
    localparam  PIPE_DATA_OUT_WIDTH = 8;
    localparam  PIPE_QUAL_WIDTH     = 1;
    localparam  PIPE_STAGES         = 2;

    wire                                pipe_cen;
    wire    [PIPE_DATA_IN_WIDTH - 1:0]  pipe_in_data;
    wire    [PIPE_DATA_OUT_WIDTH - 1:0] pipe_out_data;
    
    wire    [7:0]   m_axis_pipe_tdata;
    wire            m_axis_pipe_tvalid;
    wire            m_axis_pipe_tready;
    wire            m_axis_pipe_tlast;
    wire            m_axis_pipe_tuser;
    
    
    axis_pipeliner #
    (
        .PIPE_DATA_IN_WIDTH ( PIPE_DATA_IN_WIDTH  ),
        .PIPE_DATA_OUT_WIDTH( PIPE_DATA_OUT_WIDTH ),
        .PIPE_QUAL_WIDTH    ( PIPE_QUAL_WIDTH     ),
        .PIPE_STAGES        ( PIPE_STAGES         )
    )
    axis_pipeliner
    (
        .axis_aclk      ( axis_aclk          ),
        .axis_aresetn   ( axis_aresetn       ),
        
        .s_axis_tdata   ( s_axis_tdata[13:0] ),
        .s_axis_tuser   ( s_axis_tuser       ),
        .s_axis_tvalid  ( s_axis_tvalid      ),
        .s_axis_tready  ( s_axis_tready      ),
        .s_axis_tlast   ( s_axis_tlast       ),
        
        .m_axis_tdata   ( m_axis_pipe_tdata  ),
        .m_axis_tuser   ( m_axis_pipe_tuser  ),
        .m_axis_tvalid  ( m_axis_pipe_tvalid ),
        .m_axis_tready  ( m_axis_pipe_tready ),
        .m_axis_tlast   ( m_axis_pipe_tlast  ),
        
        .pipe_cen       ( pipe_cen           ),
        .pipe_in_data   ( pipe_in_data       ),
        .pipe_out_data  ( pipe_out_data      )
    );
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/

    HIST_LUT_RAM HIST_LUT_RAM
    (
        .clka   ( axis_aclk         ),  // input clka
        .ena    ( 1'b1              ),  // input ena
        .wea    ( hist_lut_ram_we   ),  // input [0 : 0] wea
        .addra  ( hist_lut_ram_addr ),  // input [13 : 0] addra
        .dina   ( hist_lut_ram_din  ),  // input [7 : 0] dina
        
        .clkb   ( axis_aclk         ),  // input clkb
        .enb    ( pipe_cen          ),  // input enb
        .addrb  ( pipe_in_data      ),  // input [13 : 0] addrb
        .doutb  ( pipe_out_data     )   // output [7 : 0] doutb
    );

/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    wire    [31:0]  m_axis_wcu_tdata;
    wire            m_axis_wcu_tvalid;
    wire            m_axis_wcu_tready;
    wire            m_axis_wcu_tlast;
    wire    [3:0]   m_axis_wcu_tuser;
    
    
    AXIS_WC_1_TO_4 AXIS_WC_1_TO_4_inst
    (
        .aclk           ( axis_aclk             ),  // input wire aclk
        .aresetn        ( axis_aresetn          ),  // input wire aresetn
        
        .s_axis_tvalid  ( m_axis_pipe_tvalid    ),  // input wire s_axis_tvalid
        .s_axis_tready  ( m_axis_pipe_tready    ),  // output wire s_axis_tready
        .s_axis_tdata   ( m_axis_pipe_tdata     ),  // input wire [7 : 0] s_axis_tdata
        .s_axis_tlast   ( m_axis_pipe_tlast     ),  // input wire s_axis_tlast
        .s_axis_tuser   ( m_axis_pipe_tuser     ),  // input wire [0 : 0] s_axis_tuser
        
        .m_axis_tvalid  ( m_axis_wcu_tvalid     ),  // output wire m_axis_tvalid
        .m_axis_tready  ( m_axis_wcu_tready     ),  // input wire m_axis_tready
        .m_axis_tdata   ( m_axis_wcu_tdata      ),  // output wire [31 : 0] m_axis_tdata
        .m_axis_tkeep   ( /*-------NC-------*/  ),  // output wire [3 : 0] m_axis_tkeep
        .m_axis_tlast   ( m_axis_wcu_tlast      ),  // output wire m_axis_tlast
        .m_axis_tuser   ( m_axis_wcu_tuser      )   // output wire [3 : 0] m_axis_tuser
    );
    
    
    assign m_axis_tdata  = m_axis_wcu_tdata;
    assign m_axis_tvalid = m_axis_wcu_tvalid;
    assign m_axis_tlast  = m_axis_wcu_tlast;
    assign m_axis_tuser  = m_axis_wcu_tuser[3];
    assign m_axis_wcu_tready = m_axis_tready;
    
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
