/*============================================================================
   module bCONTROL_322.v

   Metric Updating and Control Unit for (3,2,2) backward label  Viterbi Decoder.

===========================================================================*/


`timescale 1 ns/1 ns

module bCONTROL_322 (Dx, oe, le, ae, sync_error,
                     A0_out, A1_out, A2_out, A3_out, A4_out, A5_out, A6_out, A7_out,
                     A0_in,  A1_in,  A2_in,  A3_in,  A4_in,  A5_in,  A6_in,  A7_in,
                     P0_in,  P1_in,  P2_in,  P3_in,  P4_in,  P5_in,  P6_in,  P7_in,
		     seq_ready, reset, clock 
                    );


`include "params_b322.inc"

   output [`k-1:0] Dx;
   output          oe;
   output 	   le;
   output          ae;
   output          sync_error;
   
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
   input 	  seq_ready;
   
		   
   input reset;
   input clock;

   reg [`T-1:0] P0_1, P0_0;
   reg [`T-1:0] P1_1, P1_0;
   reg [`T-1:0] P2_1, P2_0;   
   reg [`T-1:0] P3_1, P3_0;
   reg [`T-1:0] P4_1, P4_0;
   reg [`T-1:0] P5_1, P5_0;
   reg [`T-1:0] P6_1, P6_0;
   reg [`T-1:0] P7_1, P7_0;

   
   reg [`W-1:0] A0;
   reg [`W-1:0] A1;
   reg [`W-1:0] A2;
   reg [`W-1:0] A3;
   reg [`W-1:0] A4;
   reg [`W-1:0] A5;
   reg [`W-1:0] A6;
   reg [`W-1:0] A7;

   
   reg [8:0] 	symbol_count;
   reg [3:0] 	write_ptr;
   reg [3:0] 	trace_ptr;
   reg [2:0] 	tb_reg;
   
   reg 		le;
   reg          ae;
   reg 		we;
   reg 		te;
   reg 		oe;   

   wire [2:0] min_state;
   

   // Define One-Hot Encoded States

   parameter [6:0] //synopsys enum STATE_TYPE
                   IDLE           =7'b0000001,
                   LOAD_HD        =7'b0000010,
                   ADD_HD         =7'b0000100,
                   WRITE_METRICS  =7'b0001000,
                   BEST_STATE     =7'b0010000,
                   TRACEBACK      =7'b0100000,
		   OUTPUT_DX      =7'b1000000;
   

   reg [6:0] NEXT_STATE;


   // Instantiate Traceback Decision Unit to determine the start state for traceback
   
   bTBDECISION_322 TB_1 (.best_state(min_state), 
                         .in0(A0_out), .in1(A1_out), .in2(A2_out), .in3(A3_out), 
                         .in4(A4_out), .in5(A5_out), .in6(A6_out), .in7(A7_out));
   
   // Instantiate Out Of Sync Error Detection Unit
   bSYNCERR_322  SE_1 (.error(error), .stage(write_ptr), .we(we), .metric(min_state), .reset(reset), .clock(clock));
   
   assign Dx[1] = (oe) ? tb_reg[1] : 1'bz;
   assign Dx[0] = (oe) ? tb_reg[0] : 1'bz;
   
   assign A0_out = (write_ptr>0) ? A0_in:A0;
   assign A1_out = (write_ptr>0) ? A1_in:A1;
   assign A2_out = (write_ptr>0) ? A2_in:A2;
   assign A3_out = (write_ptr>0) ? A3_in:A3;
   assign A4_out = (write_ptr>0) ? A4_in:A4;
   assign A5_out = (write_ptr>0) ? A5_in:A5;
   assign A6_out = (write_ptr>0) ? A6_in:A6;
   assign A7_out = (write_ptr>0) ? A7_in:A7;


   
   // Path Memory Logic
   always @(posedge clock or posedge reset)
     begin
	if (reset)
	  begin
	     P0_0 <=0; P1_0 <=0; P2_0 <=0; P3_0 <=0; P4_0 <=0; P5_0 <=0; P6_0 <=0; P7_0 <=0;
	     P0_1 <=0; P1_1 <=0; P2_1 <=0; P3_1 <=0; P4_1 <=0; P5_1 <=0; P6_1 <=0; P7_1 <=0;
	  end
	else
	  begin
             if (we)
               begin
                  P0_0[write_ptr] <=P0_in[0]; P1_0[write_ptr] <=P1_in[0]; P2_0[write_ptr] <=P2_in[0]; P3_0[write_ptr] <=P3_in[0]; 
                  P4_0[write_ptr] <=P4_in[0]; P5_0[write_ptr] <=P5_in[0]; P6_0[write_ptr] <=P6_in[0]; P7_0[write_ptr] <=P7_in[0];
                  P0_1[write_ptr] <=P0_in[1]; P1_1[write_ptr] <=P1_in[1]; P2_1[write_ptr] <=P2_in[1]; P3_1[write_ptr] <=P3_in[1]; 
                  P4_1[write_ptr] <=P4_in[1]; P5_1[write_ptr] <=P5_in[1]; P6_1[write_ptr] <=P6_in[1]; P7_1[write_ptr] <=P7_in[1];
               end
	     if (oe)
	       begin
	          // Shift path memory contents to make room for next set of decisions
                  P0_0   <={P0_in[0], P0_0[`T-1:1]};
                  P0_1   <={P0_in[1], P0_1[`T-1:1]};
                  P1_0   <={P1_in[0], P1_0[`T-1:1]};
                  P1_1   <={P1_in[1], P1_1[`T-1:1]};
                  P2_0   <={P2_in[0], P2_0[`T-1:1]};
                  P2_1   <={P2_in[1], P2_1[`T-1:1]};
                  P3_0   <={P3_in[0], P3_0[`T-1:1]};
                  P3_1   <={P3_in[1], P3_1[`T-1:1]};
                  P4_0   <={P4_in[0], P4_0[`T-1:1]};
                  P4_1   <={P4_in[1], P4_1[`T-1:1]};
                  P5_0   <={P5_in[0], P5_0[`T-1:1]};
                  P5_1   <={P5_in[1], P5_1[`T-1:1]};
                  P6_0   <={P6_in[0], P6_0[`T-1:1]};
                  P6_1   <={P6_in[1], P6_1[`T-1:1]};
                  P7_0   <={P7_in[0], P7_0[`T-1:1]};
                  P7_1   <={P7_in[1], P7_1[`T-1:1]};
	       end
	  end
     end
   
   // Partial Path Metric Logic
   always @(posedge clock or posedge reset)
     begin
	if (reset)
	  begin
	     A0 <=0;       A1 <=4'b1111; A2 <=4'b1111; A3 <=4'b1111; 
             A4 <=4'b1111; A5 <=4'b1111; A6 <=4'b1111; A7 <=4'b1111;
	  end
	else
	  begin
             if (we)
               begin
                  A0 <=A0_in; A1 <=A1_in; A2 <=A2_in; A3 <=A3_in; 
                  A4 <=A4_in; A5 <=A5_in; A6 <=A6_in; A7 <=A7_in;
               end
	  end
     end

   // Traceback Logic
   always @(posedge clock or posedge reset)
     begin
	if (reset)
	  tb_reg <=0;
	else
	  begin
             if (te)	       
               begin
                  case (tb_reg)
                    3'b000 : tb_reg <={P0_1[trace_ptr],tb_reg[2],P0_0[trace_ptr]};
                    3'b001 : tb_reg <={P1_1[trace_ptr],tb_reg[2],P1_0[trace_ptr]};
                    3'b010 : tb_reg <={P2_1[trace_ptr],tb_reg[2],P2_0[trace_ptr]};
                    3'b011 : tb_reg <={P3_1[trace_ptr],tb_reg[2],P3_0[trace_ptr]};
                    3'b100 : tb_reg <={P4_1[trace_ptr],tb_reg[2],P4_0[trace_ptr]};
                    3'b101 : tb_reg <={P5_1[trace_ptr],tb_reg[2],P5_0[trace_ptr]};
                    3'b110 : tb_reg <={P6_1[trace_ptr],tb_reg[2],P6_0[trace_ptr]};
                    3'b111 : tb_reg <={P7_1[trace_ptr],tb_reg[2],P7_0[trace_ptr]};
                  endcase
	       end
	  end
     end

   // Viterbi Decoder State Machine
   always @ (posedge clock or posedge reset)
     begin
        if (reset)
          begin
             le <=0; ae <=0; we <=0; te <=0; oe <=0;
	     write_ptr    <=0;
	     trace_ptr    <=0;
	     symbol_count <=0;
             NEXT_STATE   <= IDLE;
          end
        else
          begin
             case(NEXT_STATE) //synopsys full_case parallel_case

               IDLE:      begin
		             if (seq_ready)
			       begin
                                  le <=0; ae <=0; we <=0; te <=0; oe <=0;
                                  NEXT_STATE <=LOAD_HD;
			       end
		             else
			       NEXT_STATE <=IDLE;
                           end // case: IDLE

               // Load Hamming Distance Branch Metrics in ACSU
               LOAD_HD:    begin
                              le <=1; ae <=0; we <=0; te <=0; oe <=0;
                              NEXT_STATE   <= ADD_HD;
                           end // case: LOAD_HD

               // Add Partial Path Metrics to Branch Metrics
               ADD_HD:        begin
                              le <=0; ae <=1; we <=0; te <=0; oe <=0;
                              NEXT_STATE   <= WRITE_METRICS;
                           end // case: ADD_HD

	       // Write Surviving Metrics to Memory
               WRITE_METRICS: begin

                                 if (write_ptr < `T-1)
                                   begin
                                      le <=0; ae <=0; we <=1; te <=0; oe <=0;
				      write_ptr <=write_ptr+1;
                                      NEXT_STATE   <= LOAD_HD;
                                   end
                                else if (write_ptr == `T-1)
                                   begin
				      le <=0; ae <=0; we <=1; te <=0; oe <=0;
				      write_ptr <=write_ptr+1;
                                      NEXT_STATE   <= BEST_STATE;
			           end
                              end // case: WRITE_METRICS

               // Select Trellis State with Minimum Metric
               BEST_STATE:    begin
                                 le <=0; ae <=0; we <=0; te <=0; oe <=0;
		                 tb_reg <=min_state;
		                 write_ptr <=`T-1;
		                 trace_ptr <=`T-1;
		                 NEXT_STATE   <= TRACEBACK;
                              end // case: BEST_STATE



	       //Enable Traceback Logic
               TRACEBACK:     begin
                                 if (trace_ptr >2)
                                   begin
                                      le <=0; ae <=0; we <=0; te <=1; oe <=0;
				      trace_ptr <=trace_ptr-1;
                                      NEXT_STATE   <= TRACEBACK;
                                   end	    
                                 else if (trace_ptr ==2) 
                                   begin
                                      le <=0; ae <=0; we <=0; te <=0; oe <=0;
                                      NEXT_STATE   <= OUTPUT_DX;
	                           end
                              end // case: TRACEBACK

               // Output a Decoded Symbol, Dx
               OUTPUT_DX:     begin
                                 if (symbol_count <`T + `m)
                                   begin
                                      le <=0; ae <=0; we <=0; te <=0; oe <=1;
	                              symbol_count <=symbol_count+1;				   
                                      NEXT_STATE   <= LOAD_HD;
				   end
	                         else if (symbol_count <`N +`m)
				   begin
				      le <=0; ae <=0; we <=0; te <=0; oe <=1;
                                      symbol_count  <=symbol_count+1;
                                      NEXT_STATE   <= BEST_STATE;
				   end
		                 else
				   begin
				      le <=0; ae <=0; we <=0; te <=0; oe <=0;
                                      NEXT_STATE   <= IDLE;
				   end
                              end // case: OUTPUT_DX
	    endcase // case(NEXT_STATE)
	 end
   end
   

endmodule
