// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License

`include "config.vh"

module seven_segment
# (
    parameter w              = 32,
              bits_per_digit = 4,
              n_digits       = w / bits_per_digit
)
(
    input                   clk,
    input                   rst_n,
    input                   en,
    input  [w        - 1:0] num,
    input  [n_digits - 1:0] dots,
    output [6:0]            abcdefg,
    output                  dot,
    output [n_digits - 1:0] anodes
);

    function [6:0] dig_to_seg (input [3:0] dig);

        case (dig)
        'h0: dig_to_seg = 'b0000001;  // a b c d e f g
        'h1: dig_to_seg = 'b1001111;
        'h2: dig_to_seg = 'b0010010;  //   --a--
        'h3: dig_to_seg = 'b0000110;  //  |     |
        'h4: dig_to_seg = 'b1001100;  //  f     b
        'h5: dig_to_seg = 'b0100100;  //  |     |
        'h6: dig_to_seg = 'b0100000;  //   --g--
        'h7: dig_to_seg = 'b0001111;  //  |     |
        'h8: dig_to_seg = 'b0000000;  //  e     c
        'h9: dig_to_seg = 'b0001100;  //  |     |
        'ha: dig_to_seg = 'b0001000;  //   --d-- 
        'hb: dig_to_seg = 'b1100000;
        'hc: dig_to_seg = 'b0110001;
        'hd: dig_to_seg = 'b1000010;
        'he: dig_to_seg = 'b0110000;
        'hf: dig_to_seg = 'b0111000;
        endcase

    endfunction

    //------------------------------------------------------------------------

    reg [n_digits - 1:0] anodes_d, anodes_q;

    always @*
        anodes_d <= { anodes_q [0], anodes_q [n_digits - 1 : 1] };

    always @ (posedge clk or negedge rst_n)
        if (! rst_n)
            anodes_q <= { { n_digits - 1 { 1'b1 } }, 1'b0 };
        else if (en)
            anodes_q <= anodes_d;
    
    assign anodes = anodes_q;
    
    //------------------------------------------------------------------------

    wire [bits_per_digit - 1:0] dig;

    selector # (.w (bits_per_digit), .n (n_digits)) i_sel_dig
        (.d (num), .sel (~ anodes_d), .y (dig));

    register_no_rst # (7) i_abcdefg
    (
        .clk ( clk              ),
        .en  ( en               ),
        .d   ( dig_to_seg (dig) ),
        .q   ( abcdefg          )
    ); 

    //------------------------------------------------------------------------

    wire dot_d;

    selector # (.w (1), .n (n_digits)) i_sel_dot
        (.d (dots), .sel (~ anodes_d), .y (dot_d));

    register_no_rst i_dot
    (
        .clk (   clk   ),
        .en  (   en    ),
        .d   ( ~ dot_d ),
        .q   (   dot   )
    ); 

endmodule
