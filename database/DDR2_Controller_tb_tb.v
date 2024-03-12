/////////////////////////////////////////////////////////////////
// Filename        : tb.v									   //
// Description     : EE577b DDR2 Controller Testbench		   //
// Author          : Dr. Rashed Z. Bhatti					   //
// Created On      : Thu Oct 23 23:14:54 2008				   //
// Last Modified   : March 15th 2009
/////////////////////////////////////////////////////////////////
// The DDR2 model is provided by Denali Software Inc
// -------------------------------------------------
// Following files are required for simulations
// mt47h32m16_37e.v
// mt47h32m16_37e.soma
//
// This Testbench uses Chris Spear's file IO PLI
// ---------------------------------------------
// You need fileio.so file in your simulation directory
// Add the following switch to the ncelab
// -loadpli1 $(PWD)/fileio.so:bstrap
//
// User defined Test Pattern is fetched from IPNUT_FILE_NAME
// The file should have data in five columns
// WaitForCycles[decimal]  Cmd[decimal]  Address[hex] Data[hex]   Read[decimal]
// 
// Sample Test Pattern File
// 0   1     1BABAFE  CAFE   0
// 0   1     1BABAFE  D0C0   0 
// 0   2     1BABAFE  CAFE   0
// 0   3     1BABAFE  CAFE   0
// 10  0           0     0   1
// 0   6     1BABAFE  BABA   1
// 0   0     1BABAFE  CAFE   1

// The testbench provides 500MHz clock
// The testbench provides an active low reset
// After reset a one cycle long initddr signal is issued
// Testbench then waits for the ready signal to come out
// After ready becomes high the testbench fetches a line from the Test Pattern File every cycles,
// waits for "WaitForCycles" (given in the first column of the fetched line) and then put the 
// Cmd , Addr, Data and Read to the ports of the DDR2 controller
// If the WaitForCycles = 0 then the values are applied in the same cycles

// Notes:
// (1) Test Pattern file should not have text header of any kind
// (2) Test Pattern file should not have any blank lines


`timescale  1ns/10ps
`include "/auto/home-scf-06/ee577/design_pdk/osu_stdcells/lib/tsmc018/lib/osu018_stdcells.v"

module tb();
`define IPNUT_FILE_NAME "ddr2_test_pattern.dat"
`define TRACE_FILE_NAME "ddr2_test.trc"  //Not used 
`define DUMP_FILE_NAME  "ddr2_out.dump"
`define EOF 32'hFFFF_FFFF
`define NULL 0  

   wire [15:0]			dout;
   wire [24:0] 			raddr;
   wire [12:0] 			c0_a_pad;				
   wire [1:0] 			c0_ba_pad;				
   wire					c0_casbar_pad;			
   wire					c0_ckbar_pad;			
   wire					c0_cke_pad;				
   wire					c0_ck_pad;				
   wire					c0_csbar_pad;			
   wire [1:0] 			c0_dm_pad;				
   wire [1:0] 			c0_dqsbar_pad;			
   wire [1:0] 			c0_dqs_pad;				
   wire [15:0] 			c0_dq_pad;				
   wire					c0_odt_pad;				
   wire					c0_rasbar_pad;			
   wire					c0_webar_pad;					
   wire [6:0] 			fillcount;				
   wire					notfull;				
   wire					ready;					
   wire					validout;	


   reg [1:0] 			sz;
   reg [2:0] 			op;
   reg [24:0] 			addr;
   reg					clk;
   reg [2:0] 			cmd;
   reg [15:0] 			din;
   reg 					fetching;
   reg					initddr;
   reg					reset;
   
   wire 				DataFifoHasSpace, CmdFifoHasSpace;
   reg 					Go;
   integer 				c, r, fin, fout_trc, f_dump1, cycle_counter, start_count, end_count;


   integer 				WaitCycles;
   reg [2:0] 			Cmd;
   reg [1:0] 			Sz;
   reg [2:0] 			Op;
   reg [24:0] 			Addr;
   reg [15:0] 			Data;
   reg 					Fetching;


   // Control variables
   reg 					test_pattern_injection_done, waiting, BlkWriteInProgress ;
   event 				fetchNextTestPattern;
   event 				ApplyTestPattern;
   integer 				waitCount, blkWriteCount;
   
   assign 				DataFifoHasSpace = (fillcount <= 63) ? 1 : 0;
   assign 				CmdFifoHasSpace  = notfull;

   assign 				#0.1 non_read_cmd_consumed =((DataFifoHasSpace == 1) && (CmdFifoHasSpace == 1) && (Cmd != 1) && (Cmd !=3) && (Cmd != 0) && (Cmd != 7));
   assign 				#0.1 read_cmd_consumed = ((CmdFifoHasSpace == 1) && ((Cmd == 1) || (Cmd ==3)));
   assign 				#0.1 nop_consumed = ((Cmd == 0) || (Cmd == 7));
	 
   // define clocks
   initial clk = 0;
   always #1 clk = ~clk; // 500MHz
   

   initial
	 begin
		test_pattern_injection_done = 1; // keep the testpattern activity suppressed
		cycle_counter = 0;
		reset = 1;
		clk = 0;
		initddr = 0;
		addr     <= 0;
		cmd      <= 0;
		sz       <=0;
		op       <=0;
		din      <= 0;
		// Initialize controll variables
		waiting = 0;
		BlkWriteInProgress = 0;
  		waitCount = 0;
		blkWriteCount = 0;
		repeat (5) @(negedge clk);
		reset = 0;
		@(negedge clk);
		initddr  = 1;
		@(negedge clk);
		initddr  = 0;
		// Now wait for DDR to be ready
		$display("MSG: Waiting for DDR2 to become ready");
		wait (ready);
		// Open Test Pattern File
		fin = $fopenr(`IPNUT_FILE_NAME);
        if (fin == `NULL) // If error opening file
          begin
             $display("*** ERROR *** Could not open the file %s\n", `IPNUT_FILE_NAME);
             $finish;
          end
        // Check for end of file eof;
        c = $fgetc(fin);
        if (c == `EOF)
		  begin
			 $display(" *** ERROR *** %s is an empty file\n", `IPNUT_FILE_NAME);
			 $finish;
		  end
		// Open File to write the simulation trace 
		fout_trc = $fopenw(`TRACE_FILE_NAME);
        if (fout_trc == `NULL) // If error opening file
          begin
             $display("*** ERROR *** Could not open the file %s\n", `TRACE_FILE_NAME );
             $finish;
          end
		// Start the test pattern
		@(posedge clk);
		-> fetchNextTestPattern;
		@ (posedge test_pattern_injection_done);
		$display("MSG: All test patterns are successfully applied");
		$display("MSG: Now waiting to let the DDR2 controller drain out");
		repeat (1500) @(negedge clk);
		// Have the start_count, end_count and their differnce printed
		//  Number_of_cycles 
		// Close the Output file
		r = $fprintf(f_dump1, "Cycle Count = %d\n", end_count - start_count);
        r = $fclosew(fout_trc);
		r = $fclosew(f_dump1);
		$display("MSG: End Simulation!!!");
		$stop;
	 end // initial begin


 
   
   // This block only tests if the applied current test pattern is consumed or not
   // Then triggers next fetch and apply
   always @ (posedge clk)
	 begin
		// if previously applied command is consumed then
		if (!test_pattern_injection_done)
		  if (!waiting)
			begin
			   if ((BlkWriteInProgress  == 1) && (DataFifoHasSpace == 1))  // BlkWriteInProgress
				 begin
					blkWriteCount  <= #0.1 blkWriteCount - 1;
					if (blkWriteCount  == 1)
					  BlkWriteInProgress = 0;
					-> fetchNextTestPattern;
				 end
			   else if ((BlkWriteInProgress  == 0) && ((non_read_cmd_consumed) || (read_cmd_consumed) || (nop_consumed)))
				 begin
					if (Cmd == 4)
					  begin
						 BlkWriteInProgress = 1;
						 blkWriteCount  <= #0.1 blkWriteCount - 1;
					  end
					-> fetchNextTestPattern;
				 end
			end // if (waiting != 0)
		  else
			begin
			   waitCount <= #0.1 waitCount -1;
			   if (waitCount == 1)
				 begin
					waiting <=  #0.1 0;
					-> ApplyTestPattern;
				 end
			end // else: !if(waiting != 0)
	 end // always @ (posedge clk)
   
   

   // This is only triggered if last applied commad is consumed
   // If there are no more test patterns then this would set the Test_pattern_injection_done bit
   //
   always @ (fetchNextTestPattern)
	 begin
		// fetchNextTestPattern <= #0.1 0;
		if (c != `EOF)
		  begin
			 test_pattern_injection_done = 0;
			 // Push the character back to the file then read the next time
			 r = $ungetc(c, fin);
			 // Read             WaitCycles, Cmd,    Sz, Op, Addr,    Data,        Fetching 
			 //                   10           1     0   0   1BABAFE  CAFECAFE       1
			 r = $fscanf(fin,"%d    %d    %d   %d    %x     %x     %d\n", WaitCycles, Cmd, Sz, Op, Addr, Data, Fetching);
			 c = $fgetc(fin);
			 if (WaitCycles == 0)
			   begin
				  waitCount <= #0.1 0;
				  waiting <= #0.1 0;
				  -> ApplyTestPattern;
			   end
			 else
			   begin
				  waitCount <= #0.1 WaitCycles ;
				  waiting <= #0.1 1;
				  cmd      <= #0.1 3'b0;
				  din      <= #0.1 16'bx;
				  addr     <= #0.1 25'bx;
				  sz       <= #0.1 2'bx;
				  op       <= #0.1 3'bx;
			   end
		  end // if (c != `EOF)
		else
		  begin // There are no more test patterns
			 test_pattern_injection_done <= #0.1 1;
			 Cmd      =  3'b0;
			 Data     =  16'bx;
			 Addr     =  25'bx;
			 Sz       =  2'bx;
			 Op       =  3'bx;
			 Fetching =  3'b1;
			 -> ApplyTestPattern;
		  end // else: !if(c != `EOF)
	 end // always @ (fetchNextTestPattern)
   
   // Commands
   // ---------
   // 000: No Operation (NOP)
   // 001: Scalar Read  (SCR)
   // 010: Scalar Write  (SCW)
   // 011: Block Read (BLR)
   // 100: Block Write ((BLW)
   // 101: Atomic Read (ATR)
   // 110: Atomic Write (ATW)
   // 111: No Operation (NOP)

   always @ (ApplyTestPattern)
	 begin
		if (BlkWriteInProgress)
		  begin
			 cmd      <= #0.1 3'bx;
			 din      <= #0.1 Data;
			 addr     <= #0.1 25'bx;
			 sz       <= #0.1 2'bx;
			 op       <= #0.1 3'bx; 
			 fetching <= #0.1 Fetching;
		  end
		else if ((Cmd == 0) || (Cmd == 7)) // 001 0r 111 (NOP)
		  begin
			 cmd      <= #0.1 Cmd;
			 din      <= #0.1 16'bx;
			 addr     <= #0.1 25'bx;
			 sz       <= #0.1 2'bx;
			 op       <= #0.1 3'bx; 
			 fetching <= #0.1 Fetching;
		  end
		else if (Cmd == 1) // 001: Scalar Read  (SCR)
		  begin
			 cmd      <= #0.1 Cmd;
			 din      <= #0.1 16'bx;
			 addr     <= #0.1 Addr;
			 sz       <= #0.1 2'bx;
			 op       <= #0.1 3'bx; 
			 fetching <= #0.1 Fetching;
		  end
		else if (Cmd == 2) // 010: Scalar Write  (SCW)
		  begin
			 cmd      <= #0.1 Cmd; 
			 din      <= #0.1 Data;								 
			 addr     <= #0.1 Addr;
			 sz       <= #0.1 2'bx;
			 op       <= #0.1 3'bx;
			 fetching <= #0.1 Fetching;
		  end
		else if (Cmd == 3) // 011: Block Read (BLR)
		  begin
			 cmd      <= #0.1 Cmd;
			 din      <= #0.1 16'bx;
			 addr     <= #0.1 Addr;
			 sz       <= #0.1 Sz;
			 op       <= #0.1 3'bx; 
			 fetching <= #0.1 Fetching;
		  end
		else if (Cmd == 4) // 100: Block Write ((BLW)
		  begin
			 cmd      <= #0.1 Cmd; 
			 din      <= #0.1 Data;								 
			 addr     <= #0.1 Addr;
			 sz       <= #0.1 Sz;
			 op       <= #0.1 3'bx;
			 fetching <= #0.1 Fetching;
			 blkWriteCount <= #0.1 (8 * (Sz + 1));
		  end
		else if ((Cmd == 5) || (Cmd == 6)) // 101: Atomic Read (ATR) or 110: Atomic Write (ATW)
		  begin
			 cmd      <= #0.1 Cmd; 
			 din      <= #0.1 Data;								 
			 addr     <= #0.1 Addr;
			 sz       <= #0.1 Sz;
			 op       <= #0.1 Op;
			 fetching <= #0.1 Fetching;
		  end
	 end // always @ (ApplyTestPattern)
   
   
   

   
   // Open a File to write output
   initial
	 f_dump1=$fopenw(`DUMP_FILE_NAME); 
   
   always @ (negedge clk)
	 begin
		if (fetching && validout)
		  begin
			 // Write the Address and the Data of the output FIFO
			 r = $fprintf(f_dump1, "%h %h\n", raddr[24:0], dout[15:0]);
			 end_count <= cycle_counter;
		  end
   	 end


   always @ (posedge clk)
	 cycle_counter <= cycle_counter +1;
   

   ddr2_controller XCON (
						 // Outputs
						 .DOUT					(dout[15:0]),
						 .RADDR					(raddr[24:0]),
						 .FILLCOUNT				(fillcount[6:0]),
						 .VALIDOUT				(validout),
						 .NOTFULL			    (notfull),
						 .READY					(ready),
						 .C0_CK_PAD				(c0_ck_pad),
						 .C0_CKBAR_PAD			(c0_ckbar_pad),
						 .C0_CKE_PAD			(c0_cke_pad),
						 .C0_CSBAR_PAD			(c0_csbar_pad),
						 .C0_RASBAR_PAD			(c0_rasbar_pad),
						 .C0_CASBAR_PAD			(c0_casbar_pad),
						 .C0_WEBAR_PAD			(c0_webar_pad),
						 .C0_BA_PAD				(c0_ba_pad[1:0]),
						 .C0_A_PAD				(c0_a_pad[12:0]),
						 .C0_DM_PAD				(c0_dm_pad[1:0]),
						 .C0_ODT_PAD			(c0_odt_pad),
						 // Inouts
						 .C0_DQ_PAD				(c0_dq_pad[15:0]),
						 .C0_DQS_PAD			(c0_dqs_pad[1:0]),
						 .C0_DQSBAR_PAD			(c0_dqsbar_pad[1:0]),
						 // Inputs
						 .CLK					(clk),
						 .RESET					(reset),
						 .CMD					(cmd[2:0]),
						 .SZ					(sz[1:0]),
						 .OP					(op[2:0]),
						 .DIN					(din[15:0]),
						 .ADDR					(addr[24:0]),
						 .FETCHING				(fetching),
						 .INITDDR				(initddr)
						 );



   mt47h32m16_37e XDDR0 (
						 .ck(c0_ck_pad),
						 .ckbar(c0_ckbar_pad),
						 .cke(c0_cke_pad),
						 .csbar(c0_csbar_pad),
						 .rasbar(c0_rasbar_pad),
						 .casbar(c0_casbar_pad),
						 .webar(c0_webar_pad),
						 .ba(c0_ba_pad),
						 .a(c0_a_pad),
						 .dq(c0_dq_pad),
						 .dqs(c0_dqs_pad),
						 .dqsbar(c0_dqsbar_pad),
						 .dm(c0_dm_pad),
						 .odt(c0_odt_pad));
   
endmodule // tb

