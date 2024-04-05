/*============================================================================
   module eCONTROL_213.v

   Metric Updating and Control Unit for 
   efficient (2,1,3) backward label  Viterbi Decoder.

===========================================================================*/


`timescale 1 ns/1 ns



module eCONTROL_213 (Dx, Dx_oe, tb_en, error,
                     A0_out, A1_out, A2_out, A3_out, A4_out, A5_out, A6_out, A7_out,
                     A0_in,  A1_in,  A2_in,  A3_in,  A4_in,  A5_in,  A6_in,  A7_in,
                     P0_in,  P1_in,  P2_in,  P3_in,  P4_in,  P5_in,  P6_in,  P7_in,
                     reset, clock 
                    );


`include "params_e213.inc"

   output [`k-1:0] Dx;
   output          Dx_oe;
   output 	   tb_en;
   output          error;
   
   output [`W-1:0] A0_out;
   output [`W-1:0] A1_out;
   output [`W-1:0] A2_out;
   output [`W-1:0] A3_out;
   output [`W-1:0] A4_out;
   output [`W-1:0] A5_out;
   output [`W-1:0] A6_out;
   output [`W-1:0] A7_out;

   
   input [`W-1:0] A0_in;
   input [`W-1:0] A1_in;
   input [`W-1:0] A2_in;
   input [`W-1:0] A3_in;
   input [`W-1:0] A4_in;
   input [`W-1:0] A5_in;
   input [`W-1:0] A6_in;
   input [`W-1:0] A7_in;
   
		   
   input [`k-1:0] P0_in;
   input [`k-1:0] P1_in;
   input [`k-1:0] P2_in;
   input [`k-1:0] P3_in;
   input [`k-1:0] P4_in;
   input [`k-1:0] P5_in;
   input [`k-1:0] P6_in;
   input [`k-1:0] P7_in;
   
		   
   input reset;
   input clock;

   reg [`T-1:0] P0;
   reg [`T-1:0] P1;
   reg [`T-1:0] P2;   
   reg [`T-1:0] P3;
   reg [`T-1:0] P4;
   reg [`T-1:0] P5;
   reg [`T-1:0] P6;
   reg [`T-1:0] P7;

   
   reg [`W-1:0] A0;
   reg [`W-1:0] A1;
   reg [`W-1:0] A2;
   reg [`W-1:0] A3;
   reg [`W-1:0] A4;
   reg [`W-1:0] A5;
   reg [`W-1:0] A6;
   reg [`W-1:0] A7;

   
   reg [8:0] 	block_count;
   reg [3:0] 	write_ptr;
   reg [3:0] 	trace_ptr;
   reg [2:0] 	tb_reg;
   

   reg 	      we;
   reg 	      te;
   reg 	      oe;
   

   wire [2:0] min_state;
   wire       last_write;
   wire       last_trace;
   wire       last_block;
   

   
   
assign Dx = (oe) ? tb_reg[2] : 1'bz;
assign tb_en  = te;
assign Dx_oe  = oe;      



/*=== Instantiate Traceback Decision Unit to determine the start state for traceback ===*/
eTBDECISION_213 TB_1 (.min_state(min_state), 
                      .in0(A0_out), .in1(A1_out), .in2(A2_out), .in3(A3_out), 
                      .in4(A4_out), .in5(A5_out), .in6(A6_out), .in7(A7_out));
   
/*=== Instantiate Out Of Sync Error Detection Unit ===*/
eSYNCERR_213  SE_1 (.error(error), .stage(write_ptr), .we(we), .metric(min_state), .reset(reset), .clock(clock));
   
   
   
   assign A0_out=A0;
   assign A1_out=A1;
   assign A2_out=A2;
   assign A3_out=A3;
   assign A4_out=A4;
   assign A5_out=A5;
   assign A6_out=A6;
   assign A7_out=A7;
   
   

   always @(posedge clock or posedge reset)
     begin
	if (reset)
	  begin
	     $display ("#####################");
	     $display ("#   COND is reset   #");
	     $display ("#####################");	     
	     write_ptr <=0;
	     trace_ptr <=0;
	     tb_reg    <=0;
	     
	     we <=1;
	     te <=0;
	     oe <=0;
	     
	     A0 <=4'b0000; P0 <=0;
	     A1 <=4'b1111; P1 <=0;
	     A2 <=4'b1111; P2 <=0;	     
	     A3 <=4'b1111; P3 <=0;	     
	     A4 <=4'b1111; P4 <=0;	     	     
	     A5 <=4'b1111; P5 <=0;	     	     
	     A6 <=4'b1111; P6 <=0;	     	     
	     A7 <=4'b1111; P7 <=0;

	     block_count <=`BLOCK_LEN;	     	     
	  end	
	else
	  begin

	     if (we && write_ptr==`T)
	       begin
	          $display ("###############################");		  
	          $display ("# COND is we && write_ptr==`T #");
	          $display ("###############################");
		  
                  A0            <=A0_in;
		  P0[write_ptr] <=P0_in;
		  
                  A1            <=A1_in;
		  P1[write_ptr] <=P1_in;
		  
                  A2            <=A2_in;
		  P2[write_ptr] <=P2_in;
		  
                  A3            <=A3_in;
		  P3[write_ptr] <=P3_in;
		  
                  A4            <=A4_in;
		  P4[write_ptr] <=P4_in;
		  
                  A5            <=A5_in;
		  P5[write_ptr] <=P5_in;
		  
                  A6            <=A6_in;
		  P6[write_ptr] <=P6_in;
		  
                  A7            <=A7_in;
		  P7[write_ptr] <=P7_in;
		  
		  trace_ptr <=`T-1;			  
	          we        <=0;
		  te        <=1;
		  tb_reg    <=min_state;
		  oe        <=0;
	       end
	     


               if (we && write_ptr <=`m)                  
                  begin
                     $display ("###############################");
                     $display ("# COND is we && write_ptr <`m #");
                     $display ("###############################");

                     A0 <=A0_in;
                     A1 <=A1_in;
                     A2 <=A2_in;
                     A3 <=A3_in;
                     A4 <=A4_in;
                     A5 <=A5_in;
                     A6 <=A6_in;
                     A7 <=A7_in;

                     write_ptr <=write_ptr+1;
                     tb_reg    <=min_state;
	             we        <=1;
	             te        <=0;
	             oe        <=0;
                  end

               if (we && write_ptr >`m)
                  begin
                     $display ("####################################");
                     $display ("# COND is we && write_ptr >m <`T-1 #");
                     $display ("####################################");

                     A0 <=A0_in;
                     A1 <=A1_in;
                     A2 <=A2_in;
                     A3 <=A3_in;
                     A4 <=A4_in;
                     A5 <=A5_in;
                     A6 <=A6_in;
                     A7 <=A7_in;

                     P0[write_ptr] <=P0_in;
                     P1[write_ptr] <=P1_in;
	             P2[write_ptr] <=P2_in;
	             P3[write_ptr] <=P3_in;
	             P4[write_ptr] <=P4_in;
	             P5[write_ptr] <=P5_in;
	             P6[write_ptr] <=P6_in;
	             P7[write_ptr] <=P7_in;

	             write_ptr <=write_ptr+1;
	             tb_reg    <=min_state;
	             we        <=1;
	             te        <=0;
	             oe        <=0;
                  end
		  
	     
	     if (!we && te && trace_ptr ==1)
	       begin
	          $display ("###############################");
	          $display ("# COND is te && trace_ptr ==1) #");
	          $display ("###############################");
		  
	          we      <=0;
	          te      <=1;
		  oe      <=1;
	        end

            if (!we && te && trace_ptr <=`m+1)
	       begin
	          $display ("###############################");
	          $display ("# COND is te && trace_ptr <=`m+1#");
	          $display ("###############################");
		  
	          we      <=0;
	          te      <=1;
		  oe      <=1;
                  tb_reg  <={tb_reg[1:0],1'b0}; // Shift out tb_reg[2] to Dx
	        end
	     
             if (!oe && !we && te && trace_ptr >`m+1) // if te is asserted, traceback one addr
	       begin
	          $display ("##############################");
	          $display ("# COND is te && trace_ptr >1 #");
	          $display ("##############################");

                   case (tb_reg) //synopsys full_case parallel_case
                      3'b000 : tb_reg <={P0[trace_ptr],tb_reg[2:1]};
                      3'b001 : tb_reg <={P1[trace_ptr],tb_reg[2:1]};
                      3'b010 : tb_reg <={P2[trace_ptr],tb_reg[2:1]};
                      3'b011 : tb_reg <={P3[trace_ptr],tb_reg[2:1]};
                      3'b100 : tb_reg <={P4[trace_ptr],tb_reg[2:1]};
                      3'b101 : tb_reg <={P5[trace_ptr],tb_reg[2:1]};
                      3'b110 : tb_reg <={P6[trace_ptr],tb_reg[2:1]};
                      3'b111 : tb_reg <={P7[trace_ptr],tb_reg[2:1]};
                   endcase // case(tb_reg)
		   trace_ptr <=trace_ptr-1; // Point to the previous trace word

	       end // if (te && !last_trace)
	     
	     if (oe && block_count ==0)
               begin
	          $display ("###############################");
	          $display ("# COND is oe && block_count ==0 #");
	          $display ("###############################");
		  
	           write_ptr <=0;
	           trace_ptr <=0;
	           tb_reg    <=0;
		   
	           we <=0;
          	   te <=0;
		   oe <=0;
		  
		   // initialise Contents of memory for next pseudo block
	           A0 <=4'b0000; P0 <=0;
	           A1 <=4'b1111; P1 <=0;
	           A2 <=4'b1111; P2 <=0;	     
	           A3 <=4'b1111; P3 <=0;	     
	           A4 <=4'b1111; P4 <=0;	     	     
	           A5 <=4'b1111; P5 <=0;	     	     
	           A6 <=4'b1111; P6 <=0;	     	     
	           A7 <=4'b1111; P7 <=0;	     	     
	        end	           


	     if (oe && block_count >0)
               begin
	          $display ("###############################");
	          $display ("# COND is oe && block_count >0 #");
	          $display ("###############################");
		  
	           block_count <=block_count-1;

	           we <=1;
          	   te <=0;
		   oe <=0;
		  
                   // Shift path memory contents and write next set of decisions 
                   P0   <={1'b0, P0[`T-1:1]};
                   P1   <={1'b0, P1[`T-1:1]};
                   P2   <={1'b0, P2[`T-1:1]};
                   P3   <={1'b0, P3[`T-1:1]};
                   P4   <={1'b0, P4[`T-1:1]};
                   P5   <={1'b0, P5[`T-1:1]};
                   P6   <={1'b0, P6[`T-1:1]};
                   P7   <={1'b0, P7[`T-1:1]};

	        end	           
	       
	  end // else: !if(RESET)
     end



endmodule
