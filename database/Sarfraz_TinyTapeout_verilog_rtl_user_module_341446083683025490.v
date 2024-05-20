// This program was cloned from: https://github.com/sarfrazenator/Sarfraz_TinyTapeout
// License: Apache License 2.0

`default_nettype none

//  Top level io for this module should stay the same to fit into the scan_wrapper.
//  The pin connections within the user_module are up to you,
//  although (if one is present) it is recommended to place a clock on io_in[0].
//  This allows use of the internal clock divider if you wish.
module user_module_341446083683025490
    (
    input  wire [7:0] io_in, 
    output wire [7:0] io_out
    );

    top_341446083683025490 dice_roller_i (
        .i_clk  (io_in[0]),
        .i_rst  (io_in[1]),

        .i_roll (io_in[2]),
        
        .i_load (io_in[3]),
        .i_seed (io_in[6:4]),

        .o_led  (io_out[7:0])
    );

endmodule

//  Any submodules should be included in this file,
//  so they are copied into the main TinyTapeout repo.
//  Appending your ID to any submodules you create 
//  ensures there are no clashes in full-chip simulation.

module top_341446083683025490
    (
    input  wire       i_clk,
    input  wire       i_rst,
      
    input  wire       i_roll,
       
    input  wire       i_load,
    input  wire [2:0] i_seed,

    output reg  [7:0] o_led
    );

    wire       lfsr_en;
    wire [2:0] int_lfsr_val;

    wire [7:0] int_disp_val;

    assign lfsr_en = (i_roll) || (int_lfsr_val == 7) || (int_lfsr_val == 0);
    always@(posedge i_clk) begin 
        if(i_rst) begin 
            o_led   <= 0;
        end 
        else begin
            if((int_lfsr_val != 7) && (int_lfsr_val != 0)) begin 
                o_led <= int_disp_val;
            end 
        end
    end 

    lfsr_341446083683025490 lfsr_i (
        .i_clk  (i_clk),
        .i_rst  (i_rst),
        .i_en   (lfsr_en),
        //
        .i_load (i_load),
        .i_seed (i_seed),
        //
        .o_lfsr (int_lfsr_val)
    );

    disp_341446083683025490 disp_i (
        .i_val (int_lfsr_val),
        .o_led (int_disp_val)
    );

endmodule

module lfsr_341446083683025490
    (
    input  wire       i_clk,
    input  wire       i_rst,
    input  wire       i_en,

    input  wire       i_load,
    input  wire [2:0] i_seed,
    
    output reg  [2:0] o_lfsr
    );

    always@(posedge i_clk) begin 
        if(i_rst) begin 
            o_lfsr <= 0;
        end 
        else if(i_en) begin 
            if(i_load) begin 
                o_lfsr <= i_seed;
            end 
            else begin 
                o_lfsr[0] <= o_lfsr[1] ^ o_lfsr[2];
                o_lfsr[1] <= o_lfsr[0];
                o_lfsr[2] <= o_lfsr[1];
            end 
        end 
    end 

endmodule


module disp_341446083683025490 
    (
    input  wire [2:0] i_val,
    output reg  [7:0] o_led
    );

    always@* begin 
        case(i_val) 
            1: o_led = 8'b0110000;
            2: o_led = 8'b1101101;
            3: o_led = 8'b1111001;
            4: o_led = 8'b0110011;
            5: o_led = 8'b1011011;
            6: o_led = 8'b1011111;
            default: o_led = 0;
        endcase
    end 

endmodule 