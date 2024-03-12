/*===========================================================================*/
/* Copyright (C) 2001 Authors                                                */
/*                                                                           */
/* This source file may be used and distributed without restriction provided */
/* that this copyright statement is not removed from the file and that any   */
/* derivative work contains the original copyright notice and the associated */
/* disclaimer.                                                               */
/*                                                                           */
/* This source file is free software; you can redistribute it and/or modify  */
/* it under the terms of the GNU Lesser General Public License as published  */
/* by the Free Software Foundation; either version 2.1 of the License, or    */
/* (at your option) any later version.                                       */
/*                                                                           */
/* This source is distributed in the hope that it will be useful, but WITHOUT*/
/* ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or     */
/* FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public       */
/* License for more details.                                                 */
/*                                                                           */
/* You should have received a copy of the GNU Lesser General Public License  */
/* along with this source; if not, write to the Free Software Foundation,    */
/* Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA        */
/*                                                                           */
/*===========================================================================*/
/*                              DMA INTERFACE                                */
/*---------------------------------------------------------------------------*/
/* Test the DMA interface:                                                   */
/*                        - Check Memory RD/WR features.                     */
/*                                                                           */
/* Author(s):                                                                */
/*             - Olivier Girard,    olgirard@gmail.com                       */
/*                                                                           */
/*---------------------------------------------------------------------------*/
/* $Rev$                                                                */
/* $LastChangedBy$                                          */
/* $LastChangedDate$          */
/*===========================================================================*/

`define VERY_LONG_TIMEOUT

parameter TMPL8B_CNTRL1	 = 16'h0090; 
parameter TMPL8B_CNTRL2	 = 16'h0091; 
parameter TMPL8B_CNTRL3	 = 16'h0092; 
parameter TMPL8B_CNTRL4	 = 16'h0093; 

integer jj;
integer inst_number_old;
integer inst_number_diff;

initial
   begin
      $display(" ===============================================");
      $display("|                 START SIMULATION              |");
      $display(" ===============================================");
`ifdef DMA_IF_EN
      // Disable automatic DMA verification
      #10;
      dma_verif_on = 0;

      repeat(30) @(posedge mclk);
      stimulus_done = 0;

      //-------------------------------------------------------------
      // LOW/HIGH PRIORITY DMA
      //-------------------------------------------------------------
      for ( jj=0; jj<=1; jj=jj+1)
	begin
	   if (jj==0)
	     begin
		dma_priority=0;
		$display("\n\n---------------------------------------");
                $display("   LOW Priority 8B DMA transfer tests");
		$display("---------------------------------------\n");
	     end
	   else
	     begin
		dma_priority=1;
		$display("\n\n---------------------------------------");
                $display("   HIGH Priority 8B DMA transfer tests");
		$display("---------------------------------------\n");
	     end
	   
	   // RD/WR ACCESS: Program memory (8b)
	   //--------------------------------------------------------
	   $display("MARCH-X: Program memory 8b:");
	   
	   // Wait random time until MARCH-X starts
	   dma_rand_wait = $urandom_range(1,40);
	   repeat(dma_rand_wait) @(posedge mclk);

	   // Run MARCH-X on program memory
	   // (make sure we don't overwrite firmware, i.e. the first 48 bytes)
	   inst_number_old=inst_number;
	   march_x_8b(('h10000-`PMEM_SIZE+48), 16'hfffe, 1);
	   inst_number_diff=inst_number-inst_number_old;
	   if ( dma_priority & (inst_number_diff>2))   tb_error("CPU is not stopped in high priority mode");
	   if (~dma_priority & (inst_number_diff<500)) tb_error("CPU is stopped in low priority mode");
	     
	   // RD/WR ACCESS: Data memory (8b)
	   //--------------------------------------------------------
	   $display("\n\nMARCH-X: Data memory 8b:");

	   // Wait random time until MARCH-X starts
	   dma_rand_wait = $urandom_range(1,40);
	   repeat(dma_rand_wait) @(posedge mclk);

	   // Run MARCH-X on data memory
	   // (make sure we don't overwrite firmware data, i.e. DMEM_200)
	   inst_number_old=inst_number;
	   march_x_8b((`PER_SIZE+2), (`PER_SIZE+`DMEM_SIZE-2), 1);
	   inst_number_diff=inst_number-inst_number_old;
	   if ( dma_priority & (inst_number_diff>2))   tb_error("CPU is not stopped in high priority mode");
	   if (~dma_priority & (inst_number_diff<100)) tb_error("CPU is stopped in low priority mode");
      
	   // RD/WR ACCESS: Peripheral memory (8b)
	   //--------------------------------------------------------
	   $display("\n\nMARCH-X: Peripheral memory 8b ...");

	   // Wait random time until MARCH-X starts
	   dma_rand_wait = $urandom_range(1,40);
	   repeat(dma_rand_wait) @(posedge mclk);

	   // Run MARCH-X on 8B template peripheral
	   inst_number_old=inst_number;
	   repeat(100) march_x_8b(TMPL8B_CNTRL1, TMPL8B_CNTRL4, 0);
	   inst_number_diff=inst_number-inst_number_old;
	   if ( dma_priority & (inst_number_diff>2))   tb_error("CPU is not stopped in high priority mode");
	   if (~dma_priority & (inst_number_diff<500)) tb_error("CPU is stopped in low priority mode");
	end
      
      // End of test
      //--------------------------------------------------
      $display("\n");
      repeat(3000) @(posedge mclk);
      dma_write_8b(16'h0000-`PMEM_SIZE, 16'h0001, 1'b0);

      @(r15==16'h2000);
      if (r10 !== mem200) tb_error("Final Increment counter missmatch... firmware execution failed");
      
      stimulus_done = 1;
`else
       tb_skip_finish("|      (DMA interface support not included)    |");
`endif
   end

//-------------------------------------------------------------
// Make sure firmware executes properly during the whole test
//-------------------------------------------------------------

// Make sure there is the right amount of clock cycle between the counter increments
// (low-priority mode only)
integer mclk_cnt;
always @(posedge mclk) mclk_cnt=mclk_cnt+1;

// Check counter increment
initial
  begin
     // Wait for firmware to start
     @(r15==16'h1000);
     
     // Synchronize with first increment
     @(mem200); @(negedge mclk);
     mclk_cnt=0;
     
     forever
       begin
	  // When register R10 is incremented, make sure DMEM_200 = R10-1
	  @(r10); @(negedge mclk);
	  if (r10 !== (mem200+1))                                 tb_error("R10 Increment counter missmatch... firmware execution failed");
	  if (~dma_priority & ((mclk_cnt < 4) | (mclk_cnt > 10))) tb_error("DMEM_200 -> R10 exec time error... firmware execution failed");
	  mclk_cnt=0;
	  
	  // When DMEM_200 is incremented, make sure DMEM_200 = R10
	  @(mem200); @(negedge mclk);
	  if (r10 !== mem200)                                     tb_error("DMEM_200 Increment counter missmatch... firmware execution failed");
	  if (~dma_priority & ((mclk_cnt < 3) | (mclk_cnt > 9)))  tb_error("R10 -> DMEM_200 exec time error... firmware execution failed");
	  mclk_cnt=0;
       end
  end

   
//------------------------------------------------------
// MARCH-X functions
//------------------------------------------------------
task march_x_8b;
   input  [15:0] addr_start;
   input  [15:0] addr_end;
   input 	 verbose;
   
   integer 	 ii;
   begin
      // MARCH X : down (w0); up (r0,w1); down (r1,w0); up (r0)

      if (verbose) $display("                                - down(w0)    ... ");
      for ( ii=addr_end; ii >= addr_start; ii=ii-1)
	begin
	   dma_write_8b(ii, 8'h00, 1'b0);
	end

      if (verbose) $display("                                - up(r0,w1)   ... ");
      for ( ii=addr_start; ii <= addr_end; ii=ii+1)
	begin
	   dma_read_8b(ii,  8'h00, 1'b0);
	   dma_write_8b(ii, 8'hff, 1'b0);
	end
  
      if (verbose) $display("                                - down(r1,w0) ... ");
      for ( ii=addr_end; ii >= addr_start; ii=ii-1)
	begin
	   dma_read_8b(ii,  8'hff, 1'b0);
	   dma_write_8b(ii, 8'h00, 1'b0);
	end

      if (verbose) $display("                                - up(r0)      ... ");
      for ( ii=addr_start; ii <= addr_end; ii=ii+1)
	begin
	   dma_read_8b(ii,  8'h00, 1'b0);
	end
   end
endtask // march_x_8b
