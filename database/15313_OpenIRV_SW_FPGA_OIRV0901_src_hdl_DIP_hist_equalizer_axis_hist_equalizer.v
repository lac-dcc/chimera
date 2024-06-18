// This program was cloned from: https://github.com/OVGN/OpenIRV
// License: Apache License 2.0

/* 
 * ----------------------------------------------------------------------------
 *  Project:  OpenIRV
 *  Filename: axis_hist_equalizer.v
 *  Purpose:  Histogram equalization AXI4-Stream top module.
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


module axis_hist_equalizer
(
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_RSTIF, POLARITY ACTIVE_LOW" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S_RSTIF RST" *)
    input   wire    s_axis_aresetn,

    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_CLKIF, ASSOCIATED_BUSIF S_AXIS, ASSOCIATED_RESET s_axis_aresetn" *)
    (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S_CLKIF CLK" *)
    input   wire    s_axis_aclk,
    
    (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 1" *)
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA"  *)  input   wire    [15:0]  s_axis_tdata,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *)  input   wire            s_axis_tvalid,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *)  output  wire            s_axis_tready,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TLAST"  *)  input   wire            s_axis_tlast,
    (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TUSER"  *)  input   wire            s_axis_tuser,
    
    output  wire            hist_lut_ram_we,
    output  wire    [13:0]  hist_lut_ram_addr,
    output  wire    [7:0]   hist_lut_ram_din
);
    
/*-------------------------------------------------------------------------------------------------------------------------------------*/
    
    wire            raw_hist_wea;
    wire    [13:0]  raw_hist_addra;
    wire    [17:0]  raw_hist_dina;
    wire    [17:0]  raw_hist_douta;

    wire            raw_hist_web;
    wire    [13:0]  raw_hist_addrb;
    wire    [17:0]  raw_hist_dinb;
    wire    [17:0]  raw_hist_doutb;
    
    wire            raw_hist_upd;
    wire            raw_hist_rdy;
    
    
    hist_calc hist_calc_inst
    (
        .clk            ( s_axis_aclk     ), 
        .srst           ( ~s_axis_aresetn ), 
        
        .hist_upd       ( raw_hist_upd    ), 
        .hist_rdy       ( raw_hist_rdy    ), 
        
        .s_axis_tdata   ( s_axis_tdata    ),
        .s_axis_tvalid  ( s_axis_tvalid   ),
        .s_axis_tready  ( s_axis_tready   ),
        .s_axis_tlast   ( s_axis_tlast    ),
        .s_axis_tuser   ( s_axis_tuser    ),
        
        .ram_we         ( raw_hist_wea    ), 
        .ram_addr       ( raw_hist_addra  ), 
        .ram_din        ( raw_hist_dina   ), 
        .ram_dout       ( raw_hist_douta  )
    );
    
    
    RAW_HIST_RAM RAW_HIST_RAM_inst 
    (
        .clka   ( s_axis_aclk    ),     // input clka
        .ena    ( 1'b1           ),     // input wire ena
        .wea    ( raw_hist_wea   ),     // input [0 : 0] wea
        .addra  ( raw_hist_addra ),     // input [13 : 0] addra
        .dina   ( raw_hist_dina  ),     // input [17 : 0] dina
        .douta  ( raw_hist_douta ),     // output [17 : 0] douta
        
        .clkb   ( s_axis_aclk    ),     // input clkb
        .enb    ( 1'b1           ),     // input wire enb
        .web    ( raw_hist_web   ),     // input [0 : 0] web
        .addrb  ( raw_hist_addrb ),     // input [13 : 0] addrb
        .dinb   ( raw_hist_dinb  ),     // input [17 : 0] dinb
        .doutb  ( raw_hist_doutb )      // output [17 : 0] doutb
    );


    hist_rebuilder hist_rebuilder_inst
    (
        .clk                ( s_axis_aclk       ),
        .srst               ( ~s_axis_aresetn   ),
        
        .raw_hist_upd       ( raw_hist_upd      ),
        .raw_hist_rdy       ( raw_hist_rdy      ),
        .hist_equal_type    ( 1'b0              ),
        
        .raw_hist_ram_we    ( raw_hist_web      ), 
        .raw_hist_ram_addr  ( raw_hist_addrb    ), 
        .raw_hist_ram_din   ( raw_hist_dinb     ), 
        .raw_hist_ram_dout  ( raw_hist_doutb    ), 
        
        .hist_lut_ram_we    ( hist_lut_ram_we   ), 
        .hist_lut_ram_addr  ( hist_lut_ram_addr ), 
        .hist_lut_ram_din   ( hist_lut_ram_din  )
    );
    
endmodule

/*-------------------------------------------------------------------------------------------------------------------------------------*/

`default_nettype wire
