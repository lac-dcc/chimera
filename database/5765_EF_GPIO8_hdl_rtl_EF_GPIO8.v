// This program was cloned from: https://github.com/efabless/EF_GPIO8
// License: Apache License 2.0

/*
	Copyright 2023 Efabless Corp.

	Author: Mohamed Shalan (mshalan@aucegypt.edu)

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

	    http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.

*/

module EF_GPIO8 (
    input  wire         clk,
    input  wire         rst_n,
    input  wire [7:0]   io_in,
    output wire [7:0]   bus_in,
    output wire [7:0]   io_out,
    input  wire [7:0]   bus_out,
    output wire [7:0]   io_oe,
    input  wire [7:0]   bus_oe,

    output wire pin0_hi,
    output wire pin1_hi,
    output wire pin2_hi,
    output wire pin3_hi,
    output wire pin4_hi,
    output wire pin5_hi,
    output wire pin6_hi,
    output wire pin7_hi,
    
    output wire pin0_lo,
    output wire pin1_lo,
    output wire pin2_lo,
    output wire pin3_lo,
    output wire pin4_lo,
    output wire pin5_lo,
    output wire pin6_lo,
    output wire pin7_lo,

    output wire pin0_pe,
    output wire pin1_pe,
    output wire pin2_pe,
    output wire pin3_pe,
    output wire pin4_pe,
    output wire pin5_pe,
    output wire pin6_pe,
    output wire pin7_pe,

    output wire pin0_ne,
    output wire pin1_ne,
    output wire pin2_ne,
    output wire pin3_ne,
    output wire pin4_ne,
    output wire pin5_ne,
    output wire pin6_ne,
    output wire pin7_ne
    
);
    wire [7:0] sync_io_in;

    aucohl_sync synchronizer[7:0] (.clk(clk), .in(io_in), .out(sync_io_in));
    
    assign bus_in = sync_io_in;
    assign io_out = bus_out;
    assign io_oe  = bus_oe;

    assign pin0_hi = (sync_io_in[0] == 1'b1);
    assign pin1_hi = (sync_io_in[1] == 1'b1);
    assign pin2_hi = (sync_io_in[2] == 1'b1);
    assign pin3_hi = (sync_io_in[3] == 1'b1);
    assign pin4_hi = (sync_io_in[4] == 1'b1);
    assign pin5_hi = (sync_io_in[5] == 1'b1);
    assign pin6_hi = (sync_io_in[6] == 1'b1);
    assign pin7_hi = (sync_io_in[7] == 1'b1);
    
    assign pin0_lo = (sync_io_in[0] == 1'b0);
    assign pin1_lo = (sync_io_in[1] == 1'b0);
    assign pin2_lo = (sync_io_in[2] == 1'b0);
    assign pin3_lo = (sync_io_in[3] == 1'b0);
    assign pin4_lo = (sync_io_in[4] == 1'b0);
    assign pin5_lo = (sync_io_in[5] == 1'b0);
    assign pin6_lo = (sync_io_in[6] == 1'b0);
    assign pin7_lo = (sync_io_in[7] == 1'b0);

    aucohl_ped ped_0 (.clk(clk), .in(sync_io_in[0]), .out(pin0_pe));
    aucohl_ped ped_1 (.clk(clk), .in(sync_io_in[1]), .out(pin1_pe));
    aucohl_ped ped_2 (.clk(clk), .in(sync_io_in[2]), .out(pin2_pe));
    aucohl_ped ped_3 (.clk(clk), .in(sync_io_in[3]), .out(pin3_pe));
    aucohl_ped ped_4 (.clk(clk), .in(sync_io_in[4]), .out(pin4_pe));
    aucohl_ped ped_5 (.clk(clk), .in(sync_io_in[5]), .out(pin5_pe));
    aucohl_ped ped_6 (.clk(clk), .in(sync_io_in[6]), .out(pin6_pe));
    aucohl_ped ped_7 (.clk(clk), .in(sync_io_in[7]), .out(pin7_pe));

    aucohl_ned ned_0 (.clk(clk), .in(sync_io_in[0]), .out(pin0_ne));
    aucohl_ned ned_1 (.clk(clk), .in(sync_io_in[1]), .out(pin1_ne));
    aucohl_ned ned_2 (.clk(clk), .in(sync_io_in[2]), .out(pin2_ne));
    aucohl_ned ned_3 (.clk(clk), .in(sync_io_in[3]), .out(pin3_ne));
    aucohl_ned ned_4 (.clk(clk), .in(sync_io_in[4]), .out(pin4_ne));
    aucohl_ned ned_5 (.clk(clk), .in(sync_io_in[5]), .out(pin5_ne));
    aucohl_ned ned_6 (.clk(clk), .in(sync_io_in[6]), .out(pin6_ne));
    aucohl_ned ned_7 (.clk(clk), .in(sync_io_in[7]), .out(pin7_ne));

    

endmodule
