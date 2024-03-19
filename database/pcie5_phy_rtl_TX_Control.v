module TX_CONTROL#
(
parameter MAXPIPEWIDTH =32,
parameter LANESNUMBER = 8,
parameter GEN1_PIPEWIDTH = 8,
parameter GEN2_PIPEWIDTH = 16,	
parameter GEN3_PIPEWIDTH = 32,	
parameter GEN4_PIPEWIDTH = 8,
parameter GEN5_PIPEWIDTH = 8 	
)
(reset_n,data_in,wr,wr_valid,pclk,STP_IN,SDP_IN,END_IN,Gen,DetectedLanes,Hold,full,DataOut,ValidOut,DKOut);

input reset_n;
input wr;
input pclk;
input [2:0] Gen;
input [LANESNUMBER-1:0]DetectedLanes;
input Hold;
input[63:0] wr_valid;
input[63:0] STP_IN;
input[63:0] SDP_IN;
input[63:0] END_IN;
input[511:0] data_in;
output[MAXPIPEWIDTH*LANESNUMBER-1:0]DataOut;
output [MAXPIPEWIDTH/8*LANESNUMBER-1:0]ValidOut;
output [MAXPIPEWIDTH/8*LANESNUMBER-1:0]DKOut;
output full;
wire empty;
wire[63:0] rd_valid;
wire[63:0] STP_OUT;
wire[63:0] SDP_OUT;
wire[63:0] END_OUT;
wire[511:0] data_out;
wire ReadEn;
FIFO m1 (reset_n,data_in,wr,ReadEn,wr_valid,pclk,STP_IN,SDP_IN,END_IN,empty,full,data_out,STP_OUT,SDP_OUT,END_OUT,rd_valid);
InsertTokenBlock #(.MAXPIPEWIDTH(MAXPIPEWIDTH),.LANESNUMBER(LANESNUMBER),.GEN1_PIPEWIDTH(GEN1_PIPEWIDTH),
.GEN2_PIPEWIDTH(GEN1_PIPEWIDTH),.GEN3_PIPEWIDTH(GEN3_PIPEWIDTH),.GEN4_PIPEWIDTH(GEN4_PIPEWIDTH),.GEN5_PIPEWIDTH(GEN5_PIPEWIDTH)) 
m2 (pclk,reset_n,data_out,rd_valid,STP_OUT,SDP_OUT,END_OUT,Gen,DetectedLanes,Hold,empty,ReadEn,DataOut,ValidOut,DKOut);
endmodule

