// This program was cloned from: https://github.com/OVGN/OpenIRV
// License: Apache License 2.0

/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: axis_nuc.v
 *  Purpose:  AXI4-Stream wrapper for nuc_dsp module.
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


module axis_nuc
(
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RSTIF, POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RSTIF RST" *)
    input   wire            axis_aresetn,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLKIF, ASSOCIATED_BUSIF S_AXIS_GAIN:S_AXIS_OFST:S_AXIS_RAW:M_AXIS_NUC, ASSOCIATED_RESET axis_aresetn" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLKIF CLK" *)
    input   wire            axis_aclk,
    
    input   wire            bypass,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_GAIN, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_GAIN TDATA"  *) input   wire    [31:0]  s_axis_gain_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_GAIN TVALID" *) input   wire            s_axis_gain_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_GAIN TREADY" *) output  wire            s_axis_gain_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_GAIN TLAST"  *) input   wire            s_axis_gain_tlast,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_OFST, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_OFST TDATA"  *) input   wire    [31:0]  s_axis_ofst_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_OFST TVALID" *) input   wire            s_axis_ofst_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_OFST TREADY" *) output  wire            s_axis_ofst_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_OFST TLAST"  *) input   wire            s_axis_ofst_tlast,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS_RAW, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_RAW  TDATA"  *) input   wire    [31:0]  s_axis_raw_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_RAW  TVALID" *) input   wire            s_axis_raw_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_RAW  TREADY" *) output  wire            s_axis_raw_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_RAW  TLAST"  *) input   wire            s_axis_raw_tlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS_RAW  TUSER"  *) input   wire            s_axis_raw_tuser,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME M_AXIS_NUC, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_NUC  TDATA"  *) output  wire    [31:0]  m_axis_nuc_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_NUC  TVALID" *) output  wire            m_axis_nuc_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_NUC  TREADY" *) input   wire            m_axis_nuc_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_NUC  TLAST"  *) output  wire            m_axis_nuc_tlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS_NUC  TUSER"  *) output  wire            m_axis_nuc_tuser
);
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    localparam  PIPE_DATA_IN_WIDTH  = 32;
    localparam  PIPE_DATA_OUT_WIDTH = 32;
    localparam  PIPE_QUAL_WIDTH     = 1;
    localparam  PIPE_STAGES         = 5;    // nuc_dsp pipeline delay

/*-------------------------------------------------------------------------------------------------------------------------------------*/

    wire    [31:0]  s_axis_tdata  = s_axis_raw_tdata;
    wire            s_axis_tvalid = s_axis_gain_tvalid & s_axis_ofst_tvalid & s_axis_raw_tvalid;
    wire            s_axis_tlast  = s_axis_raw_tlast;
    wire            s_axis_tuser  = s_axis_raw_tuser;
    wire            s_axis_tready;
    
    
    assign          s_axis_gain_tready = s_axis_tready & s_axis_tvalid;
    assign          s_axis_ofst_tready = s_axis_tready & s_axis_tvalid;
    assign          s_axis_raw_tready  = s_axis_tready & s_axis_tvalid;
    
    
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
        .axis_aclk      ( axis_aclk         ),
        .axis_aresetn   ( axis_aresetn      ),
        
        .s_axis_tdata   ( s_axis_tdata      ),
        .s_axis_tuser   ( s_axis_tuser      ),
        .s_axis_tvalid  ( s_axis_tvalid     ),
        .s_axis_tready  ( s_axis_tready     ),
        .s_axis_tlast   ( s_axis_tlast      ),
        
        .m_axis_tdata   ( m_axis_nuc_tdata  ),
        .m_axis_tuser   ( m_axis_nuc_tuser  ),
        .m_axis_tvalid  ( m_axis_nuc_tvalid ),
        .m_axis_tready  ( m_axis_nuc_tready ),
        .m_axis_tlast   ( m_axis_nuc_tlast  ),
        
        .pipe_cen       ( pipe_cen          ),
        .pipe_in_data   ( pipe_in_data      ),
        .pipe_out_data  ( pipe_out_data     )
    );
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    wire    [13:0]  dout_even;
    wire    [13:0]  dout_odd;
    wire            dout_even_good;
    wire            dout_odd_good;
    
    
    nuc_dsp nuc_dsp_even_pix
    (
        .clk        ( axis_aclk                ),
        .cen        ( pipe_cen                 ),
        .sresetn    ( axis_aresetn             ),
        .bypass     ( bypass                   ),
        
        .din        ( pipe_in_data[13:0]       ),
        .gain       ( s_axis_gain_tdata[15:0]  ),
        .ofst       ( s_axis_ofst_tdata[15:0]  ),
        
        .dout_good  ( dout_even_good           ),
        .dout       ( dout_even                )
    );
    
    
    nuc_dsp nuc_dsp_odd_pix
    (
        .clk        ( axis_aclk                ),
        .cen        ( pipe_cen                 ),
        .sresetn    ( axis_aresetn             ),
        .bypass     ( bypass                   ),
        
        .din        ( pipe_in_data[29:16]      ),
        .gain       ( s_axis_gain_tdata[31:16] ),
        .ofst       ( s_axis_ofst_tdata[31:16] ),
        
        .dout_good  ( dout_odd_good            ),
        .dout       ( dout_odd                 )
    );
    
    
    assign  pipe_out_data = {
                                dout_odd_good,  1'b0, dout_odd,
                                dout_even_good, 1'b0, dout_even
                            };
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
