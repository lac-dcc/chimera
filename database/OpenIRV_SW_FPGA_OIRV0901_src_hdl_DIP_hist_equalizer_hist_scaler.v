/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: hist_scaler.v
 *  Purpose:  Histogram scaling module. Transforms 14-bit data to 8-bit.
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


module hist_scaler
(
    input   wire            clk,
    input   wire            srst,
    
    input   wire    [17:0]  div,
    input   wire    [17:0]  add,
    
    input   wire    [13:0]  din,
    input   wire            din_valid,
    output  wire            din_rdy,
    
    output  wire    [7:0]   dout,
    output  wire            dout_valid
);
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    wire    [47:0]  dsp_P_tdata;
    wire            dsp_P_tvalid;
    wire            dsp_P_tready;
    
    wire    [17:0]  dsp_D_tdata = {4'h0, din};
    wire    [17:0]  dsp_A_tdata = (add > dsp_D_tdata)? dsp_D_tdata : add;
    

    axis_dsp_linear_func axis_dsp_linear_func_inst
    (
        .axis_aclk              ( clk          ),
        .axis_aresetn           ( ~srst        ),
        .dsp_func_sel           ( 1'b0         ),   // P = (D-A)*B+C

        .dsp_D_s_axis_tdata     ( dsp_D_tdata  ),
        .dsp_D_s_axis_tvalid    ( din_valid    ),
        .dsp_D_s_axis_tready    ( din_rdy      ),
        .dsp_D_s_axis_tlast     ( 1'b0         ),
        
        .dsp_A_s_axis_tdata     ( dsp_A_tdata  ),
        .dsp_A_s_axis_tvalid    ( 1'b1         ),
        .dsp_A_s_axis_tready    ( /*---NC---*/ ),
        .dsp_A_s_axis_tlast     ( 1'b0         ),
        
        .dsp_B_s_axis_tdata     ( 18'd255      ),
        .dsp_B_s_axis_tvalid    ( 1'b1         ),
        .dsp_B_s_axis_tready    ( /*---NC---*/ ),
        .dsp_B_s_axis_tlast     ( 1'b0         ),
        
        .dsp_C_s_axis_tdata     ( 48'd0        ),
        .dsp_C_s_axis_tvalid    ( 1'b1         ),
        .dsp_C_s_axis_tready    ( /*---NC---*/ ),
        .dsp_C_s_axis_tlast     ( 1'b0         ),
        
        .dsp_P_m_axis_tdata     ( dsp_P_tdata  ),
        .dsp_P_m_axis_tvalid    ( dsp_P_tvalid ),
        .dsp_P_m_axis_tready    ( dsp_P_tready ),
        .dsp_P_m_axis_tlast     ( /*---NC---*/ )
    );
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    wire    [23:0]  divider_output;
    
    AXIS_HIST_SCALE_DIVIDER AXIS_HIST_SCALE_DIVIDER_inst
    (
        .aclk                   ( clk                        ),     // input wire aclk
        .aresetn                ( ~srst                      ),     // input wire aresetn
        
        .s_axis_divisor_tvalid  ( 1'b1                       ),     // input wire s_axis_divisor_tvalid
        .s_axis_divisor_tready  ( /*----------NC----------*/ ),     // output wire s_axis_divisor_tready
        .s_axis_divisor_tdata   ( {2'b00, div[13:0]}         ),     // input wire [15 : 0] s_axis_divisor_tdata
        
        .s_axis_dividend_tvalid ( dsp_P_tvalid               ),     // input wire s_axis_dividend_tvalid
        .s_axis_dividend_tready ( dsp_P_tready               ),     // output wire s_axis_dividend_tready
        .s_axis_dividend_tdata  ( {2'b00, dsp_P_tdata[21:0]} ),     // input wire [23 : 0] s_axis_dividend_tdata
        
        .m_axis_dout_tvalid     ( dout_valid                 ),     // output wire m_axis_dout_tvalid
        .m_axis_dout_tdata      ( divider_output             )      // output wire [23 : 0] m_axis_dout_tdata
    );
    
    assign dout = (divider_output > 24'd255)? 8'd255 : divider_output[7:0];
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
