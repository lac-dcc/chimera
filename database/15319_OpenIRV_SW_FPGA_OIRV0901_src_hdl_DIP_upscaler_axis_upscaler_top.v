// This program was cloned from: https://github.com/OVGN/OpenIRV
// License: Apache License 2.0

/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: axis_upscaler_top.v
 *  Purpose:  Nearest neighbor upscaling AXI4-Stream top module wrapper with
 *            integrated input/output AXIS width converters.
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


module axis_upscaler_top #
(
    parameter   IMG_RES_X = 0
)
(
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RSTIF RST" *)
    input   wire            axis_aresetn,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLKIF, ASSOCIATED_BUSIF S_AXIS:M_AXIS_IMG_X2:M_AXIS_IMG_X4, ASSOCIATED_RESET axis_aresetn" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLKIF CLK" *)
    input   wire            axis_aclk,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA"  *)          input   wire    [31:0]  s_axis_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *)          input   wire            s_axis_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *)          output  wire            s_axis_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TLAST"  *)          input   wire            s_axis_tlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TUSER"  *)          input   wire            s_axis_tuser,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_IMG_X2, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_IMG_X2 TDATA"  *)   output  wire    [31:0]  m_axis_img_x2_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_IMG_X2 TVALID" *)   output  wire            m_axis_img_x2_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_IMG_X2 TREADY" *)   input   wire            m_axis_img_x2_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_IMG_X2 TLAST"  *)   output  wire            m_axis_img_x2_tlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_IMG_X2 TUSER"  *)   output  wire            m_axis_img_x2_tuser
);

/*-------------------------------------------------------------------------------------------------------------------------------------*/

    /* Checking input parameters */
    generate
        if (IMG_RES_X == 0) begin
            //INVALID_PARAMETER invalid_parameter_msg();
            initial begin
                $error("Invalid parameter!");
            end
        end
    endgenerate

/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    wire            m_axis_wcd_tvalid;
    wire            m_axis_wcd_tready;
    wire    [7:0]   m_axis_wcd_tdata;
    wire            m_axis_wcd_tlast;
    wire            m_axis_wcd_tuser;


    AXIS_WC_4_TO_1 AXIS_WC_4_TO_1_inst
    (
        .aclk           ( axis_aclk              ),     // input wire aclk
        .aresetn        ( axis_aresetn           ),     // input wire aresetn
        
        .s_axis_tdata   ( s_axis_tdata           ),     // input wire [31 : 0] s_axis_tdata
        .s_axis_tvalid  ( s_axis_tvalid          ),     // input wire s_axis_tvalid
        .s_axis_tready  ( s_axis_tready          ),     // output wire s_axis_tready
        .s_axis_tlast   ( s_axis_tlast           ),     // input wire s_axis_tlast
        .s_axis_tuser   ( {s_axis_tuser, 3'b000} ),     // input wire [3 : 0] s_axis_tuser
        
        .m_axis_tdata   ( m_axis_wcd_tdata       ),     // output wire [7 : 0] m_axis_tdata
        .m_axis_tvalid  ( m_axis_wcd_tvalid      ),     // output wire m_axis_tvalid
        .m_axis_tready  ( m_axis_wcd_tready      ),     // input wire m_axis_tready
        .m_axis_tlast   ( m_axis_wcd_tlast       ),     // output wire m_axis_tlast
        .m_axis_tuser   ( m_axis_wcd_tuser       )      // output wire [0 : 0] m_axis_tuser
    );
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    wire            m_axis_ups_x2_tvalid;
    wire            m_axis_ups_x2_tready;
    wire    [7:0]   m_axis_ups_x2_tdata;
    wire            m_axis_ups_x2_tlast;
    wire            m_axis_ups_x2_tuser;
    
    
    axis_nn_upscaler #
    (
        .IMG_RES_X ( IMG_RES_X )
    )
    axis_nn_upscaler_x2_inst
    (
        .axis_aresetn   ( axis_aresetn         ),
        .axis_aclk      ( axis_aclk            ),
        
        .s_axis_tdata   ( m_axis_wcd_tdata     ),
        .s_axis_tvalid  ( m_axis_wcd_tvalid    ),
        .s_axis_tready  ( m_axis_wcd_tready    ), 
        .s_axis_tlast   ( m_axis_wcd_tlast     ),
        .s_axis_tuser   ( m_axis_wcd_tuser     ),
        
        .m_axis_tdata   ( m_axis_ups_x2_tdata  ),
        .m_axis_tvalid  ( m_axis_ups_x2_tvalid ),
        .m_axis_tready  ( m_axis_ups_x2_tready ),
        .m_axis_tlast   ( m_axis_ups_x2_tlast  ),
        .m_axis_tuser   ( m_axis_ups_x2_tuser  )
    );
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/

    wire    [31:0]  m_axis_wcu_x2_tdata;
    wire            m_axis_wcu_x2_tvalid;
    wire            m_axis_wcu_x2_tready;
    wire            m_axis_wcu_x2_tlast;
    wire    [3:0]   m_axis_wcu_x2_tuser;
    
    
    AXIS_WC_1_TO_4 AXIS_WC_1_TO_4_inst_x2
    (
        .aclk           ( axis_aclk            ),   // input wire aclk
        .aresetn        ( axis_aresetn         ),   // input wire aresetn
        
        .s_axis_tdata   ( m_axis_ups_x2_tdata  ),   // input wire [7 : 0] s_axis_tdata
        .s_axis_tvalid  ( m_axis_ups_x2_tvalid ),   // input wire s_axis_tvalid
        .s_axis_tready  ( m_axis_ups_x2_tready ),   // output wire s_axis_tready
        .s_axis_tlast   ( m_axis_ups_x2_tlast  ),   // input wire s_axis_tlast
        .s_axis_tuser   ( m_axis_ups_x2_tuser  ),   // input wire [0 : 0] s_axis_tuser
        
        .m_axis_tdata   ( m_axis_wcu_x2_tdata  ),   // output wire [31 : 0] m_axis_tdata
        .m_axis_tvalid  ( m_axis_wcu_x2_tvalid ),   // output wire m_axis_tvalid
        .m_axis_tready  ( m_axis_wcu_x2_tready ),   // input wire m_axis_tready
        .m_axis_tkeep   ( /*-------NC-------*/ ),   // output wire [3 : 0] m_axis_tkeep
        .m_axis_tlast   ( m_axis_wcu_x2_tlast  ),   // output wire m_axis_tlast
        .m_axis_tuser   ( m_axis_wcu_x2_tuser  )    // output wire [3 : 0] m_axis_tuser
    );
    
    
    assign m_axis_img_x2_tdata  = m_axis_wcu_x2_tdata;
    assign m_axis_img_x2_tvalid = m_axis_wcu_x2_tvalid;
    assign m_axis_wcu_x2_tready = m_axis_img_x2_tready;
    assign m_axis_img_x2_tlast  = m_axis_wcu_x2_tlast;
    assign m_axis_img_x2_tuser  = m_axis_wcu_x2_tuser[3];
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
