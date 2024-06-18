// This program was cloned from: https://github.com/OVGN/OpenIRV
// License: Apache License 2.0

/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: axis_bpr_3x3_interpol.v
 *  Purpose:  AXI4-Stream wrapper for bpr_3x3_interpol module.
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


module axis_bpr_3x3_interpol
(
    input   wire            axis_aclk,
    input   wire            axis_aresetn,
    input   wire            bypass,
    
    input   wire    [143:0] s_axis_tdata,
    input   wire            s_axis_tvalid,
    output  wire            s_axis_tready,
    input   wire            s_axis_tlast,
    input   wire            s_axis_tuser,
    
    output  wire    [15:0]  m_axis_tdata,
    output  wire            m_axis_tvalid,
    input   wire            m_axis_tready,
    output  wire            m_axis_tlast,
    output  wire            m_axis_tuser
);
    
    localparam  PIPE_DATA_IN_WIDTH  = 144;
    localparam  PIPE_DATA_OUT_WIDTH = 16;
    localparam  PIPE_QUAL_WIDTH = 1;
    localparam  PIPE_STAGES     = 5;

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
        .s_axis_tlast   ( s_axis_tlast  ),
        
        .m_axis_tdata   ( m_axis_tdata  ),
        .m_axis_tuser   ( m_axis_tuser  ),
        .m_axis_tvalid  ( m_axis_tvalid ),
        .m_axis_tready  ( m_axis_tready ),
        .m_axis_tlast   ( m_axis_tlast  ),
        
        .pipe_cen       ( pipe_cen      ),
        .pipe_in_data   ( pipe_in_data  ),
        .pipe_out_data  ( pipe_out_data )
    );
    
    
    wire    [15:0]  pix_top_left  = pipe_in_data[16*6  +: 16];
    wire    [15:0]  pix_top_mid   = pipe_in_data[16*7  +: 16];
    wire    [15:0]  pix_top_right = pipe_in_data[16*8  +: 16];
    
    wire    [15:0]  pix_mid_left  = pipe_in_data[16*3  +: 16];
    wire    [15:0]  pix_mid       = pipe_in_data[16*4  +: 16];
    wire    [15:0]  pix_mid_right = pipe_in_data[16*5  +: 16];
    
    wire    [15:0]  pix_bot_left  = pipe_in_data[16*0  +: 16];
    wire    [15:0]  pix_bot_mid   = pipe_in_data[16*1  +: 16];
    wire    [15:0]  pix_bot_right = pipe_in_data[16*2  +: 16];
    
    wire    [15:0]  pix_out;
    
    assign  pipe_out_data = pix_out;
    
    
    bpr_3x3_interpol bpr_3x3_interpol_inst
    (
        .clk            ( axis_aclk     ), 
        .srst           ( ~axis_aresetn ), 
        .cen            ( pipe_cen      ), 
        .bypass         ( bypass        ),
        
        .pix_mid        ( pix_mid       ), 
        
        .pix_top_left   ( {pix_top_left[15],  pix_top_left[13:0]}   ), 
        .pix_top_mid    ( {pix_top_mid[15],   pix_top_mid[13:0]}    ), 
        .pix_top_right  ( {pix_top_right[15], pix_top_right[13:0]}  ),
        
        .pix_mid_left   ( {pix_mid_left[15],  pix_mid_left[13:0]}   ), 
        .pix_mid_right  ( {pix_mid_right[15], pix_mid_right[13:0]}  ), 
        
        .pix_bot_left   ( {pix_bot_left[15],  pix_bot_left[13:0]}   ), 
        .pix_bot_mid    ( {pix_bot_mid[15],   pix_bot_mid[13:0]}    ), 
        .pix_bot_right  ( {pix_bot_right[15], pix_bot_right[13:0]}  ), 
        
        .pix_out        ( pix_out )
    );
    
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
