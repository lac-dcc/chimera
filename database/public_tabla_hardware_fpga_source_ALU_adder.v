`timescale 1ns/1ps
module addSub #(
parameter LEN  = 9)(
	in1,
	in2,
	outAdd,
	outSub,
	overflowA,
	overflowS
);
	//--------------------------------------------------------------------------------------
 	

 	//--------------------------------------------------------------------------------------
 	input[LEN-1:0] in1;
 	input[LEN-1:0] in2;
 	output[LEN-1:0] outAdd;
	output[LEN-1:0] outSub;
 	output overflowA;
 	output overflowS;
    
  //--------------------------------------------------------------------------------------
	wire [LEN:0] addRes; 
	wire [LEN:0] subRes; 
	wire [1:0]   carry; 

    //--------------------------------------------------------------------------------------
  assign addRes = in1 + in2;   
  assign subRes = in1 - in2;

	assign carry[0] = (addRes[LEN - 1] ^ in1[LEN - 1] ^ in2[LEN - 1] ) || (in1[LEN -1] & in2[LEN - 1]);
	assign carry[1] = (subRes[LEN - 1] ^ in1[LEN - 1] ^ in2[LEN - 1] ) || (in1[LEN -1] & in2[LEN - 1]);
	
	assign outAdd = addRes[LEN - 1:0];    
	assign outSub = subRes[LEN - 1:0]; 

  //--------------------------------------------------------------------------------------
 	assign overflowA = carry[0] ^ addRes[LEN];
 	assign overflowS = carry[1] ^ subRes[LEN];
 
endmodule
