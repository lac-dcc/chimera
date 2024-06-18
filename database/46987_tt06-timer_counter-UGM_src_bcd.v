// This program was cloned from: https://github.com/Shofuuu/tt06-timer_counter-UGM
// License: Apache License 2.0

`default_nettype none
// `timescale 1ns/1ns

module bcd (
    input wire a, b, c, d, inv, en,
    output wire [7:0] digit
);    

    // segments wire 
    wire a_wire, b_wire, c_wire, d_wire,
         e_wire, f_wire, g_wire;

    wire [7:0] segment;

    // default : common anode segment
    /*    pgfedcba
	    0b11000000,	 // 0
	    0b11111001,	 // 1
	    0b10100100,	 // 2
	    0b10110000,	 // 3
	    0b10011001,	 // 4
	    0b10010010,	 // 5
	    0b10000010,	 // 6
	    0b11111000,	 // 7
	    0b10000000,	 // 8
	    0b10010000	 // 9 */
    
    // inverted
    /*    pgfedcba
	    0b00111111,	 // 0
    	0b00000110,	 // 1
	    0b01011011,	 // 2
    	0b01001111,	 // 3
    	0b01100110,	 // 4
    	0b01101101,	 // 5
    	0b01111101,	 // 6
    	0b00000111,	 // 7
    	0b01111111,	 // 8
	    0b01101111	 // 9 */

    assign a_wire = (~a & ~b & ~c & d) | (~a & b & ~c & ~d); // D0
    assign b_wire = (~a & b & ~c & d) | (~a & b & c & ~d); // D1
    assign c_wire = ~a & ~b & c & ~d; // D2
    assign d_wire = (~a & ~b & ~c & d) | (~a & b & ~c & ~d) | (~a & b & c & d); // D3
    assign e_wire = d | (b & ~c) | (a & c); // D4
    assign f_wire = (~a & ~b & d) | (~a & ~b & c) | (~a & c & d); // D5
    assign g_wire = (~a & ~b & ~c) | (~a & b & c & d); // D6

    assign segment = {1'b1, g_wire, f_wire, e_wire, d_wire, c_wire, b_wire, a_wire};

    assign digit = (en ? (inv ? segment : ~segment) : (inv ? {8{1'b1}} : {8{1'b0}}));

endmodule



