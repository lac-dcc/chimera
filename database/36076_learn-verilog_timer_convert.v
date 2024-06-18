// This program was cloned from: https://github.com/michaelliao/learn-verilog
// License: GNU General Public License v3.0

// convert 0 ~ f to NUM_0 ~ NUM_F:

module convert (
    input [3:0] in,
    output reg [7:0] out
);
    localparam NUM_0 = 8'b00000011;
    localparam NUM_1 = 8'b10011111;
    localparam NUM_2 = 8'b00100101;
    localparam NUM_3 = 8'b00001101;
    localparam NUM_4 = 8'b10011001;
    localparam NUM_5 = 8'b01001001;
    localparam NUM_6 = 8'b01000001;
    localparam NUM_7 = 8'b00011111;
    localparam NUM_8 = 8'b00000001;
    localparam NUM_9 = 8'b00001001;
    localparam NUM_A = 8'b00010001;
    localparam NUM_B = 8'b11000001;
    localparam NUM_C = 8'b01100011;
    localparam NUM_D = 8'b10000101;
    localparam NUM_E = 8'b01100001;
    localparam NUM_F = 8'b01110001;

    always @ (*) begin
        case (in)
            4'h0: out = NUM_0;
            4'h1: out = NUM_1;
            4'h2: out = NUM_2;
            4'h3: out = NUM_3;
            4'h4: out = NUM_4;
            4'h5: out = NUM_5;
            4'h6: out = NUM_6;
            4'h7: out = NUM_7;
            4'h8: out = NUM_8;
            4'h9: out = NUM_9;
            4'ha: out = NUM_A;
            4'hb: out = NUM_B;
            4'hc: out = NUM_C;
            4'hd: out = NUM_D;
            4'he: out = NUM_E;
            4'hf: out = NUM_F;
        endcase
    end
endmodule
