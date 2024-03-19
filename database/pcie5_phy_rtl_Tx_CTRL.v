module Tx_CTRL # (parameter GEN1_PIPEWIDTH=16,parameter GEN2_PIPEWIDTH=16,parameter GEN3_PIPEWIDTH=16,parameter GEN4_PIPEWIDTH=8,parameter GEN5_PIPEWIDTH=32,
parameter LANESNUMBER=16,
parameter MAXPIPEWIDTH =32
)
(data_in,wr,Gen,STP_IN,SDP_IN,DetectedLanes,END_IN,wr_valid,Hold,reset_n,pclk,full,DataOut,ValidOut,DKOut);

input [511:0]data_in;
input[15:0]DetectedLanes;
input wr;
input [2:0]Gen;
input[63:0]STP_IN;
input[63:0]SDP_IN;
input[63:0]END_IN;
input[63:0]wr_valid;
input Hold;
//input stop_DS;
input reset_n;
input pclk;
output full;
output [511:0]DataOut;
output[63:0]ValidOut;
output [63:0]DKOut;
wire [511:0] data_out;
wire wr_out;
wire [63:0] STP_out;
wire [63:0] SDP_out;
wire [63:0] END_out;
wire [63:0] valid_out;
wire[79:0] Length;
wire [511:0] data_FIFO;
wire [63:0] STP_FIFO;
wire [63:0] SDP_FIFO;
wire [63:0] END_FIFO;
wire [63:0] Valid_FIFO;
wire[79:0] length_FIFO;
wire EMPTY;
wire rd;
LENGTH_COUNTER M1(pclk,data_in,DetectedLanes,wr,wr_valid,STP_IN,SDP_IN,END_IN,Gen,Length,data_out,wr_out,valid_out,STP_out,SDP_out,END_out);
FIFOV2 M2 (reset_n,data_out,wr_out,rd,valid_out,pclk,STP_out,SDP_out,END_out,Length,length_FIFO,EMPTY,full,data_FIFO,STP_FIFO,SDP_FIFO,END_FIFO,Valid_FIFO);
InsertBlockToken_G3  #(.MAXPIPEWIDTH(MAXPIPEWIDTH),.LANESNUMBER(LANESNUMBER),.GEN1_PIPEWIDTH(GEN1_PIPEWIDTH),
.GEN2_PIPEWIDTH(GEN1_PIPEWIDTH),.GEN3_PIPEWIDTH(GEN3_PIPEWIDTH),.GEN4_PIPEWIDTH(GEN4_PIPEWIDTH),.GEN5_PIPEWIDTH(GEN5_PIPEWIDTH))  M3(pclk,reset_n,data_FIFO,Valid_FIFO,STP_FIFO,SDP_FIFO,END_FIFO,Gen,length_FIFO,Hold,EMPTY,rd,DataOut,ValidOut,DKOut);
endmodule




