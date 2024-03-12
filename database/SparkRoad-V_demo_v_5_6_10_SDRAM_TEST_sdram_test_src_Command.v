


module command(CLK, RESET_N, SADDR, NOP, READA, WRITEA, PRECHARGE, LOAD_MODE, SC_CL, SC_RC, SC_RRD, SC_PM, SC_BL, CM_ACK, OE, SA, BA, CS_N, CKE, RAS_N, CAS_N, WE_N);
   
   parameter           ASIZE = 21;
   parameter           DSIZE = 32;
   parameter           ROWSIZE = 11;
   parameter           COLSIZE = 8;
   parameter           BANKSIZE = 2;
   parameter           ROWSTART = 8;
   parameter           COLSTART = 0;
   parameter           BANKSTART = 19;
   
   input               CLK;
   input               RESET_N;
   input [ASIZE-1:0]   SADDR;
   input               NOP;
   input               READA;
   input               WRITEA;
   input               PRECHARGE;
   input               LOAD_MODE;
   input [1:0]         SC_CL;
   input [1:0]         SC_RC;
   input [3:0]         SC_RRD;
   input               SC_PM;
   input [3:0]         SC_BL;
   output              CM_ACK;
   reg                 CM_ACK;
   output              OE;
   reg                 OE;
   output [10:0]       SA;
   reg [10:0]          SA;
   output [1:0]        BA;
   reg [1:0]           BA;
   output              CS_N;
   reg                 CS_N;
   output              CKE;
   reg                 CKE;
   output              RAS_N;
   reg                 RAS_N;
   output              CAS_N;
   reg                 CAS_N;
   output              WE_N;
   reg                 WE_N;
   
   
   reg                 do_reada;
   reg                 do_writea;
   reg                 do_writea1;
   reg                 do_precharge;
   reg                 do_load_mode;
   reg                 command_done;
   reg [7:0]           command_delay;
   reg [3:0]           rw_shift;
   wire                do_act;
   reg                 rw_flag;
   reg                 do_rw;
   reg                 oe1;
   reg [3:0]           rp_shift;
   reg                 rp_done;
   wire [ROWSIZE-1:0]  rowaddr;
   wire [COLSIZE-1:0]  coladdr;
   wire [BANKSIZE-1:0] bankaddr;
	reg                 bankclose;
   
   wire                REF_REQ_int;
   
   assign rowaddr = SADDR[ROWSTART + ROWSIZE - 1:ROWSTART];
   assign coladdr = SADDR[COLSTART + COLSIZE - 1:COLSTART];
   assign bankaddr = SADDR[BANKSTART + BANKSIZE - 1:BANKSTART];
   
   
   always @(posedge CLK or negedge RESET_N)
      if (RESET_N == 1'b0)
      begin
         do_reada <= 1'b0;
         do_writea <= 1'b0;
         do_precharge <= 1'b0;
         do_load_mode <= 1'b0;
         command_done <= 1'b0;
         command_delay <= {8{1'b0}};
         rw_flag <= 1'b0;
         rp_shift <= {4{1'b0}};
         rp_done <= 1'b0;
         do_writea1 <= 1'b0;
      end
      else 
      begin
         if ((READA == 1'b1) & (command_done == 1'b0) & (do_reada == 1'b0) & (rp_done == 1'b0) )
            do_reada <= 1'b1;
         else
            do_reada <= 1'b0;
         
         if ((WRITEA == 1'b1) & (command_done == 1'b0) & (do_writea == 1'b0) & (rp_done == 1'b0) )
         begin
            do_writea <= 1'b1;
            do_writea1 <= 1'b1;
         end
         else
         begin
            do_writea <= 1'b0;
            do_writea1 <= 1'b0;
         end
         
         if ((PRECHARGE == 1'b1) & (command_done == 1'b0) & (do_precharge == 1'b0))
            do_precharge <= 1'b1;
         else
            do_precharge <= 1'b0;
         
         if ((LOAD_MODE == 1'b1) & (command_done == 1'b0) & (do_load_mode == 1'b0))
            do_load_mode <= 1'b1;
         else
            do_load_mode <= 1'b0;
         
         if ( (do_reada == 1'b1) | (do_writea == 1'b1) | (do_precharge == 1'b1) | (do_load_mode == 1'b1))
         begin
            command_delay <= 8'b11111111;
            command_done <= 1'b1;
            rw_flag <= do_reada;
         end
         else
         begin
            
            command_done <= command_delay[0];
            command_delay[6:0] <= command_delay[7:1];
            command_delay[7] <= 1'b0;
         end
         
         if (command_delay[0] == 1'b0 & command_done == 1'b1)
         begin
            rp_shift <= 4'b1111;        //only need three cycle to close row 
            rp_done <= 1'b0;
         end
         else
         begin
            rp_done <= rp_shift[0];
            rp_shift[2:0] <= rp_shift[3:1];
            rp_shift[3] <= 1'b0;
         end
      end
   
   
   always @(posedge CLK or negedge RESET_N)
      if (RESET_N == 1'b0)
      begin
         oe1 <= 1'b0;
         OE <= 1'b0;
      end
      else 
      begin
            if (do_writea1 == 1'b1)
               oe1 <= 1'b1;
            else if (do_precharge == 1'b1 | do_reada == 1'b1 )
               oe1 <= 1'b0;
            OE <= oe1;
      end
   
 //generate row active to column active delay   
   always @(posedge CLK or negedge RESET_N)
      if (RESET_N == 1'b0)
      begin
         rw_shift <= {4{1'b0}};
         do_rw <= 1'b0;
      end
      else 
      begin
         if ((do_reada == 1'b1) | (do_writea == 1'b1))
         begin
            if (SC_RC == 2'b01)
               do_rw <= 1'b1;
            else if (SC_RC == 2'b10)
               rw_shift <= 4'b0001;
            else if (SC_RC == 2'b11)
               rw_shift <= 4'b0010;
         end
         else
         begin
            rw_shift[2:0] <= rw_shift[3:1];
            rw_shift[3] <= 1'b0;
            do_rw <= rw_shift[0];
         end
      end
   
   
   always @(posedge CLK or negedge RESET_N)
      if (RESET_N == 1'b0)
      begin
         CM_ACK <= 1'b0;
      end
      else 
      begin
          if ( (do_reada == 1'b1) | (do_writea == 1'b1) | (do_precharge == 1'b1) | (do_load_mode == 1'b1))
            CM_ACK <= 1'b1;
         else
         begin
            CM_ACK <= 1'b0;
         end
      end
   
   
   always @(posedge CLK or negedge RESET_N)
      if (RESET_N == 1'b0)
      begin
         SA <= {11{1'b0}};
         BA <= {2{1'b0}};
         CS_N <= 1'b1;
         RAS_N <= 1'b1;
         CAS_N <= 1'b1;
         WE_N <= 1'b1;
         CKE <= 1'b0;
      end
      
      else 
      begin
         CKE <= 1'b1;
			CS_N <= 1'b0;
         
         if (do_writea == 1'b1 | do_reada == 1'b1)
            SA[ROWSIZE - 1:0] <= rowaddr;
         else
            SA[COLSIZE - 1:0] <= coladdr;
			if (bankclose)
            SA[10] <= 1'b0;
			if (do_load_mode == 1'b1)begin    // enable the single address write and page read 
				SA[9]  <= SADDR[9] ; 
				SA[10] <= 1'b1;
			end
         if (do_load_mode == 1'b1)
            BA <= 2'b00;
         else
            BA <= bankaddr[1:0];
         
         if ((do_precharge==1'b1) && ((oe1 == 1'b1) || (rw_flag == 1'b1))) begin      // burst terminate if write is active
            RAS_N <= 1'b1;
            CAS_N <= 1'b1;
            WE_N  <= 1'b0;
				bankclose <= 1'b1;
			end 
         else if ((do_precharge == 1'b1) || (bankclose == 1'b1))
         begin
            RAS_N <= 1'b0;
            CAS_N <= 1'b1;
            WE_N <= 1'b0;
				bankclose <= 1'b0;
         end
         else if (do_load_mode == 1'b1)
         begin
            RAS_N <= 1'b0;
            CAS_N <= 1'b0;
            WE_N <= 1'b0;
         end
         else if (do_reada == 1'b1 | do_writea == 1'b1)
         begin
            RAS_N <= 1'b0;
            CAS_N <= 1'b1;
            WE_N <= 1'b1;
         end
         else if (do_rw == 1'b1)
         begin
            RAS_N <= 1'b1;
            CAS_N <= 1'b0;
            WE_N <= rw_flag;
         end
         else
         begin
            RAS_N <= 1'b1;
            CAS_N <= 1'b1;
            WE_N <= 1'b1;
         end
      end
   
endmodule
