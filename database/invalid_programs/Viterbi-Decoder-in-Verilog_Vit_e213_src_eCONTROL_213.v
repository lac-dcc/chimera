/*============================================================================
   module eCONTROL_213.v

   Metric Updating and Control Unit for efficient (2,1,3) 
   backward label Viterbi Decoder.

   John O'Shea, joshea@emc.com

===========================================================================*/


`timescale 1 ns/1 ns



module eCONTROL_213 (Dx, oe, le, ae, sync_error,
                     A0_out, A1_out, A2_out, A3_out, A4_out, A5_out, A6_out, A7_out,
                     A0_in,  A1_in,  A2_in,  A3_in,  A4_in,  A5_in,  A6_in,  A7_in,
                     P0_in,  P1_in,  P2_in,  P3_in,  P4_in,  P5_in,  P6_in,  P7_in,
                     seq_ready, reset, clock 
                    );


`include "params_e213.inc.v"

   output [`k-1:0] Dx;
   output          oe;
   output          le;
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
   input 	  reset;
   input 	  clock;
   
   reg [`T-1:0]   P0;
   reg [`T-1:0]   P1;
   reg [`T-1:0]   P2;
   reg [`T-1:0]   P3;
   reg [`T-1:0]   P4;
   reg [`T-1:0]   P5;
   reg [`T-1:0]   P6;
   reg [`T-1:0]   P7;

   
   reg [`W-1:0]   A0;
   reg [`W-1:0]   A1;
   reg [`W-1:0]   A2;
   reg [`W-1:0]   A3;
   reg [`W-1:0]   A4;
   reg [`W-1:0]   A5;
   reg [`W-1:0]   A6;
   reg [`W-1:0]   A7;
   
   
   reg [8:0] 	  symbol_count;
   reg [3:0] 	  write_ptr;
   reg [3:0] 	  trace_ptr;
   reg [2:0] 	  tb_reg;
   reg [2:0] 	  last_m_reg;

   //reg [19:0] 	  Dx_out_reg;
   reg [`k-1:0]   Dx;
   
   
   
   
   
   
   reg 		  le;
   reg 		  ae;
   reg 		  we;
   reg 		  te;
   reg 		  oe;
   
   

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

   wire [2:0] min_state;
   
   wire       stage_N;
   
   // Instantiate Traceback Decision Unit to determine the start state for traceback
   
   
   eTBDECISION_213 TB_1 (.best_state(min_state), 
                         .in0(A0_out), .in1(A1_out), .in2(A2_out), .in3(A3_out), 
                         .in4(A4_out), .in5(A5_out), .in6(A6_out), .in7(A7_out));
   
   
   // Instantiate Out Of Sync Error Detection Unit
   eSYNCERR_213  SE_1 (.error(sync_error), .stage(write_ptr), .we(we), .metric(min_state), .reset(reset), .clock(clock));
   
   //assign Dx = (oe) ? tb_reg[2] : 1'bz;
   
   assign A0_out = (write_ptr>0) ? A0_in:A0;
   assign A1_out = (write_ptr>0) ? A1_in:A1;
   assign A2_out = (write_ptr>0) ? A2_in:A2;
   assign A3_out = (write_ptr>0) ? A3_in:A3;
   assign A4_out = (write_ptr>0) ? A4_in:A4;
   assign A5_out = (write_ptr>0) ? A5_in:A5;
   assign A6_out = (write_ptr>0) ? A6_in:A6;
   assign A7_out = (write_ptr>0) ? A7_in:A7;

   assign stage_N = (le && symbol_count== `N-`T);

   //last m symbols capture logic
   always @(posedge clock or posedge reset)
     begin
	if (reset)
	  last_m_reg <=0;
	else
	  last_m_reg <= (stage_N) ? tb_reg:last_m_reg;
     end

   //Efficient Decoder Output Symol Logic
   always @(posedge clock or posedge reset)
     begin
	if (reset)
	  Dx<=0;
	else
	  begin
	     if (oe && symbol_count <=`N-`m)
	       Dx <= tb_reg[2];
	     else if (oe && ~symbol_count[2] &&  symbol_count[1] && ~symbol_count[0])
               Dx <= last_m_reg[2];
	     else if (oe && ~symbol_count[2] &&  symbol_count[1] &&  symbol_count[0])
               Dx <= last_m_reg[1];
	     else if (oe &&  symbol_count[2] && ~symbol_count[1] && ~symbol_count[0])
               Dx <= last_m_reg[0];
	     else
	       Dx <=1'bz;
	  end
     end

	

   // Path Memory Logic
   always @(posedge clock or posedge reset)
     begin
	if (reset)
	  begin
	     P0 <=0; P1 <=0; P2 <=0; P3 <=0; P4 <=0; P5 <=0; P6 <=0; P7 <=0;
	  end
	else
	  begin
             if (we)
               begin
                  P0   <={P0_in, P0[`T-1:1]};
                  P1   <={P1_in, P1[`T-1:1]};
                  P2   <={P2_in, P2[`T-1:1]};
                  P3   <={P3_in, P3[`T-1:1]};
                  P4   <={P4_in, P4[`T-1:1]};
                  P5   <={P5_in, P5[`T-1:1]};
                  P6   <={P6_in, P6[`T-1:1]};
                  P7   <={P7_in, P7[`T-1:1]};		  
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
	     if (NEXT_STATE==WRITE_METRICS)
	        tb_reg <=min_state;	     
	     else if (te)	     
               begin
                  case (tb_reg)
                    3'b000 : tb_reg <={P0[trace_ptr],tb_reg[2:1]};
                    3'b001 : tb_reg <={P1[trace_ptr],tb_reg[2:1]};
                    3'b010 : tb_reg <={P2[trace_ptr],tb_reg[2:1]};
                    3'b011 : tb_reg <={P3[trace_ptr],tb_reg[2:1]};
                    3'b100 : tb_reg <={P4[trace_ptr],tb_reg[2:1]};
                    3'b101 : tb_reg <={P5[trace_ptr],tb_reg[2:1]};
                    3'b110 : tb_reg <={P6[trace_ptr],tb_reg[2:1]};
                    3'b111 : tb_reg <={P7[trace_ptr],tb_reg[2:1]};
                  endcase
	       end // if (te)
	     else
	       tb_reg <=tb_reg;
	     
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
		                 write_ptr    <=`T-1;
		  		 trace_ptr    <=`T-1;
                                 NEXT_STATE   <= TRACEBACK;
                              end // case: BEST_STATE

	       //Enable Traceback Logic
               TRACEBACK:     begin
                                 if (trace_ptr >3)
                                   begin
                                      le <=0; ae <=0; we <=0; te <=1; oe <=0;
		                      trace_ptr    <=trace_ptr-1; // Point to the previous trace word
                                      NEXT_STATE   <= TRACEBACK;
                                   end	    
                                 else if (trace_ptr == 3) 
                                   begin
                                      le <=0; ae <=0; we <=0; te <=0; oe <=0;
                                      NEXT_STATE   <= OUTPUT_DX;
	                           end
                              end // case: TRACEBACK

               // Output a Decoded Symbol, Dx
               OUTPUT_DX:     begin
                                 if (symbol_count <=`T + `m)
                                   begin
                                      le <=0; ae <=0; we <=0; te <=0; oe <=1;
	                              symbol_count <=symbol_count+1;				   
                                      NEXT_STATE   <= LOAD_HD;
				   end
	                         else if (symbol_count <`N)
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
	 end // else: !if(reset)
   end // always @ (posedge clock or posedge reset)
   

endmodule
