// This program was cloned from: https://github.com/Motherboard77/8-point-Number-Theoretic-Transform-NTT-processor-with-on-the-fly-twiddle-generator
// License: GNU General Public License v3.0


module encapsulate1(i,j,N,start,clock,u_inp,v_inp,x1_out,x2_out,tw_ack,buf_ack);

parameter n = 25;
input [4:0] i;
input [4:0] j;
input [4:0] N;
input start;
input clock;
input [n-1:0] u_inp;
input [n-1:0] v_inp;
output [n-1:0] x1_out;
output [n-1:0] x2_out;
output tw_ack;
output buf_ack;

wire [n-1:0] TW_out;

//assign TW_check = TW_out;   //check whether twiddle is obtained or not at output

TW_gen TWIDDLE1(j,i,N,start,clock,tw_ack,TW_out);
BUFunit BUF1(u_inp,v_inp,clock,TW_out,x1_out,x2_out,buf_ack);

endmodule