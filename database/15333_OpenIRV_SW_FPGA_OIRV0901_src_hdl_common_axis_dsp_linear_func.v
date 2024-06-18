// This program was cloned from: https://github.com/OVGN/OpenIRV
// License: Apache License 2.0

/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: axis_dsp_linear_func.v
 *  Purpose:  AXI4-Stream wrapper for a DSP linear function module.
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


module axis_dsp_linear_func #
(
    parameter TUSER_WIDTH = 1
)
(
    input   wire                        axis_aresetn,
    input   wire                        axis_aclk,
    
    input   wire                        dsp_func_sel,

    input   wire    [17:0]              dsp_D_s_axis_tdata,
    input   wire                        dsp_D_s_axis_tvalid,
    output  wire                        dsp_D_s_axis_tready,
    input   wire                        dsp_D_s_axis_tlast,
    input   wire    [TUSER_WIDTH - 1:0] dsp_D_s_axis_tuser,
    
    input   wire    [17:0]              dsp_A_s_axis_tdata,
    input   wire                        dsp_A_s_axis_tvalid,
    output  wire                        dsp_A_s_axis_tready,
    input   wire                        dsp_A_s_axis_tlast,
    input   wire    [TUSER_WIDTH - 1:0] dsp_A_s_axis_tuser,
    
    input   wire    [17:0]              dsp_B_s_axis_tdata,
    input   wire                        dsp_B_s_axis_tvalid,
    output  wire                        dsp_B_s_axis_tready,
    input   wire                        dsp_B_s_axis_tlast,
    input   wire    [TUSER_WIDTH - 1:0] dsp_B_s_axis_tuser,
    
    input   wire    [47:0]              dsp_C_s_axis_tdata,
    input   wire                        dsp_C_s_axis_tvalid,
    output  wire                        dsp_C_s_axis_tready,
    input   wire                        dsp_C_s_axis_tlast,
    input   wire    [TUSER_WIDTH - 1:0] dsp_C_s_axis_tuser,
    
    output  wire    [47:0]              dsp_P_m_axis_tdata,
    output  wire                        dsp_P_m_axis_tvalid,
    input   wire                        dsp_P_m_axis_tready,
    output  wire                        dsp_P_m_axis_tlast,
    output  wire    [TUSER_WIDTH - 1:0] dsp_P_m_axis_tuser
);
    
    localparam  PIPE_DATA_IN_WIDTH  = 1;
    localparam  PIPE_DATA_OUT_WIDTH = 1;
    localparam  PIPE_QUAL_WIDTH     = 1;
    localparam  PIPE_STAGES         = 4;    // DSP_LINEAR_FUNC pipeline delay
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/

    wire    pipe_cen;
    
    wire                        s_axis_tready;
    wire                        s_axis_tvalid = dsp_D_s_axis_tvalid & dsp_A_s_axis_tvalid & dsp_B_s_axis_tvalid & dsp_C_s_axis_tvalid;
    wire                        s_axis_tlast  = dsp_D_s_axis_tlast  & dsp_A_s_axis_tlast  & dsp_B_s_axis_tlast  & dsp_C_s_axis_tlast;
    wire    [TUSER_WIDTH - 1:0] s_axis_tuser  = dsp_D_s_axis_tuser  | dsp_A_s_axis_tuser  | dsp_B_s_axis_tuser  | dsp_C_s_axis_tuser;
    
    wire                        m_axis_tready = dsp_P_m_axis_tready;
    wire                        m_axis_tvalid;
    wire                        m_axis_tlast;
    wire    [TUSER_WIDTH - 1:0] m_axis_tuser;
    
    
    axis_pipeliner #
    (
        .PIPE_DATA_IN_WIDTH ( PIPE_DATA_IN_WIDTH  ),
        .PIPE_DATA_OUT_WIDTH( PIPE_DATA_OUT_WIDTH ),
        .PIPE_QUAL_WIDTH    ( TUSER_WIDTH         ),
        .PIPE_STAGES        ( PIPE_STAGES         )
    )
    axis_pipeliner
    (
        .axis_aclk      ( axis_aclk     ),
        .axis_aresetn   ( axis_aresetn  ),
        
        .s_axis_tdata   ( 1'b0          ),
        .s_axis_tuser   ( s_axis_tuser  ),
        .s_axis_tvalid  ( s_axis_tvalid ),
        .s_axis_tready  ( s_axis_tready ),
        .s_axis_tlast   ( s_axis_tlast  ),
        
        .m_axis_tdata   (),
        .m_axis_tuser   ( m_axis_tuser  ),
        .m_axis_tvalid  ( m_axis_tvalid ),
        .m_axis_tready  ( m_axis_tready ),
        .m_axis_tlast   ( m_axis_tlast  ),
        
        .pipe_cen       ( pipe_cen      ),
        .pipe_in_data   (),
        .pipe_out_data  ( 1'b0          )
    );
    
    assign dsp_P_m_axis_tvalid = m_axis_tvalid;
    assign dsp_P_m_axis_tlast  = m_axis_tlast;
    assign dsp_P_m_axis_tuser  = m_axis_tuser;
    
    assign dsp_D_s_axis_tready = s_axis_tready;
    assign dsp_A_s_axis_tready = s_axis_tready;
    assign dsp_B_s_axis_tready = s_axis_tready;
    assign dsp_C_s_axis_tready = s_axis_tready;
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    /* dsp_func_sel = 0  ->  P = (D-A)*B+C
     * dsp_func_sel = 1  ->  P = (D+A)*B+C */
    DSP_LINEAR_FUNC dsp
    (
        .CLK    ( axis_aclk          ),     // input CLK
        .CE     ( pipe_cen           ),     // input CE
        .SCLR   ( ~axis_aresetn      ),     // input SCLR
        .SEL    ( dsp_func_sel       ),     // input  [0 : 0] SEL
        .A      ( dsp_A_s_axis_tdata ),     // input  [17 : 0] A
        .B      ( dsp_B_s_axis_tdata ),     // input  [17 : 0] B
        .C      ( dsp_C_s_axis_tdata ),     // input  [47 : 0] C
        .D      ( dsp_D_s_axis_tdata ),     // input  [17 : 0] D
        .P      ( dsp_P_m_axis_tdata )      // output [47 : 0] P
    );
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
