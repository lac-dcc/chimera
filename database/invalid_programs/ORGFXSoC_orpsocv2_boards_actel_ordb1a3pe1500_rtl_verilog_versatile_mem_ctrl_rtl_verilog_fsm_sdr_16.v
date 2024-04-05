`timescale 1ns/1ns
`include "sdr_16_defines.v"
module fsm_sdr_16 (
		   adr_i, we_i, bte_i, cti_i, sel_i,
		   fifo_empty, fifo_rd_adr, fifo_rd_data, count0,
		   refresh_req, cmd_aref, cmd_read, state_idle,
		   ba, a, cmd, dqm, dq_oe,
		   sdram_burst_reading,
		   debug_state, debug_fifo_we_record,
		   sdram_clk, sdram_fifo_wr, sdram_rst
		   );

   /* Now these are defined
    parameter ba_size = 2;   
    parameter row_size = 13;
    parameter col_size = 9;   
    */
   
   input [`BA_SIZE+`ROW_SIZE+`COL_SIZE-1:0] adr_i;
   input 				 we_i;
   input [1:0] 				 bte_i;
   input [2:0] 				 cti_i;
   input [3:0] 				 sel_i;

   input 				 fifo_empty;
   output 				 fifo_rd_adr, fifo_rd_data;
   output reg 				 count0;

   input 				 refresh_req;
   output reg 				 cmd_aref; // used for rerfresh ack
   output reg 				 cmd_read; // used for ingress fifo control
   output 				 state_idle; // state=idle

   output reg [1:0] 			 ba /*synthesis syn_useioff=1 syn_allow_retiming=0 */;
   output reg [12:0] 			 a /*synthesis syn_useioff=1 syn_allow_retiming=0 */;
   output reg [2:0] 			 cmd /*synthesis syn_useioff=1 syn_allow_retiming=0 */;
   output reg [1:0] 			 dqm /*synthesis syn_useioff=1 syn_allow_retiming=0 */;
   output reg 				 dq_oe;

   output 				 sdram_burst_reading;   
   input 				 sdram_clk, sdram_fifo_wr, sdram_rst;

   output [2:0] 			 debug_state;
   output [3:0] 			 debug_fifo_we_record;

   wire [`BA_SIZE-1:0] 			 bank;
   wire [`ROW_SIZE-1:0] 			 row;
   wire [`COL_SIZE-1:0] 			 col;
   wire [12:0] 				 col_reg_a10_fix;
   reg [0:31] 				 shreg;
   wire 				 stall; // active if write burst need data

   reg [0:15] 				 fifo_sel_reg_int;
   reg [1:0] 				 fifo_sel_domain_reg_int;

   // adr_reg {ba,row,col,we}
   reg [1:0] 				 ba_reg;  
   reg [`ROW_SIZE-1:0] 			 row_reg;
   reg [`COL_SIZE-1:0] 			 col_reg;
   reg 					 we_reg;
   reg [1:0] 				 bte_reg;
   reg [2:0] 				 cti_reg;

   // to keep track of open rows per bank
   reg [`ROW_SIZE-1:0] 			 open_row[0:3];
   reg [0:3] 				 open_ba;
   wire 				 current_bank_closed, current_row_open;
   reg 					 current_bank_closed_reg, current_row_open_reg;

   parameter [2:0] classic=3'b000,
		constant=3'b001,
		increment=3'b010,
		endburst=3'b111;
   
   parameter [1:0] linear = 2'b00,
                beat4  = 2'b01,
                beat8  = 2'b10,
                beat16 = 2'b11;

   parameter [2:0] cmd_nop = 3'b111,
                cmd_act = 3'b011,
                cmd_rd  = 3'b101,
                cmd_wr  = 3'b100,
                cmd_pch = 3'b010,
                cmd_rfr = 3'b001,
                cmd_lmr = 3'b000;

   // ctrl FSM
   
/*    define instead of param, as synplify is doing weird things
 parameter [2:0] init = 3'b000,
                idle = 3'b001,
                rfr  = 3'b010,
                adr  = 3'b011,
                pch  = 3'b100,
                act  = 3'b101,
                w4d  = 3'b110,
                rw   = 3'b111;
 */
`define FSM_INIT 3'b000
`define FSM_IDLE 3'b001
`define FSM_RFR  3'b010
`define FSM_ADR  3'b011
`define FSM_PCH  3'b100
`define FSM_ACT  3'b101
`define FSM_W4D  3'b110
`define FSM_RW   3'b111
   
   reg [2:0] 				 state, next;

   assign debug_state = state;

   function [12:0] a10_fix;
      input [`COL_SIZE-1:0] 		 a;
      integer 				 i;
      begin
	 for (i=0;i<13;i=i+1) begin
            if (i<10)
              if (i<`COL_SIZE)
                a10_fix[i] = a[i];
              else
                a10_fix[i] = 1'b0;
            else if (i==10)
              a10_fix[i] = 1'b0;
            else
              if (i<`COL_SIZE)
                a10_fix[i] = a[i-1];
              else
                a10_fix[i] = 1'b0;
	 end
      end
   endfunction


   assign {bank,row,col} = adr_i;

   always @ (posedge sdram_clk or posedge sdram_rst)
     if (sdram_rst)
       state <= `FSM_INIT;
     else
       state <= next;
   
   always @*
     begin
	next = 3'bx;
	case (state)
	  `FSM_INIT:
	    if (shreg[31])          
	      next = `FSM_IDLE;
            else                    
	      next = `FSM_INIT;
	  `FSM_IDLE:   
	    if (refresh_req)        
	      next = `FSM_RFR;
            else if (!shreg[0] & !fifo_empty)   
	      next = `FSM_ADR;
            else                    
	      next = `FSM_IDLE;
	  `FSM_RFR: 
	    if (shreg[5])           
	      next = `FSM_IDLE;
            else                    
	      next = `FSM_RFR;
	  `FSM_ADR:
	    if (shreg[5])
	      begin
		 if (current_bank_closed_reg)   
		   next = `FSM_ACT;
		 else if (current_row_open_reg)
		   next = (we_reg) ?  `FSM_W4D : `FSM_RW;
		 else 		                     
		   next = `FSM_PCH;
	      end
            else                                            
	      next = `FSM_ADR;
	  `FSM_PCH:    
	    if (shreg[1])         
	      next = `FSM_ACT;
            else                    
	      next = `FSM_PCH;
	  `FSM_ACT:
	    if (shreg[2])
	      begin
`ifdef SLOW_WB_CLOCK
		 // Automatiacally go to wait for data if burst writing
		 if ((|bte_reg) & we_reg & cti_reg==increment) 
		   next = `FSM_W4D;
		 else if ((!fifo_empty | !we_reg)) 
		   next = `FSM_RW;
`else
		 if ((!fifo_empty | !we_reg)) 
		   next = `FSM_RW;
`endif
		 else if (fifo_empty)         
		   next = `FSM_W4D;
	      end
            else                                    
	      next = `FSM_ACT;
`ifdef SLOW_WB_CLOCK
	  // Add some wait here if bursting and the wishbone clock is slow
	  `FSM_W4D:    
	    if (!fifo_empty & ((cti_reg!=increment)|(cti_reg==increment /*& bte_reg==beat4*/  & shreg[14])))
	      next = `FSM_RW;
`else
	  `FSM_W4D:    
	    if (!fifo_empty) 
	      next = `FSM_RW;
`endif	  
            else             
	      next = `FSM_W4D;
	  `FSM_RW:     
	    if ((bte_reg==linear | !(cti_reg==increment)) & shreg[1])
              next = `FSM_IDLE;
            else if (bte_reg==beat4 & shreg[7])
              next = `FSM_IDLE;
`ifdef BEAT8
            else if (bte_reg==beat8 & shreg[15])
              next = `FSM_IDLE;
`endif
`ifdef BEAT16
            else if (bte_reg==beat16 & shreg[31])
              next = `FSM_IDLE;
`endif
            else
              next = `FSM_RW;
	endcase
     end // always @ *
   

   // active if write burst need data
   assign stall = state==`FSM_RW & next==`FSM_RW & fifo_empty & count0 & we_reg;

   // counter
   always @ (posedge sdram_clk or posedge sdram_rst)
     begin
	if (sdram_rst) begin
           shreg   <= {1'b1,{31{1'b0}}};
           count0  <= 1'b0;
	end else
          if (state!=next) begin
             shreg   <= {1'b1,{31{1'b0}}};
             count0  <= 1'b0;
          end else 
            if (~stall) begin
               shreg   <= shreg >> 1;
               count0  <= ~count0;
            end
     end

   // ba, a, cmd
   // col_reg_a10 has bit [10] set to zero to disable auto precharge
   assign col_reg_a10_fix = a10_fix(col_reg);

   // outputs dependent on state vector
   always @ (posedge sdram_clk or posedge sdram_rst)
     begin
	if (sdram_rst) begin
           {ba,a,cmd} <= {2'b00,13'd0,cmd_nop};
           dqm <= 2'b11;
           cmd_aref <= 1'b0;
           cmd_read <= 1'b0;
           dq_oe <= 1'b0;
           {open_ba,open_row[0],open_row[1],open_row[2],open_row[3]} <= 
                                                  {4'b0000,{`ROW_SIZE*4{1'b0}}};
           {ba_reg,row_reg,col_reg,we_reg,cti_reg,bte_reg} <= 
                     {2'b00, {`ROW_SIZE{1'b0}}, {`COL_SIZE{1'b0}}, 1'b0,3'b000, 2'b00 };
	end else begin
           {ba,a,cmd} <= {2'b00,13'd0,cmd_nop};
           dqm <= 2'b11;
           cmd_aref <= 1'b0;
           cmd_read <= 1'b0;
           dq_oe <= 1'b0;
           case (state)
             `FSM_INIT:
               if (shreg[3]) begin
                  {ba,a,cmd} <= {2'b00, 13'b0010000000000, cmd_pch};
                  open_ba[ba_reg] <= 1'b0;
               end else if (shreg[7] | shreg[19])
                 {ba,a,cmd,cmd_aref} <= {2'b00, 13'd0, cmd_rfr,1'b1};
               else if (shreg[31])
                 {ba,a,cmd} <= 
		  {2'b00,3'b000,`INIT_WB,2'b00,`INIT_CL,`INIT_BT,`INIT_BL, cmd_lmr};
             `FSM_RFR:
               if (shreg[0]) begin
                  {ba,a,cmd} <= {2'b00, 13'b0010000000000, cmd_pch};
                  open_ba <= 4'b0000;
               end else if (shreg[2])
                 {ba,a,cmd,cmd_aref} <= {2'b00, 13'd0, cmd_rfr,1'b1};
             `FSM_ADR:
               if (shreg[4])
                 {ba_reg,row_reg,col_reg,we_reg,cti_reg,bte_reg} <= 
		                                {bank,row,col,we_i,cti_i,bte_i};
             `FSM_PCH:
               if (shreg[0]) begin
                  {ba,a,cmd} <= {ba_reg,13'd0,cmd_pch};
                  //open_ba <= 4'b0000;
		  open_ba[ba_reg] <= 1'b0;
               end
             `FSM_ACT:
               if (shreg[0]) begin
                  {ba,a,cmd} <= {ba_reg,(13'd0 | row_reg),cmd_act};
                  {open_ba[ba_reg],open_row[ba_reg]} <= {1'b1,row_reg};
               end
             `FSM_RW:
               begin
                  if (we_reg & !count0)
                    cmd <= cmd_wr;
                  else if (!count0)
                    {cmd,cmd_read} <= {cmd_rd,1'b1};
                  else
                    cmd <= cmd_nop;
                  if (we_reg)
		    begin
		       dqm <= count0 ? ~sel_i[1:0] : ~sel_i[3:2];
		    end
                  else
                    dqm <= 2'b00;
                  //if (we_reg)
                  dq_oe <= we_reg;//1'b1;
                  if (!stall)
		    begin
		       if (cti_reg==increment)
			 case (bte_reg)
			   linear: {ba,a} <= {ba_reg,col_reg_a10_fix};
			   beat4:  {ba,a,col_reg[2:0]} <= 
				  {ba_reg,col_reg_a10_fix, col_reg[2:0] + 3'd1};
          `ifdef BEAT8
			   beat8:  {ba,a,col_reg[3:0]} <= 
				  {ba_reg,col_reg_a10_fix, col_reg[3:0] + 4'd1};
          `endif
          `ifdef BEAT16
			   beat16: {ba,a,col_reg[4:0]} <= 
				  {ba_reg,col_reg_a10_fix, col_reg[4:0] + 5'd1};
          `endif
			 endcase // case (bte_reg)
		       else
			 {ba,a} <= {ba_reg,col_reg_a10_fix};
		       
		    end // if (!stall)
               end
			   endcase
	end
     end
			   
   reg fifo_read_data_en;
   always @(posedge sdram_clk)
     if (sdram_rst)
       fifo_read_data_en <= 1;
     else if (next==`FSM_RW)
       fifo_read_data_en <= ~fifo_read_data_en;
     else
       fifo_read_data_en <= 1;

   reg [3:0] beat4_data_read_limiter; // Use this to record how many times we've pulsed fifo_rd_data
   // Only 3 bits, becuase we're looking at when fifo_read_data_en goes low - should only happen 3
   // times for a 4-beat burst
   always @(posedge sdram_clk)
     if (sdram_rst)
       beat4_data_read_limiter <= 0;
     else if(state==`FSM_ADR)
       beat4_data_read_limiter <= 0;
     else if (!fifo_read_data_en)
       beat4_data_read_limiter <= {beat4_data_read_limiter[2:0],1'b1};
   
   

   // rd_adr goes high when next adr is fetched from sync RAM and during write burst
   assign fifo_rd_adr  = state==`FSM_ADR & shreg[1];

   assign fifo_rd_data = (((state!=`FSM_RW & next==`FSM_RW)|(state==`FSM_RW & (cti_reg==increment && bte_reg==beat4 & fifo_read_data_en & !(&beat4_data_read_limiter)))) & we_reg & !fifo_empty);
   
   /*
   assign fifo_rd_data = ((state==`FSM_RW & next==`FSM_RW) & 
			  we_reg & !count0 & !fifo_empty);
*/
   assign state_idle = (state==`FSM_IDLE);

   // bank and row open ?
   assign current_bank_closed = !(open_ba[bank]);
   assign current_row_open = open_row[bank]==row;

   always @ (posedge sdram_clk or posedge sdram_rst)
     if (sdram_rst)
       {current_bank_closed_reg, current_row_open_reg} <= {1'b1, 1'b0};
     else
       //if (state==adr & counter[1:0]==2'b10)
       {current_bank_closed_reg, current_row_open_reg} <= 
				        {current_bank_closed, current_row_open};

   // Record the number of write enables going to INGRESS fifo (ie. that we 
   // generate when we're reading) - this makes sure we keep track of when a
   // burst read is in progress, and we can signal the wishbone bus to wait
   // for this data to be put into the FIFO before it'll empty it when it's
   // had a terminated burst transfer.
   reg [3:0] fifo_we_record;
   assign debug_fifo_we_record = fifo_we_record;   
   always @(posedge sdram_clk) 
     if (sdram_rst)
       fifo_we_record <= 0;
     else if (next==`FSM_RW & ((state==`FSM_ADR)|(state==`FSM_ACT)) & 
	      cti_reg==increment & (bte_reg==beat4) & !we_reg)
       fifo_we_record <= 4'b0001;
     else if (sdram_fifo_wr)
       fifo_we_record <= {fifo_we_record[2:0],1'b0};
`ifdef SDRAM_WB_SAME_CLOCKS   
   assign sdram_burst_reading = |fifo_we_record;
`else   
   assign sdram_burst_reading = 0;
`endif
   

endmodule
