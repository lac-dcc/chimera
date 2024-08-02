// This program was cloned from: https://github.com/phn210/fpga-ascon
// License: MIT License

module SubLayer (
    input [63:0] x0, x1, x2, x3, x4,
    output [63:0] sl0, sl1, sl2, sl3, sl4
);
    genvar i;
    generate
        // SBox implementation with lookup table
		for(i=0; i<64; i=i+1) begin
			SBoxLookup u0({x0[i],x1[i],x2[i],x3[i],x4[i]}, {sl0[i],sl1[i],sl2[i],sl3[i],sl4[i]});
		end
    endgenerate
endmodule

module SBoxLookup (
    input   [4:0] data,
    output  [4:0] out
);
    reg [4:0] dout;
    always@(data) begin
        case (data)          //Look Up Table
            5'h00              : dout = 5'h04;
            5'h01              : dout = 5'h0b;
            5'h02              : dout = 5'h1f;
            5'h03              : dout = 5'h14;
            5'h04              : dout = 5'h1a;
            5'h05              : dout = 5'h15;
            5'h06              : dout = 5'h09;
            5'h07              : dout = 5'h02;
            5'h08              : dout = 5'h1b;
            5'h09              : dout = 5'h05;
            5'h0a              : dout = 5'h08;
            5'h0b              : dout = 5'h12;
            5'h0c              : dout = 5'h1d;
            5'h0d              : dout = 5'h03;
            5'h0e              : dout = 5'h06;
            5'h0f              : dout = 5'h1c;
        /******************************************/
            5'h10              : dout = 5'h1e;
            5'h11              : dout = 5'h13;
            5'h12              : dout = 5'h07;
            5'h13              : dout = 5'h0e;
            5'h14              : dout = 5'h00;
            5'h15              : dout = 5'h0d;
            5'h16              : dout = 5'h11;
            5'h17              : dout = 5'h18;
            5'h18              : dout = 5'h10;
            5'h19              : dout = 5'h0c;
            5'h1a              : dout = 5'h01;
            5'h1b              : dout = 5'h19;
            5'h1c              : dout = 5'h16;
            5'h1d              : dout = 5'h0a;
            5'h1e              : dout = 5'h0f;
            5'h1f              : dout = 5'h17;
        endcase
    end
    assign out = dout;
endmodule