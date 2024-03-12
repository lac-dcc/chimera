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
/*                        - Check transfer response.                         */
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

integer jj, kk;
reg [15:0] data_val;

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
                $display("   LOW Priority 16B DMA transfer tests");
		$display("---------------------------------------\n");
	     end
	   else
	     begin
		dma_priority=1;
		$display("\n\n---------------------------------------");
                $display("   HIGH Priority 16B DMA transfer tests");
		$display("---------------------------------------\n");
	     end
	   
	   // READ ACCESS (whole 64kB address range)
	   //--------------------------------------------------------
	   $display("READ ACCESS (whole 64kB address range)");

	   for ( kk=0; kk<='hfffe; kk=kk+2)
	     begin
		if      (kk<(`PER_SIZE+`DMEM_SIZE)) dma_read_val_16b(kk, 1'b0); // OKAY response in Peripheral and Data memory space
		else if (kk>=('h10000-`PMEM_SIZE))  dma_read_val_16b(kk, 1'b0); // OKAY response in Program memory space
		else                                dma_read_val_16b(kk, 1'b1); // ERROR response otherwise
	     end
	end
      
      // WRITE ACCESS (whole 64kB address range)
      // (we just do it in high priority mode as PMEM will be overwriten anyway)
      //-------------------------------------------------------------------------
      $display("WRITE ACCESS (whole 64kB address range)");

      for ( kk=0; kk<='hfffe; kk=kk+2)
	begin

	   case(kk)
	     'h0056     : data_val  = 16'h0000; // BCSCTL1 (avoid reconfiguration of the MCLK frequency)
	     'h0058     : data_val  = 16'h0000; // BCSCTL1 (avoid reconfiguration of the MCLK frequency)
	     'h0120     : data_val  = 16'h5A80; // WDTCTL (avoid reset when writing to watchdog control register)
	     default    : data_val  =  kk;
	   endcase
	   
	   if      (kk<(`PER_SIZE+`DMEM_SIZE)) dma_write_16b(kk, data_val, 1'b0); // OKAY response in Peripheral and Data memory space
	   else if (kk>=('h10000-`PMEM_SIZE))  dma_write_16b(kk, data_val, 1'b0); // OKAY response in Program memory space
	   else				       dma_write_16b(kk, data_val, 1'b1); // ERROR response otherwise
	end


      // End of test
      //--------------------------------------------------
      $display("\n");
      repeat(3000) @(posedge mclk);

      // Put small program in memory
      dma_write_16b(16'hfff0, 16'h4303, 1'b0); // nop

      dma_write_16b(16'hfff2, 16'h4030, 1'b0); // br #0xffff
      dma_write_16b(16'hfff4, 16'hffff, 1'b0); //

      dma_write_16b(16'hfffe, 16'hfff0, 1'b0); // Reset vector

      // Apply reset and wait for end of execution
      dma_write_16b(16'h0120, 16'h0000, 1'b0); // WDTCTL      
      
      stimulus_done = 1;
`else
       tb_skip_finish("|      (DMA interface support not included)    |");
`endif
   end
   