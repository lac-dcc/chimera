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

`timescale			    1ns/1ps
`default_nettype		none

/*
    Brute-force Synchronizer
*/
module aucohl_sync #(parameter NUM_STAGES = 2) (
    input clk,
    input in,
    output out
);

    reg [NUM_STAGES-1:0] sync;

    always @(posedge clk)
        sync <= {sync[NUM_STAGES-2:0], in};

    assign out = sync[NUM_STAGES-1];

endmodule

/*
    A positive edge detector
*/
module aucohl_ped (
    input clk,
    input in,
    output out
);
    reg last_in; always @(posedge clk) last_in <= in; assign out = in & ~last_in;
endmodule

/*
    A negative edge detector
*/
module aucohl_ned (
    input clk,
    input in,
    output out
);
    reg last_in; always @(posedge clk) last_in <= in; assign out = ~in & last_in;
endmodule

/*
    A tick generator
*/
module aucohl_ticker #(parameter W=8) (
    input   wire            clk, 
    input   wire            rst_n,
    input   wire            en,
    input   wire [W-1:0]    clk_div,
    output  wire            tick
);

    reg [W-1:0] counter;
    wire        counter_is_zero = (counter == 'b0);
    wire        tick_w;
    reg         tick_reg;

    always @(posedge clk, negedge rst_n)
        if(~rst_n)
            counter <=  'b0;
        else if(en) 
            if(counter_is_zero)
                counter <=  clk_div;
            else
                counter <=  counter - 'b1; 

    assign tick_w = (clk_div == 'b1)  ?   1'b1 : counter_is_zero;

    always @(posedge clk or negedge rst_n)
        if(!rst_n)
            tick_reg <= 1'b0;
        else if(en)
            tick_reg <= tick_w;
        else
            tick_reg <= 0;

    assign tick = tick_reg;

endmodule

/*
    A glitch filter
*/
module aucohl_glitch_filter #(parameter N = 8, CLKDIV = 1) (
    input   wire    clk,
    input   wire    rst_n,
    input   wire    in,
    output  reg     out
);

    reg [N-1:0] shifter;
    wire        tick;

    aucohl_ticker ticker (
        .clk(clk),
        .rst_n(rst_n),
        .clk_div(CLKDIV),
        .tick(tick)
    );

    always @(posedge clk, negedge rst_n)
        if(!rst_n)
            shifter = 'b0;
        else if(tick)
            shifter <= {shifter[N-2:0], in};

    wire all_ones   = & shifter;
    wire all_zeros  = ~| shifter;

    always @(posedge clk, negedge rst_n)
        if(!rst_n)
            out <= 1'b0;
        else
            if(all_ones) 
                out <= 1'b1;
            else if(all_zeros) 
                out <= 1'b0;
endmodule

/*
    A FIFO
*/
module aucohl_fifo #(parameter DW=8, AW=4)(
    input     wire            clk,
    input     wire            rst_n,
    input     wire            rd,
    input     wire            wr,
    input     wire [DW-1:0]   wdata,
    output    wire            empty,
    output    wire            full,
    output    wire [DW-1:0]   rdata,
    output    wire [AW-1:0]   level    
);

    localparam  DEPTH = 2**AW;

    //Internal Signal declarations
    reg [DW-1:0]  array_reg [DEPTH-1:0];
    reg [AW-1:0]  w_ptr_reg;
    reg [AW-1:0]  w_ptr_next;
    reg [AW-1:0]  w_ptr_succ;
    reg [AW-1:0]  r_ptr_reg;
    reg [AW-1:0]  r_ptr_next;
    reg [AW-1:0]  r_ptr_succ;

    // Level
    reg [AW-1:0] level_reg;
    reg [AW-1:0] level_next;      
    reg full_reg;
    reg empty_reg;
    reg full_next;
    reg empty_next;

    wire w_en;

    always @ (posedge clk)
        if(w_en) begin
            array_reg[w_ptr_reg] <= wdata;
        end

    assign rdata = array_reg[r_ptr_reg];   
    assign w_en = wr & ~full_reg;           

    //State Machine
    always @ (posedge clk, negedge rst_n) begin 
    if(!rst_n)
        begin
            w_ptr_reg <= 'b0;
            r_ptr_reg <= 'b0;
            full_reg  <= 1'b0;
            empty_reg <= 1'b1;
            level_reg <= 4'd0;
        end
    else
        begin
            w_ptr_reg <= w_ptr_next;
            r_ptr_reg <= r_ptr_next;
            full_reg  <= full_next;
            empty_reg <= empty_next;
            level_reg <= level_next;
        end
    end

    //Next State Logic
    always @* begin
        w_ptr_succ = w_ptr_reg + 1;
        r_ptr_succ = r_ptr_reg + 1;

        w_ptr_next = w_ptr_reg;
        r_ptr_next = r_ptr_reg;
        full_next = full_reg;
        empty_next = empty_reg;
        level_next = level_reg;

        case({w_en,rd})
            //2'b00: nop
            2'b01: 
                if(~empty_reg) begin
                    r_ptr_next = r_ptr_succ;
                    full_next = 1'b0;
                    level_next = level_reg - 1;
                    if (r_ptr_succ == w_ptr_reg)
                        empty_next = 1'b1;
                end
            
            2'b10: 
                if(~full_reg) begin
                    w_ptr_next = w_ptr_succ;
                    empty_next = 1'b0;
                    level_next = level_reg + 1;
                    if (w_ptr_succ == r_ptr_reg)
                        full_next = 1'b1;
                end
            
            2'b11: begin
                w_ptr_next = w_ptr_succ;
                r_ptr_next = r_ptr_succ;
            end
        endcase
    end

    //Set Full and Empty
    assign full = full_reg;
    assign empty = empty_reg;
    assign level = level_reg;
  
endmodule


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
