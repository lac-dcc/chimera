// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module ActivationFunction (
    input [11:0] in,
    output [4:0] out
);

    C2 MUX0(.D({1'b0,1'b0,in[11],1'b0}), .A({1'b1,in[11]}), .B(2'b11), .out(out[4]));
    C2 MUX1(.D({1'b0,1'b0,in[6],1'b0}), .A({1'b1,in[11]}), .B(2'b11), .out(out[3]));
    C2 MUX2(.D({1'b0,1'b0,in[5],1'b0}), .A({1'b1,in[11]}), .B(2'b11), .out(out[2]));
    C2 MUX3(.D({1'b0,1'b0,in[4],1'b0}), .A({1'b1,in[11]}), .B(2'b11), .out(out[1]));
    C2 MUX4(.D({1'b0,1'b0,in[3],1'b0}), .A({1'b1,in[11]}), .B(2'b11), .out(out[0]));

endmodule

