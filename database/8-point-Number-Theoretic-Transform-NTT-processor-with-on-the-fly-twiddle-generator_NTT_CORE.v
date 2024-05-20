// This program was cloned from: https://github.com/Motherboard77/8-point-Number-Theoretic-Transform-NTT-processor-with-on-the-fly-twiddle-generator
// License: GNU General Public License v3.0


//module NTT_CORE(i,j,N,start1,start2,t,tprev,enable,rw,clock,x1_out,x2_out,index1_out,index2_out,u_inp_check,v_inp_check,TW_check,tw_ack,buf_ack);
//NTT_CORE(i,j,N,start1,start2,t,tprev,enable,rw,clock,x1_out,x2_out,index1_out,index2_out,u_inp_check,v_inp_check,TW_check,tw_ack,buf_ack);

module NTT_CORE(i,j,N,start1,start2,t,tprev,enable,rw,clock,x1_out,x2_out,tw_ack,buf_ack);

parameter n = 4;
parameter m = 25;
input [n:0] i;
input [n:0] j;
input [n:0] N;
input [n:0] t;
input [n:0] tprev;
input clock;
input enable;
input rw;
input start1,start2;
output wire [m-1:0] x1_out;
output wire [m-1:0] x2_out;
output tw_ack;
output buf_ack;
//output [n:0] index1_out;            //test signal
//output [n:0] index2_out;            //test signal
//output [24:0] u_inp_check;          //test signal
//output [24:0] v_inp_check;          //test signal
//output [24:0] TW_check;             //test signal

wire [m-1:0] u_inp;      //input extracted from memory 
wire [m-1:0] v_inp;      //input extracted from memory
wire [n:0] index1;
wire [n:0] index2;

encapsulate2 ENCAP2(i,j,t,tprev,start1,clock,index1,index2);       //JMOD+BUF INDEX GENERATOR
assign index1_out = index1;
assign index2_out = index2;
assign u_inp_check = u_inp;
assign v_inp_check = v_inp;

dualPortMemory MEM1(clock,rw,enable,index1,index2,x1_out,x2_out,u_inp,v_inp);

encapsulate1 ENCAP1(i,j,N,start2,clock,u_inp,v_inp,x1_out,x2_out,tw_ack,buf_ack);  //TWIDDLE GEN+BUF UNIT

//data in = x1_out,x2_out   //data_out = u_inp,v_inp
//dualPortMemory(clock,rw,enable,addr1,addr2,data_in1,data_in2,data_out1,data_out2);

endmodule