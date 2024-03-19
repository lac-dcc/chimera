/*
Name : Harpinder Jot Singh
ID	 : 2017A7PS0057P
*/
`timescale 1ms/1ns
module MUX_2x1(
	output E,
	input C,
	input D,
	input F
);

	assign E = F ? D : C;

endmodule

module MUX_8x1(
	output O,
	input [7:0] E,
	input [2:0] Q
);

	assign O = Q[2] ? 
					(Q[1] ? 
						( (Q[0] ? (E[7]) : (E[6]) ) ) 
					:   ( (Q[0] ? (E[5]) : (E[4]) )) ) 
				  : (Q[1] ? 
						( (Q[0] ? (E[3]) : (E[2]) )) 
					:   ( (Q[0] ? (E[1]) : (E[0]) )));

endmodule

module MUX_ARRAY(
	output [7:0] E,
	input [7:0] C,
	input [7:0] D,
	input [7:0] F
);
	
	//wire ground = 1'b0;
	
	genvar i;
	
	generate for(i = 0; i < 8; i = i+1) begin :muxarr
		
		MUX_2x1 mux( E[i], D[i], C[i], F[i] );
		
	end
	endgenerate

endmodule

module COUNTER_3BIT(
	output [2:0] Q,
	input CLEAR,
	input CLK
);

	reg [2:0] Q;
	
	initial 
		Q = 3'b0;
	
	always @(posedge CLK) begin
		Q <= Q + 1;
	end
	
	always @(CLEAR)
		if(CLEAR) 
			Q <= 3'b0;
	
	

endmodule



module DECODER(
	
	output [7:0] B,
	input EN,
	input [2:0] A
	
);
	reg [7:0] B;
	always @(A) begin
		if(EN) begin
			case(A) 
				
				3'd0 : B = 8'b0000_0001;
				3'd1 : B = 8'b0000_0010;
				3'd2 : B = 8'b0000_0100;
				3'd3 : B = 8'b0000_1000;
				
				3'd4 : B = 8'b0001_0000;
				3'd5 : B = 8'b0010_0000;
				3'd6 : B = 8'b0100_0000;
				3'd7 : B = 8'b1000_0000;
			
			endcase
		end
	end


endmodule




module MEMORY(
	
	output [7:0] G,
	input [2:0] A
	
);

	reg [7:0] memory[0:7];
	reg [7:0] G;
	
	always @(A) begin
		
		case(A) 
			
			3'd0 : G = memory[0];
			3'd1 : G = memory[1];
			3'd2 : G = memory[2];
			3'd3 : G = memory[3];
			
			3'd4 : G = memory[4];
			3'd5 : G = memory[5];
			3'd6 : G = memory[6];
			3'd7 : G = memory[7];
		
		endcase
	end
		
	
	integer i;
	
	initial begin
		
		memory[0] = 8'h01;
		memory[1] = 8'h03;
		memory[2] = 8'h07;
		memory[3] = 8'h0F;
		
		memory[4] = 8'h1F;
		memory[5] = 8'h3F;
		memory[6] = 8'h7F;
		memory[7] = 8'hFF;
		
	end

endmodule



module TOP_MODULE(

	output O,
	input CLK,
	input CLEAR,
	input [2:0] S
);
	wire [2:0] Q;
	
	COUNTER_3BIT cnt(Q, CLEAR, CLK);
	
	wire [7:0] B;
	
	DECODER dec(B, 1'b1, Q);
	
	wire [7:0] G;
	MEMORY mem(G, S);
	
	wire [7:0] E;
	wire [7:0] GROUND = 8'b0;
	MUX_ARRAY arr(E, B,GROUND, G);
	
	MUX_8x1 mux(O, E, Q);
	
	

endmodule


module TB_TOPMODULE();

	initial begin
		$dumpfile("file.vcd");
		$dumpvars;
	end
	
	
	wire O;
	reg CLK;
	reg CLEAR;
	reg [2:0] S;
	
	TOP_MODULE mod(O, CLK, CLEAR, S);
	
	always	
		#0.5 CLK = ~CLK;
	
	initial begin
			CLK = 1'b0;
			S = 3'b0;
			CLEAR = 1'b1;
		#1	CLEAR = 1'b0;
		#100 $finish;
	end
	
	always
		#8	S = S+1;
	
	initial
		$monitor($time,"  , CLK = %b, S = %b, CLEAR = %b, O = %b", CLK, S, CLEAR, O);
endmodule