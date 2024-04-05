/*============================================================================
   module tb_b322.v

   Test bench for efficient (3,2,2) backward label  Viterbi Decoder.

===========================================================================*/

`timescale 1 ns/1 ns

module tb_e322;

`include "params_e322.inc"

   reg [`n-1:0] Rx_data [0:21];
   
   reg [`n-1:0] 	Rx;
   reg                  seq_ready;
   reg 			clock;
   reg 			reset;

   wire [`k-1:0] 	Dx;
   wire [63:0] 		HD;
   wire 		sync_error;
   wire 		oe;

   integer 		i;
   
   
/*===  Instantiate efficient (2,1,3) decoder ===*/
eVITERBI_322 TB_U2 (.Dx(Dx), .oe(oe), .sync_error(sync_error), .Rx(Rx), .seq_ready(seq_ready), .clock(clock), .reset(reset));


/*=== Create Free Running Clock ===*/

always
  begin
     #(0.5*`CLOCK_PERIOD);
     clock=~clock;
  end

/*=== Load Test Vectors ===*/
initial
  begin
                  
          
     Rx_data[0]  = 3'b000;
     Rx_data[1]  = 3'b011;
     Rx_data[2]  = 3'b111;
     Rx_data[3]  = 3'b011;
     Rx_data[4]  = 3'b100;
     Rx_data[5]  = 3'b110;
     Rx_data[6]  = 3'b010;
     Rx_data[7]  = 3'b000;
     Rx_data[8]  = 3'b100;
     Rx_data[9]  = 3'b011;

     Rx_data[10] = 3'b100;
     Rx_data[11] = 3'b011;
     Rx_data[12] = 3'b001;
     Rx_data[13] = 3'b000;
     Rx_data[14] = 3'b100;
     Rx_data[15] = 3'b110;
     Rx_data[16] = 3'b010;
     Rx_data[17] = 3'b000;
     Rx_data[18] = 3'b100;
     Rx_data[19] = 3'b011;

     Rx_data[20] = 3'b001;
     Rx_data[21] = 3'b110;
   end

/*=== Clock data into the decoder ===*/
initial
  begin
     clock    = 0;
     reset    = 1;            //Apply reset
     #`CLOCK_PERIOD reset =0; //Disable reset after one clock period
     
     seq_ready =1;
     

     for (i=0; i<9; i=i+1)
       begin
               Rx=Rx_data[i];
               #(`CLOCK_PERIOD*3);

        end
     // After 1st Traceback, clock in remaining bits after each traceback
     for (i=9; i<22; i=i+1)
       begin
               Rx=Rx_data[i];
               #(`CLOCK_PERIOD*13);

        end

     //for (i=22; i<32; i=i+1)
     //  #(`CLOCK_PERIOD*2);

     seq_ready =0;
     
  end
   

/*=== Create Simulation Waveforms ===*/

initial
  begin
     $fsdbDumpfile("verilog.fsdb");// debussy dump format
     $fsdbDumpStrength;
     $fsdbDumpvars;
  end
   

initial
   #11000 $finish;



/*=== Monitor Viterbi Decoder Responses ===*/
initial
   $monitor("time=%4g, clock=%b, Rx=%b, we=%b, te=%b, oe=%b, wptr=%h, tptr=%h, min_state=%b, tb_reg=%b,A_in=%h,P_in=%b,tb=%b,plabels=%b,Dx=%b, ns=%b",
             $time,
             clock,
	     Rx,
	     TB_U2.U3.we,
	     TB_U2.U3.te,
	     TB_U2.U3.oe,	    
	     TB_U2.U3.write_ptr,
    	     TB_U2.U3.trace_ptr,
             TB_U2.U3.min_state,
	    
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
	    
             {TB_U2.U3.P2_1[TB_U2.U3.trace_ptr],TB_U2.U3.tb_reg[2],TB_U2.U3.P2_0[TB_U2.U3.trace_ptr]},
	    
/*            {TB_U2.U3.P0_1[TB_U2.U3.trace_ptr],TB_U2.U3.P0_0[TB_U2.U3.trace_ptr], 
             TB_U2.U3.P1_1[TB_U2.U3.trace_ptr], TB_U2.U3.P1_0[TB_U2.U3.trace_ptr],
             TB_U2.U3.P2_1[TB_U2.U3.trace_ptr], TB_U2.U3.P2_0[TB_U2.U3.trace_ptr],
             TB_U2.U3.P3_1[TB_U2.U3.trace_ptr], TB_U2.U3.P3_0[TB_U2.U3.trace_ptr],
             TB_U2.U3.P4_1[TB_U2.U3.trace_ptr], TB_U2.U3.P4_0[TB_U2.U3.trace_ptr],
             TB_U2.U3.P5_1[TB_U2.U3.trace_ptr], TB_U2.U3.P5_0[TB_U2.U3.trace_ptr],
             TB_U2.U3.P6_1[TB_U2.U3.trace_ptr], TB_U2.U3.P6_0[TB_U2.U3.trace_ptr],
             TB_U2.U3.P7_1[TB_U2.U3.trace_ptr], TB_U2.U3.P7_0[TB_U2.U3.trace_ptr]},*/


            {TB_U2.U3.P0_1[9],TB_U2.U3.P0_0[9], 
             TB_U2.U3.P1_1[9], TB_U2.U3.P1_0[9],
             TB_U2.U3.P2_1[9], TB_U2.U3.P2_0[9],
             TB_U2.U3.P3_1[9], TB_U2.U3.P3_0[9],
             TB_U2.U3.P4_1[9], TB_U2.U3.P4_0[9],
             TB_U2.U3.P5_1[9], TB_U2.U3.P5_0[9],
             TB_U2.U3.P6_1[9], TB_U2.U3.P6_0[9],
             TB_U2.U3.P7_1[9], TB_U2.U3.P7_0[9]},
	    
             TB_U2.U3.Dx,
	     TB_U2.U3.NEXT_STATE
             );


endmodule





