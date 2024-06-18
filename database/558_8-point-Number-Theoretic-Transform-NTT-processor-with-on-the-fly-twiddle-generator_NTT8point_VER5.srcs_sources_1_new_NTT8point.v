// This program was cloned from: https://github.com/Motherboard77/8-point-Number-Theoretic-Transform-NTT-processor-with-on-the-fly-twiddle-generator
// License: GNU General Public License v3.0


module NTT_8point(clock,local_start,x1_out,x2_out);

parameter m = 25;
parameter n = 5;
input clock;
input local_start;
output wire [m-1:0] x1_out;
output wire[m-1:0] x2_out;

wire [n-1:0] i,j,N,t,tprev;
wire start1,start2,mem_en,rd_wr;
wire tw_ack,buf_ack;                    //input to the controller block

NTT_CORE CORE1(i,j,N,start1,start2,t,tprev,mem_en,rd_wr,clock,x1_out,x2_out,tw_ack,buf_ack);
NTT_Controller CON1(i,j,N,t,tprev,clock,start1,start2,mem_en,rd_wr,local_start,tw_ack,buf_ack);


endmodule
