// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

/**************************************************
P1.1 MOORE SEQUENCE DETECTOR
************************************************/
module moore(
	input reset,
	input clk,
	input in,
	output reg det
	);
reg [2:0] pr_stage, nx_stage; parameter  s0=3'b000;
parameter s1=3'b010;
parameter s2=3'b011 ;
parameter s3=3'b100 ;
always@(posedge clk)
begin
	if(reset)
		pr_stage<=s0;
	else
	pr_stage<=nx_stage; 
end
always@(pr_stage,in)
case(pr_stage)
	s0:if(in==1)
	nx_stage=s1;
	else
	nx_stage=s0;
	s1:if(in==0)
	nx_stage=s2;
	else
	nx_stage=s1;
	s2:if(in==1)
	nx_stage=s3;
	else
	nx_stage=s0;
	s3:if(in==1)
	nx_stage=s1;
	else
	nx_stage=s2;
	default:nx_stage=s0;
endcase


always@(pr_stage)
case(pr_stage)
	s0: det=0;
	s1: det=0;
	s2: det=0;
	s3: det=1;
	default: det=0;
endcase
endmodule