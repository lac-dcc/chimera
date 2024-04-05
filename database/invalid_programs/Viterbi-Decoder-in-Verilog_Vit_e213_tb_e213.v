/*============================================================================
   module tb_e213.v

   Test bench for efficient (2,1,3) backward label  Viterbi Decoder.

===========================================================================*/

`timescale 1 ns/1 ns

module tb_e213;

`include "params_e213.inc"



   reg [`BLOCK_LEN-1:0] vector_memory [0:9];
   reg [`BLOCK_LEN-1:0] U_data;
   reg [`BLOCK_LEN-1:0] D_data;
   reg 			clock;
   reg 			reset;
   reg [`k-1:0] 	Ux;

   wire [`n-1:0] 	Vx;
   wire [`n-1:0] 	Rx;   
   wire [`k-1:0] 	Dx;
   wire [63:0] 		HD;
   wire 		tb_en;
   wire 		error;
   wire 		Dx_oe;
   
   integer 		vector_bit;
   integer              vector;
   integer 		fail;
   


/*===  Instantiate a model of the (2,1,3) encoder ===*/

VIT_ENC TB_U1 (.Vx(Vx), .Ux(Ux), .tb_en(tb_en), .clock(clock), .reset(reset));

/*===  Instantiate a the (2,1,3) decoder ===*/
eVITERBI_213 TB_U2 (.Dx(Dx), .Dx_oe(DX_oe), .tb_en(tb_en), .error(error), .Rx(Vx), .clock(clock), .reset(reset));


/*=== Create Free Running Clock ===*/

always
  begin
     #(0.5*`CLOCK_PERIOD);
     clock=~clock;
  end


initial
  $readmemb("testvectors_213.txt",vector_memory);

   //U_data=20'b0110_1100_1010_0011_0010


/*=== Clock data into the encoder ===*/
initial
  begin
     clock    = 0;
     Ux       = 0;
     reset    = 1; //Apply reset
     fail     = 0;
     D_data   = 0;
     vector   = 0;
     U_data = vector_memory[vector];

     #`CLOCK_PERIOD reset =0;//Disable reset after one clock period

     for (vector=0; vector<10; vector=vector+1)
       begin
          U_data=vector_memory[vector];
          //$display ("# Input Message U =%b #",U_data);
          D_data = 0;

          for (vector_bit=`BLOCK_LEN-1; vector_bit>=0; vector_bit=vector_bit-1)
            begin
               Ux=U_data[vector_bit]; 
               #`CLOCK_PERIOD;
            end
	  
       end // for (vector=0; vector<10; vector=vector+1)
  end // initial begin
   

/*=== Create Simulation Waveforms ===*/

initial
  begin
     $fsdbDumpfile("verilog.fsdb");// debussy dump format
     $fsdbDumpStrength;
     $fsdbDumpvars;
  end
   

initial
   #13600 $finish;



/*=== Monitor Viterbi Decoder Responses ===*/
initial
   $monitor("time=%4g, clk=%b, reset=%b, Ux=%b, Vx=%b, we=%b,te=%b, oe=%b, wptr=%h, tptr=%h, CNT=%g, min_state=%b, PX[trc_ptr]=%b, tb_reg=%b, A_in=%h, P_in=%b, Dx=%b, error=%b",
             $time,
             clock,
	     reset,
	     Ux,
	     Vx,
	     TB_U2.U3.we,
	     TB_U2.U3.te,	    
	     TB_U2.U3.oe,
	     TB_U2.U3.write_ptr,
    	     TB_U2.U3.trace_ptr,
	     TB_U2.U3.block_count,	    	     
             TB_U2.U3.min_state,
	    
	     {TB_U2.U3.P0[TB_U2.U3.trace_ptr],
	      TB_U2.U3.P1[TB_U2.U3.trace_ptr],
	      TB_U2.U3.P2[TB_U2.U3.trace_ptr],
	      TB_U2.U3.P3[TB_U2.U3.trace_ptr],
	      TB_U2.U3.P4[TB_U2.U3.trace_ptr],
	      TB_U2.U3.P5[TB_U2.U3.trace_ptr],
	      TB_U2.U3.P6[TB_U2.U3.trace_ptr],
	      TB_U2.U3.P7[TB_U2.U3.trace_ptr]},
	      
             TB_U2.U3.tb_reg,
	     	     
            {TB_U2.U3.A0_in,
             TB_U2.U3.A1_in, 
             TB_U2.U3.A2_in, 
             TB_U2.U3.A3_in, 
             TB_U2.U3.A4_in, 
             TB_U2.U3.A5_in, 
             TB_U2.U3.A6_in, 
             TB_U2.U3.A7_in},
             
            
             {TB_U2.U3.P0_in, 
             TB_U2.U3.P1_in, 
             TB_U2.U3.P2_in, 
             TB_U2.U3.P3_in, 
             TB_U2.U3.P4_in, 
             TB_U2.U3.P5_in, 
             TB_U2.U3.P6_in, 
             TB_U2.U3.P7_in},


             TB_U2.U3.Dx,
             TB_U2.error
             );


endmodule





