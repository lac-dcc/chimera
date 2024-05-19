// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>dct1d_chen_reorder_out
 * @file dct1d_chen_reorder_out.v
 * @date 2016-06-08  
 * @author  Andrey Filippov
 *     
 * @brief Reorder data from dct1d_chen output to natural sequence
 *
 * @copyright Copyright (c) 2016 Elphel, Inc.
 *
 * <b>License:</b>
 *
 *dct1d_chen_reorder_out.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  dct1d_chen_reorder_out.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify this Program, or any covered work, by linking or combining it
 * with independent modules provided by the FPGA vendor only (this permission
 * does not extend to any 3-rd party modules, "soft cores" or macros) under
 * different license terms solely for the purpose of generating binary "bitstream"
 * files and/or simulating the code, the copyright holders of this Program give
 * you the right to distribute the covered work without those independent modules
 * as long as the source code for them is available from the FPGA vendor free of
 * charge, and there is no dependence on any encrypted modules for simulating of
 * the combined code. This permission applies to you if the distributed code
 * contains all the components and scripts required to completely simulate it
 * with at least one of the Free Software programs.
 */
`timescale 1ns/1ps

module  dct1d_chen_reorder_out#(
    parameter WIDTH = 24
 )(
    input                  clk,
    input                  rst,
    input                  en,        // sampled at timeslot of pre2_start
    input  [WIDTH -1:0]    din,       // pre2_start-X-F4-X-F2-X-F6-F5-F0-F3-X-F1-X-F7
    input                  pre2_start,     // Two cycles ahead of F4 
    output   [WIDTH -1:0]  dout,      // data in natural order: F0-F1-F2-F3-F4-F5-F6-F7
    output                 start_out, // 1 ahead of the first F0
    output reg             dv,        // output data valid
    output                 en_out     // to be sampled when start_out is expected
);
    reg [WIDTH -1:0] reord_buf_ram[0:15];
    reg [WIDTH -1:0] dout_r;
    reg  [3:0] cntr_in;
    reg        pre_we_r;
    reg        we_r;
    reg  [3:0] ina_rom;
    wire [3:0] waddr = {ina_rom[3] ^ cntr_in[3], ina_rom[2:0]};   
    reg  [3:0] raddr;
    reg  [2:0] per_type; // idle/last:0, first cycle - 1, 2-nd - 2, other - 3,... ~en->6 ->7 -> 0  (to generate pre2_start_out)
    reg        start_out_r;
    reg        en_out_r;
    wire       stop_out; // qualify with en
    assign dout = dout_r;
    assign start_out = start_out_r; 
    assign en_out = en_out_r;
    
    always @(posedge clk) begin
        if      (rst)           per_type <= 0;
        else if (pre2_start)    per_type <= 3'h1;
        else if (&cntr_in[2:0]) begin
            if      (!per_type[2] && !en)                per_type <= 3'h6;
            else if ((per_type != 0) && (per_type != 3)) per_type <= per_type + 1;  
        end
    
        if      (rst)                                                   pre_we_r <= 0;
        else if (pre2_start)                                            pre_we_r <= 1;
///     else if ((per_type == 0) || ((cntr_in==3) && per_type[2]))      pre_we_r <= 0;
        else if ((per_type == 0) || ((cntr_in[2:0]==3) && per_type[2])) pre_we_r <= 0;
        we_r <= pre_we_r;
        
        if      (rst)        cntr_in <= 0;
        else if (pre2_start) cntr_in <= {~cntr_in[3],3'b0};
        else if (pre_we_r)   cntr_in <= cntr_in + 1;
        case (cntr_in[2:0])
            3'h0: ina_rom <= {1'b0,3'h4};
            3'h1: ina_rom <= {1'b1,3'h1};
            3'h2: ina_rom <= {1'b0,3'h2};
            3'h3: ina_rom <= {1'b1,3'h7};
            3'h4: ina_rom <= {1'b0,3'h6};
            3'h5: ina_rom <= {1'b0,3'h5};
            3'h6: ina_rom <= {1'b0,3'h0};
            3'h7: ina_rom <= {1'b1,3'h3};
        endcase
        
        if (we_r) reord_buf_ram[waddr] <= din;

///        if      ((per_type == 2) && (cntr_in == 1))   raddr <= {~cntr_in[3], 3'b0};
        if      ((per_type == 2) && (cntr_in[2:0] == 1))   raddr <= {~cntr_in[3], 3'b0};
        else if ((raddr[2:0] != 0) || (per_type !=0)) raddr <= raddr + 1;
        
        if (en_out_r) dout_r <=  reord_buf_ram[raddr];
        
///        start_out_r <=  (per_type == 2) && (cntr_in == 1);
        start_out_r <=  (per_type == 2) && (cntr_in[2:0] == 1);
        
        if (rst ||(per_type == 0) )                 en_out_r <= 0;
//        else if (cntr_in == 1)      en_out_r <= (per_type == 2) || !per_type[2];
///     else if ((cntr_in == 1) && (per_type == 2)) en_out_r <= 1;
        else if ((cntr_in[2:0] == 1) && (per_type == 2)) en_out_r <= 1;
        else if (stop_out && !en)                   en_out_r <= 0;
        //stop_out
        
        dv <= en_out_r;
        
//        if      (rst)                            dv <= 0;
//        else if (start_out_r)                    dv <= 1;
//        else if ((raddr[2:0] == 0) && !en_out_r) dv <= 0;
    end

    dly01_16 dly01_16_i (
        .clk      (clk),                    // input
        .rst      (rst),                    // input
        .dly      (4'd8),                   // input[3:0] 
        .din      ((&cntr_in[2:0]) && !en), // input
        .dout     (stop_out)                // output
    );

endmodule

