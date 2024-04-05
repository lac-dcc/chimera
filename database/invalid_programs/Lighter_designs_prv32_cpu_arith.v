/*
 	Copyright 2022 Mohamed Shalan
	
	Licensed under the Apache License, Version 2.0 (the "License"); 
	you may not use this file except in compliance with the License. 
	You may obtain a copy of the License at:

	http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software 
	distributed under the License is distributed on an "AS IS" BASIS, 
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
	See the License for the specific language governing permissions and 
	limitations under the License.
*/

/*
    A collection of Aritmetic Building Blocks optimized for ASIC Implementation
        - N-bit mirroring 
        - N-bit Shift Left (Logic and Arithmetic)
        - N-bit Shifter
        - N-bit RCA
        - 32-bit Carry Select Adder (2 stages; each 16-bit)
        - 32-bit Carry Select Adder (4 stages; each 8-bit)

    Synthesis data is obtained using SKy130 HD library utlizing OpenLane synth strategy 4 (AREA 0)
*/
//`include "/Users/youssef/Desktop/EDA/Dynamic_Power_Clock_Gating/sky_130_library/sky130_hd.v"
`default_nettype none

//`define FA (iname, a, b, ci, s, co)    sky130_fd_sc_hd__fa_1 iname ( .COUT(co), .CIN(ci), .A(a), .B(b), .SUM(s) )

// MUX4
module mux_4(
    input wire          a, b, c, d, 
    input wire [1:0]    s,
    output wire         x
    );

    sky130_fd_sc_hd__mux4_1 mux ( .X(x), .A0(a), .A1(b), .A2(c), .A3(d), .S0(s[0]), .S1(s[1]) );

endmodule

// Mirioring Unit for the Shifter
module mirror #(parameter WIDTH=32 ) (
	input wire [WIDTH-1:0]  in, 
	output reg [WIDTH-1:0]  out
);
    integer i;
    localparam LAST_BIT = WIDTH - 1;
    always @*
        for(i=0; i<WIDTH; i=i+1)
            out[i] = in[LAST_BIT-i];
endmodule

// Shift Right (L/A)
module shift_right #(parameter WIDTH=32, LOGWIDTH=$clog2(WIDTH) ) (
	input  wire [WIDTH-1:0]     a, 
	output wire [WIDTH-1:0]     r, 
	input  wire [LOGWIDTH-1:0]  shamt, 
	input                       ar      // 0: logic, 1: Arithmetic 
);

    wire [WIDTH-1:0] row[LOGWIDTH:0];
    
    wire fill = ar ? a[WIDTH-1] : 1'b0;
    
    assign row[0] = a;
    assign r = row[LOGWIDTH];

    generate
        genvar i; 
        for(i=0; i<LOGWIDTH; i=i+1) 
            assign row[i+1] = shamt[i] ? { { (2**i) {fill} }, row[i][WIDTH-1:(2**i)] } : row[i];
    endgenerate

endmodule

// The Shifter
// typ ==> 00 : srl, 10 : sra, 01 : sll
// 245 cells, 2.75 ns
module shift  #(parameter WIDTH=32, LOGWIDTH=$clog2(WIDTH) ) (
	input  wire [WIDTH-1:0]     a,
	input  wire [LOGWIDTH-1:0]  shamt,
	input  wire [1:0]           type,	    
	output wire [WIDTH-1:0]     r
);
    wire [WIDTH-1 : 0] ma, my, y, x, sy;

    mirror m1(.in(a), .out(ma));
    mirror m2(.in(y), .out(my));

    assign x = type[0] ? ma : a;
    
    shift_right shr (.a(x), .r(y), .shamt(shamt), .ar(type[1]));

    assign r = type[0] ? my : y;

endmodule

// n-bit RCA using n FA instances
// 32-bit: 32 cells, 12.75 ns 
module rca #(parameter n=32) ( 
	input  [n-1:0] 	a, b,
	input 			ci,
	output [n-1:0]	s,
	output			co
);
	wire [n:0] c;
	
	assign c[0] = ci;
	assign co = c[n];
	
	generate 
		genvar i;
		for(i=0; i<n; i=i+1) 
			sky130_fd_sc_hd__fa_1 FA ( .COUT(c[i+1]), .CIN(c[i]), .A(a[i]), .B(b[i]), .SUM(s[i]) );
            //`FA(FA, a[i], b[i], c[i], s[i], c[i+1]) ;
   	endgenerate

endmodule

// n-bit Carry-Lookahead Adder
// 32-bit: 140 cells, 5.6 ns
module cla  #(parameter n=8)
(
   input  [n-1:0]   a, b,
   input 			ci,
   output [n-1:0]   s,
   output           co
);
     
  wire [n:0]     w_C;
  wire [n-1:0]   w_G, w_P, w_SUM;
 
  // Create the Full Adders
  genvar             ii;
  generate
    for (ii=0; ii<n; ii=ii+1) 
        sky130_fd_sc_hd__fa_1 FA ( .COUT(), .CIN(w_C[ii]), .A(a[ii]), .B(b[ii]), .SUM(w_SUM[ii]) );
        //`FA (FA, a[ii], b[ii], w_C[ii], w_SUM[ii], );
  endgenerate
 
  genvar             jj;
  generate
    for (jj=0; jj<n; jj=jj+1) 
      begin
        assign w_G[jj]   = a[jj] & b[jj];
        assign w_P[jj]   = a[jj] | b[jj];
        assign w_C[jj+1] = w_G[jj] | (w_P[jj] & w_C[jj]);
      end
  endgenerate
   
  assign w_C[0] = ci;
 
  assign co = w_C[n];
  assign s  = w_SUM;
 
endmodule // carry_lookahead_adder

// 32-bit Carry Select Adder 2x16
// 32-bit: 66 cells, 7 ns
module csa32_16( 
	input [31:0] 	a, b,
	input 			ci,
	output [31:0]	s,
	output			co
);

	wire co0, co10, co11;
	wire [15:0] s10, s11;
    wire		lo, hi; 

	sky130_fd_sc_hd__conb_1 TIE (.LO(lo), .HI(hi));

	rca #(16) A0  (.a(a[15:0]), .b(b[15:0]), .ci(ci), .co(co0), .s(s[15:0]) );
	rca #(16) A10  (.a(a[31:16]), .b(b[31:16]), .ci(lo), .co(co10), .s(s10) );
	rca #(16) A11  (.a(a[31:16]), .b(b[31:16]), .ci(hi), .co(co11), .s(s11) );
	sky130_fd_sc_hd__mux2_1 SMUX [15:0] ( .X(s[31:16]), .A0(s10), .A1(s11), .S(co0) );
	sky130_fd_sc_hd__mux2_1 CMUX ( .X(co), .A0(co10), .A1(co11), .S(co0) );

endmodule

// 32-bit Carry Select Adder, 4-stage using RCA units
// 32-bit: 87 cells, 4.3 ns 
module csa32_8( 
	input [31:0] 	a, b,
	input 			ci,
	output [31:0]	s,
	output			co
);
	wire 		co0, co1, co2, co3;
	wire [3:1] 	c0, c1;
	wire [7:0] 	s0[3:1], s1[3:1];
	wire		lo, hi; 

	sky130_fd_sc_hd__conb_1 TIE (.LO(lo), .HI(hi));

	rca #(8) A00  (.a(a[7:0]), .b(b[7:0]), .ci(ci), .co(co0), .s(s[7:0]) );
	
	rca #(8) A10  (.a(a[15:8]), .b(b[15:8]), .ci(lo), .co(c0[1]), .s(s0[1]) );
	rca #(8) A11  (.a(a[15:8]), .b(b[15:8]), .ci(hi), .co(c1[1]), .s(s1[1]) );
    assign s[15:8] = co0 ? s1[1] : s0[1];
    assign co1 = co0 ? c1[1] : c0[1];
	
	rca #(8) A20  (.a(a[23:16]), .b(b[23:16]), .ci(lo), .co(c0[2]), .s(s0[2]) );
	rca #(8) A21  (.a(a[23:16]), .b(b[23:16]), .ci(hi), .co(c1[2]), .s(s1[2]) );
    assign s[23:16] = co1 ? s1[2] : s0[2];
    assign co2 = co1 ? c1[2] : c0[2];

	rca #(8) A30  (.a(a[31:24]), .b(b[31:24]), .ci(lo), .co(c0[3]), .s(s0[3]) );
	rca #(8) A31  (.a(a[31:24]), .b(b[31:24]), .ci(hi), .co(c1[3]), .s(s1[3]) );
    assign s[31:24] = co2 ? s1[3] : s0[3];
    assign co = co2 ? c1[3] : c0[3];

endmodule

// 32-bit Carry Select Adder, 4-stage using CLA units
// 32-bit: 190 cells, 3.55 ns 
module csa32_8_cla( 
	input [31:0] 	a, b,
	input 			ci,
	output [31:0]	s,
	output			co
);
	wire 		co0, co1, co2, co3;
	wire [3:1] 	c0, c1;
	wire [7:0] 	s0[3:1], s1[3:1];
	wire		lo, hi; 

	sky130_fd_sc_hd__conb_1 TIE (.LO(lo), .HI(hi));

	cla #(8) A00  (.a(a[7:0]), .b(b[7:0]), .ci(ci), .co(co0), .s(s[7:0]) );
	
	cla #(8) A10  (.a(a[15:8]), .b(b[15:8]), .ci(lo), .co(c0[1]), .s(s0[1]) );
	cla #(8) A11  (.a(a[15:8]), .b(b[15:8]), .ci(hi), .co(c1[1]), .s(s1[1]) );
    assign s[15:8] = co0 ? s1[1] : s0[1];
    assign co1 = co0 ? c1[1] : c0[1];
	
	cla #(8) A20  (.a(a[23:16]), .b(b[23:16]), .ci(lo), .co(c0[2]), .s(s0[2]) );
	cla #(8) A21  (.a(a[23:16]), .b(b[23:16]), .ci(hi), .co(c1[2]), .s(s1[2]) );
    assign s[23:16] = co1 ? s1[2] : s0[2];
    assign co2 = co1 ? c1[2] : c0[2];

	cla #(8) A30  (.a(a[31:24]), .b(b[31:24]), .ci(lo), .co(c0[3]), .s(s0[3]) );
	cla #(8) A31  (.a(a[31:24]), .b(b[31:24]), .ci(hi), .co(c1[3]), .s(s1[3]) );
    assign s[31:24] = co2 ? s1[3] : s0[3];
    assign co = co2 ? c1[3] : c0[3];

endmodule

module adder_32 #(parameter ADDER_TYPE = 2) ( 
	input [31:0] 	a, b,
	input 			ci,
	output [31:0]	s,
	output			co
);

    generate
        if(ADDER_TYPE == 0) 
            assign {co, s} = a + b + ci;
        else if(ADDER_TYPE == 1)
            csa32_8 adder ( 
                .a(a), .b(b),
                .ci(ci),
                .s(s),
                .co(co)
            );
        else if(ADDER_TYPE == 2)
            csa32_8_cla adder ( 
                .a(a), .b(b),
                .ci(ci),
                .s(s),
                .co(co)
            );
        else if(ADDER_TYPE == 3)
            csa32_16 adder ( 
                .a(a), .b(b),
                .ci(ci),
                .s(s),
                .co(co)
            );
        else
            rca adder ( 
                .a(a), .b(b),
                .ci(ci),
                .s(s),
                .co(co)
            );
    endgenerate    



endmodule
/*
    A highly optimized ALU and Shifter for RV32I

    alufn   Function
    ~~~~~   ~~~~~~~~~~~~~~~~
    00_00   Add (a + b)
    00_01   Sub (a - b)
    00_11   Pass b
    01_00   OR  (a | b)
    01_01   AND (a & b)
    01_11   XOR (a ^ b)
    10_00   SRL (a >> shamt)
    10_10   SRA (a >>> shamt)
    10_01   SLL (a << shamt)
    11_01   SLT (a < b)
    11_11   SLTU (a <b)

    ADDER_TYPE :
        - 0 : Yosys default adder type          [882 cells, 3.80 ns] <
        - 1 : Carry Select Adder, 4 RCA stages  [677 cells, 6.44 ns] <
        - 2 : Carry Select Adder, 4 CLA stages  [857 cells, 4.70 ns]
        - 3 : Carry Select Adder, 2 RCA stages  [622 cells, 9.66 ns]
        - 4 : Ripple Carry Adder                [588 cells, 15.3 ns] <
*/
module rv32i_alu #(parameter ADDER_TYPE = 2) (
	input   wire [31:0]     a, b,
	input   wire [ 4:0]     shamt,
	output  reg  [31:0]     r,
	output  wire            cf, zf, vf, sf,
	input   wire [ 3:0]     alufn
);

    wire [31: 0] add, sub, op_b;
    wire [31: 0] sh;

    assign op_b = b ^ {32{alufn[0]}};

    adder_32 #(.ADDER_TYPE(ADDER_TYPE)) adder ( 
        .a(a), .b(op_b),
        .ci(alufn[0]),
        .s(add),
        .co(cf)
    );
/*
    generate
        if(ADDER_TYPE == 0) 
            assign {cf, add} = a + op_b + alufn[0];
        else if(ADDER_TYPE == 1)
            csa32_8 adder ( 
                .a(a), .b(op_b),
                .ci(alufn[0]),
                .s(add),
                .co(cf)
            );
        else if(ADDER_TYPE == 2)
            csa32_8_cla adder ( 
                .a(a), .b(op_b),
                .ci(alufn[0]),
                .s(add),
                .co(cf)
            );
        else if(ADDER_TYPE == 3)
            csa32_16 adder ( 
                .a(a), .b(op_b),
                .ci(alufn[0]),
                .s(add),
                .co(cf)
            );
        else
            rca adder ( 
                .a(a), .b(op_b),
                .ci(alufn[0]),
                .s(add),
                .co(cf)
            );
    endgenerate
*/
    assign zf = (add == 0);
    assign sf = add[31];
    assign vf = (a[31] ^ (op_b[31]) ^ add[31] ^ cf);

    shift shift0 (
        .a(a),
        .shamt(shamt),
        .type(alufn[1:0]),
        .r(sh)
	);

    always @ * begin
        (* full_case *)
        (* parallel_case *)
        case (alufn)
            // arithmetic
            4'b00_00 :  r = add;
            4'b00_01 :  r = add;
            4'b00_11 :  r = b;
            // logic
            4'b01_00:   r = a | b;
            4'b01_01:   r = a & b;
            4'b01_11:   r = a ^ b;
            // shift
            4'b10_00:   r = sh;
            4'b10_01:   r = sh;
            4'b10_10:   r = sh;
            // slt & sltu
            4'b11_01:   r = {31'b0,(sf != vf)};
            4'b11_11:   r = {31'b0,(~cf)};

			default:    r = add;
        endcase
    end
endmodule

`ifdef VERIFY_SHIFT
`timescale 1ns/1ps
module shift_tb;

    localparam WIDTH = 32;
    localparam LOGWIDTH = $clog2(WIDTH);

    reg  signed [WIDTH-1:0]     a;
    reg  [LOGWIDTH-1:0]  shamt;
    reg  [1:0]           type;
    wire [WIDTH-1:0]     r;

    `TB_INIT(shift_tb, "shift_tb.vcd", 0, 50_000)

    shift  muv (
        .a(a),
        .shamt(shamt),
        .type(type),	    // 00 : srl, 10 : sra, 01 : sll
        .r(r)
    );

    // golden model
    wire [WIDTH-1:0] golden_r;
    assign golden_r =   (type==0) ? (a >> shamt ):
                        (type==2) ? ($signed(a) >>> shamt) :
                        (type==1) ? (a << shamt ) : a;

    // The monitor
    always @(r) begin
        #1;
        if(golden_r != r)
            $display("Test Failed - %x %x %x = %x (should be %x)", a, type, shamt, r, golden_r);
    end

    initial begin
        a =32'hAB0BEEF8;
        shamt = 0;
        type = 0;
        #10;
        shamt = 1;
        #10;
        shamt = 2;
        #10;
        shamt = 3;
        #10;
        shamt = 4;
        #10;
        shamt = 5;
        #10;
        shamt = 6;
        #10;
        shamt = 7;
        #10;
        type = 1;
        #10;
        type = 2;
        #10;
        
        $finish;

    end
endmodule
`endif

`ifdef VERIFY_ADDERS

`timescale 1ns/1ps
module adder_tb;

    localparam WIDTH = 32;
    localparam LOGWIDTH = $clog2(WIDTH);

    reg  [WIDTH-1:0]    a, b;
    reg  [0:0]          ci;
    wire [WIDTH-1:0]    muv0_s, muv1_s, muv2_s, muv3_s;
    wire [0:0]          muv0_c, muv1_c, muv2_c, muv3_c;
    

    `TB_INIT(adder_tb, "adder_tb.vcd", 0, 50_000)

    rca muv0( 
	    .a(a), .b(b),
	    .ci(ci),
	    .s(muv0_s),
	    .co(muv0_c)
    );

    csa32_8 muv1( 
	    .a(a), .b(b),
	    .ci(ci),
	    .s(muv1_s),
	    .co(muv1_c)
    );

    csa32_16 muv2( 
	    .a(a), .b(b),
	    .ci(ci),
	    .s(muv2_s),
	    .co(muv2_c)
    );

    cla muv3( 
	    .a(a), .b(b),
	    .ci(ci),
	    .s(muv3_s),
	    .co(muv3_c)
    );

    // golden model
    wire [WIDTH-1:0] golden_s;
    wire golden_c;
    assign {golden_c,golden_s} =  a + b + ci;

    // The monitor
    always @(golden_c or golden_s) begin
        #1;
        if(golden_s != muv0_s)
            $display("Test Failed - %x + %x + %x= %x, %c (should be %x, %x)", a, b, ci, muv0_c, muv0_s, golden_c, golden_s);
        else if(golden_c != muv0_c)
            $display("Test Failed - %x + %x + %x= %x, %c (should be %x, %x)", a, b, ci, muv0_c, muv0_s, golden_c, golden_s);
        else if(golden_s != muv1_s)
            $display("Test Failed - %x + %x + %x= %x, %c (should be %x, %x)", a, b, ci, muv1_c, muv1_s, golden_c, golden_s);
        else if(golden_c != muv1_c)
            $display("Test Failed - %x + %x + %x= %x, %c (should be %x, %x)", a, b, ci, muv1_c, muv1_s, golden_c, golden_s);    
        else if(golden_s != muv2_s)
            $display("Test Failed - %x + %x + %x= %x, %c (should be %x, %x)", a, b, ci, muv2_c, muv2_s, golden_c, golden_s);
        else if(golden_c != muv2_c)
            $display("Test Failed - %x + %x + %x= %x, %c (should be %x, %x)", a, b, ci, muv2_c, muv2_s, golden_c, golden_s);
    end

    initial begin
        a = 20;
        b = 30;
        ci = 0;
        #10;
        ci = 1;
        #10;
        a = -20;
        b = -30;
        #10;
        ci = 0;
        #50;
        a = 10000;
        b = 3400000;
        #10;
        a = -100;
        b = 30;
        #10;
        ci = 1;
        #10;
        a = -100;
        b = 100;
        #10;
        a = -100;
        b = 200;
        #10;
        a = -400;
        b = 300;
        #10;
        a = 32'hFFFF_FFFF;
        b = 1;
        #10;
        ci = 0;
        #10;
        $finish;
    end
endmodule 
`endif