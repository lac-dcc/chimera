// This program was cloned from: https://github.com/OVGN/OpenIRV
// License: Apache License 2.0

/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: axis_yuv444_to_yuv422.v
 *  Purpose:  AXI4-Stream wrapper for YUV444 to YUV422 color converter.
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


module axis_yuv444_to_yuv422 #
(
    parameter   BYTE_ORDER = "NOT_SELECTED"
)
(
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RSTIF RST" *)
    input   wire            axis_aresetn,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLKIF, ASSOCIATED_BUSIF S_AXIS:M_AXIS, ASSOCIATED_RESET axis_aresetn" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLKIF CLK" *)
    input   wire            axis_aclk,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA"  *)  input   wire    [31:0]  s_axis_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *)  input   wire            s_axis_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *)  output  wire            s_axis_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TUSER"  *)  input   wire            s_axis_tuser,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA"  *)  output  wire    [7:0]   m_axis_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *)  output  wire            m_axis_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *)  input   wire            m_axis_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TUSER"  *)  output  wire            m_axis_tuser
);
    
    localparam  PIPE_DATA_IN_WIDTH  = 48;
    localparam  PIPE_DATA_OUT_WIDTH = 32;
    localparam  PIPE_QUAL_WIDTH = 2;
    localparam  PIPE_STAGES     = 1;

/*-------------------------------------------------------------------------------------------------------------------------------------*/

    wire    [63:0]  axis_wcu_m_tdata;
    wire            axis_wcu_m_tvalid;
    wire            axis_wcu_m_tready;
    wire    [7:0]   axis_wcu_m_tuser;
    

    AXIS_WC_4_TO_8 AXIS_WC_4_TO_8_inst
    (
        .aclk           ( axis_aclk             ),      // input wire aclk
        .aresetn        ( axis_aresetn          ),      // input wire aresetn
        
        .s_axis_tvalid  ( s_axis_tvalid         ),      // input wire s_axis_tvalid
        .s_axis_tready  ( s_axis_tready         ),      // output wire s_axis_tready
        .s_axis_tdata   ( s_axis_tdata          ),      // input wire [31 : 0] s_axis_tdata
        .s_axis_tlast   ( 1'b0                  ),      // input wire s_axis_tlast
        .s_axis_tuser   ( {s_axis_tuser, 3'b000}),      // input wire [3 : 0] s_axis_tuser
        
        .m_axis_tvalid  ( axis_wcu_m_tvalid     ),      // output wire m_axis_tvalid
        .m_axis_tready  ( axis_wcu_m_tready     ),      // input wire m_axis_tready
        .m_axis_tdata   ( axis_wcu_m_tdata      ),      // output wire [63 : 0] m_axis_tdata
        .m_axis_tkeep   ( /*--------NC-------*/ ),      // output wire [7 : 0] m_axis_tkeep
        .m_axis_tlast   ( /*--------NC-------*/ ),      // output wire m_axis_tlast
        .m_axis_tuser   ( axis_wcu_m_tuser      )       // output wire [7 : 0] m_axis_tuser
    );
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/

    wire                                pipe_cen;
    wire    [PIPE_DATA_IN_WIDTH - 1:0]  pipe_in_data;
    wire    [PIPE_DATA_OUT_WIDTH - 1:0] pipe_out_data;
    
    wire    [31:0]  axis_yuv422_m_tdata;
    wire            axis_yuv422_m_tvalid;
    wire            axis_yuv422_m_tready;
    wire    [1:0]   axis_yuv422_m_tuser;
    
    
    axis_pipeliner #
    (
        .PIPE_DATA_IN_WIDTH ( PIPE_DATA_IN_WIDTH  ),
        .PIPE_DATA_OUT_WIDTH( PIPE_DATA_OUT_WIDTH ),
        .PIPE_QUAL_WIDTH    ( PIPE_QUAL_WIDTH     ),
        .PIPE_STAGES        ( PIPE_STAGES         )
    )
    axis_pipeliner
    (
        .axis_aclk      ( axis_aclk         ),
        .axis_aresetn   ( axis_aresetn      ),
        
        .s_axis_tdata   ({axis_wcu_m_tdata[55:32], 
                          axis_wcu_m_tdata[23:0]}),
        .s_axis_tuser   ({axis_wcu_m_tuser[7],
                          axis_wcu_m_tuser[3]}),
        .s_axis_tvalid  ( axis_wcu_m_tvalid ),
        .s_axis_tready  ( axis_wcu_m_tready ),
        .s_axis_tlast   ( 1'b0              ),
        
        .m_axis_tdata   ( axis_yuv422_m_tdata  ),
        .m_axis_tuser   ( axis_yuv422_m_tuser  ),
        .m_axis_tvalid  ( axis_yuv422_m_tvalid ),
        .m_axis_tready  ( axis_yuv422_m_tready ),
        .m_axis_tlast   ( /*-------NC-------*/ ),
        
        .pipe_cen       ( pipe_cen      ),
        .pipe_in_data   ( pipe_in_data  ),
        .pipe_out_data  ( pipe_out_data )
    );


    wire    [7:0]   Y0_in = pipe_in_data[23:16];
    wire    [7:0]   U0_in = pipe_in_data[15:8];
    wire    [7:0]   V0_in = pipe_in_data[7:0];
    
    wire    [7:0]   Y1_in = pipe_in_data[47:40];
    wire    [7:0]   U1_in = pipe_in_data[39:32];
    wire    [7:0]   V1_in = pipe_in_data[31:24];
    
    wire    [7:0]   Y0_out;
    wire    [7:0]   U_out;
    wire    [7:0]   Y1_out;
    wire    [7:0]   V_out;
    
    
    yuv444_to_yuv422 yuv444_to_yuv422_inst
    (
        .clk    ( axis_aclk ),
        .cen    ( pipe_cen  ),
        
        .y0_in  ( Y0_in     ),
        .u0_in  ( U0_in     ),
        .v0_in  ( V0_in     ),
        
        .y1_in  ( Y1_in     ),
        .u1_in  ( U1_in     ),
        .v1_in  ( V1_in     ),
        
        .y0_out ( Y0_out    ),
        .u_out  ( U_out     ),
        .y1_out ( Y1_out    ),
        .v_out  ( V_out     )
    );

    /* Configure output 422 pixel component byte order */
    generate
        if (BYTE_ORDER == "VYUY") begin     /* USB UVC byte order */
            assign pipe_out_data = {V_out, Y1_out, U_out, Y0_out};
        end else begin
            if (BYTE_ORDER == "YVYU") begin     /* AV byte order */
                assign pipe_out_data = {Y1_out, V_out, Y0_out, U_out};
            end else begin
                //INVALID_PARAMETER invalid_parameter_msg();
                initial begin
                    $error("Invalid parameter!");
                end
            end
        end
    endgenerate
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    AXIS_WC_4_TO_1 AXIS_WC_4_TO_1_inst
    (
        .aclk           ( axis_aclk     ),                      // input wire aclk
        .aresetn        ( axis_aresetn  ),                      // input wire aresetn
        
        .s_axis_tdata   ( axis_yuv422_m_tdata   ),              // input wire [31 : 0] s_axis_tdata
        .s_axis_tvalid  ( axis_yuv422_m_tvalid  ),              // input wire s_axis_tvalid
        .s_axis_tready  ( axis_yuv422_m_tready  ),              // output wire s_axis_tready
        .s_axis_tlast   ( 1'b0                  ),              // input wire s_axis_tlast
        .s_axis_tuser   ( {axis_yuv422_m_tuser[1], 1'b0,
                           axis_yuv422_m_tuser[0], 1'b0} ),     // input wire [3 : 0] s_axis_tuser
        
        .m_axis_tdata   ( m_axis_tdata  ),                      // output wire [7 : 0] m_axis_tdata
        .m_axis_tvalid  ( m_axis_tvalid ),                      // output wire m_axis_tvalid
        .m_axis_tready  ( m_axis_tready ),                      // input wire m_axis_tready
        .m_axis_tlast   ( /*----NC---*/ ),                      // output wire m_axis_tlast
        .m_axis_tuser   ( m_axis_tuser  )                       // output wire [0 : 0] m_axis_tuser
    );
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
