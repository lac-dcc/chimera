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
/*                            DMA INTERFACE                                  */
/*---------------------------------------------------------------------------*/
/* Test the DMA interface:                                                   */
/*                        - Check DMA and Debug interface arbitration.       */
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

integer    dbg_cnt_wr;
integer    dbg_cnt_rd;
integer    dbg_wr_error;
integer    dbg_rd_error;

integer    dbg_mem_ref_idx;
reg [15:0] dbg_pmem_reference[0:128];
reg [15:0] dbg_dmem_reference[0:128];

reg [15:0] dbg_if_buf;

reg  [7:0] kk;
reg [15:0] dbg_rand_val;
reg        dbg_rand_rd_wr;
reg        dbg_rand_mem_sel;
reg  [7:0] dbg_rand_offset;
reg  [7:0] dbg_rand_size;

initial
   begin
      $display(" ===============================================");
      $display("|                 START SIMULATION              |");
      $display(" ===============================================");
`ifdef DMA_IF_EN
`ifdef DBG_EN

      // Skip verification if memory configuration is too small
      if (~((`PMEM_SIZE>=4092) && (`DMEM_SIZE>=1024)))
        begin
           tb_skip_finish("|  (PMEM size less than 4kB or DMEM size is less than 1kB)  |");
        end
      
      #1 dbg_en    = 1;
      dbg_if_buf   = 16'h0000;
      dma_verif_on = 1;
  
      dbg_cnt_wr   = 0;
      dbg_cnt_rd   = 0;
      dbg_wr_error = 0;
      dbg_rd_error = 0;
      
      repeat(30) @(posedge mclk);
      stimulus_done = 0;


      // Disable random delay on DMA inteface to maximize the number of transfer
      dma_rand_wait_disable = 1;
        
      // Initialize memory for debug interface random accesses
      for (dbg_mem_ref_idx=0; dbg_mem_ref_idx < 128; dbg_mem_ref_idx=dbg_mem_ref_idx+1)
        begin
	   dbg_rand_val                        = $urandom;
           dbg_pmem_reference[dbg_mem_ref_idx] = dbg_rand_val;
           pmem_0.mem[128+dbg_mem_ref_idx]     = dbg_rand_val;

	   dbg_rand_val                        = $urandom;
           dbg_dmem_reference[dbg_mem_ref_idx] = dbg_rand_val;
	   dmem_0.mem[128+dbg_mem_ref_idx]     = dbg_rand_val;
	end
    
      // SEND UART SYNCHRONIZATION FRAME
   `ifdef DBG_UART
      dbg_uart_tx(DBG_SYNC);
   `endif

      // RUN CPU
      dbg_if_wr(CPU_CTL,  16'h0002);

      // Let CPU execute a bit before enabling the priority DMA
      // (this will let the firmware enough time to disable the watchdog)
      repeat(30) @(posedge mclk);
      dma_priority = 1;

      //--------------------------------
      // Debug interface transfer
      //--------------------------------
      for (kk=0; kk < 50; kk=kk+1)
        begin
           // Ramdomly choose:
           //                 - read or write access
	   //                 - Program or Data memory
           //                 - transfer size
           //                 - memory offset
           dbg_rand_rd_wr   = $urandom_range(0,1);
           dbg_rand_mem_sel = $urandom_range(0,1);
           dbg_rand_size    = $urandom_range(10,63);
           dbg_rand_offset  = $urandom_range(0,63);

	   $display("START DBG BURST %d:   write=%h  /  pmem_sel=%h  /  size=%d  /  offset=%d", kk, dbg_rand_rd_wr, dbg_rand_mem_sel, dbg_rand_size, dbg_rand_offset);
	     
	   if (dbg_rand_rd_wr) dbg_if_burst_write_16b(dbg_rand_mem_sel, dbg_rand_offset, dbg_rand_size);
	   else		       dbg_if_burst_read_16b( dbg_rand_mem_sel, dbg_rand_offset, dbg_rand_size);
        end

      //--------------------------------
      // End of test
      //--------------------------------

      // Remove DMA priority to let the CPU execute some code
      dma_priority = 0;

      // Update variable to let firmware finish execution
      dbg_if_wr(MEM_ADDR, (16'h0000-`PMEM_SIZE));
      dbg_if_wr(MEM_DATA,  16'h0001);
      dbg_if_wr(MEM_CTL,   16'h0003);

      $display("\n");
      $display("DBG REPORT: Total Accesses: %-d Total RD: %-d Total WR: %-d", dbg_cnt_rd+dbg_cnt_wr,     dbg_cnt_rd,   dbg_cnt_wr);
      $display("            Total Errors:   %-d Error RD: %-d Error WR: %-d", dbg_rd_error+dbg_wr_error, dbg_rd_error, dbg_wr_error);
      $display("\n");

      stimulus_done = 1;
`else
       tb_skip_finish("|      (serial debug interface not included)    |");
`endif
`else
       tb_skip_finish("|      (DMA interface support not included)    |");
`endif
   end



//-----------------------------------------------------
// Generic debug interface tasks
//-----------------------------------------------------
task dbg_if_wr;
   input  [7:0] dbg_reg;
   input [15:0] dbg_data;

   begin
   `ifdef DBG_UART
      dbg_uart_wr(dbg_reg, dbg_data); 
   `else
      dbg_i2c_wr(dbg_reg, dbg_data); 
   `endif
   end
endtask

task dbg_if_tx16;
   input [15:0] dbg_data;
   input        is_last;

   begin
   `ifdef DBG_UART
      dbg_uart_tx16(dbg_data); 
   `else
      dbg_i2c_tx16(dbg_data, is_last); 
   `endif
   end
endtask

task dbg_if_rx16;
   input        is_last;

   begin
   `ifdef DBG_UART
      dbg_uart_rx16;
      dbg_if_buf = dbg_uart_buf;
   `else
      repeat(30) @(posedge mclk);
      dbg_i2c_rx16(is_last); 
      dbg_if_buf = dbg_i2c_buf;
   `endif
   end
endtask

//-----------------------------------------------------
// Debug interface burst tasks
//-----------------------------------------------------

task dbg_if_burst_write_16b;
   input        mem_sel;  // 1: Program memory / 0: Data memory
   input [15:0] offset;
   input [15:0] size;

   integer     idx;
   reg  [15:0] data_val;
   begin
      if (mem_sel) dbg_if_wr(MEM_ADDR, ('h0000-`PMEM_SIZE+256+offset*2));
      else         dbg_if_wr(MEM_ADDR, (`PER_SIZE+256+offset*2));
      dbg_if_wr(MEM_CNT,  size-1);
      dbg_if_wr(MEM_CTL,  16'h0003); // Start burst to 16 bit memory write
   `ifdef DBG_I2C
      dbg_i2c_burst_start(0);
   `endif
      for (idx=0; idx < size; idx=idx+1)
        begin
           data_val = $urandom;
           if (mem_sel) dbg_pmem_reference[offset+idx] = data_val;
           else         dbg_dmem_reference[offset+idx] = data_val;

           if (idx!=(size-1)) dbg_if_tx16(data_val, 0);
           else               dbg_if_tx16(data_val, 1);

           dbg_cnt_wr = dbg_cnt_wr+1;
        end

      repeat(12) @(posedge mclk);
      for (idx=0; idx < size; idx=idx+1)
        begin
           if      ( mem_sel & (pmem_0.mem[128+offset+idx] !== dbg_pmem_reference[offset+idx])) begin dbg_wr_error=dbg_wr_error+1; tb_error("====== DBG INTERFACE PMEM WRITE ERROR ====="); end
           else if (~mem_sel & (dmem_0.mem[128+offset+idx] !== dbg_dmem_reference[offset+idx])) begin dbg_wr_error=dbg_wr_error+1; tb_error("====== DBG INTERFACE DMEM WRITE ERROR ====="); end
        end
   end
endtask

task dbg_if_burst_read_16b;
   input        mem_sel;  // 1: Program memory / 0: Data memory
   input [15:0] offset;
   input [15:0] size;

   integer     idx;
   begin
      if (mem_sel) dbg_if_wr(MEM_ADDR, ('h0000-`PMEM_SIZE+256+offset*2));
      else         dbg_if_wr(MEM_ADDR, (`PER_SIZE+256+offset*2));
      dbg_if_wr(MEM_CNT,  size-1);
      dbg_if_wr(MEM_CTL,  16'h0001);              // Start burst to 16 bit registers read
   `ifdef DBG_I2C
      dbg_i2c_burst_start(1);
   `endif
      for (idx=0; idx < size; idx=idx+1)
        begin
           if (idx!=(size-1)) dbg_if_rx16(0);
           else               dbg_if_rx16(1);

           dbg_cnt_rd = dbg_cnt_rd+1;

	   // Make sure we don't read an X
	   if      ( mem_sel & (dbg_if_buf === 16'hxxxx)) begin dbg_rd_error=dbg_rd_error+1; tb_error("====== DBG INTERFACE PMEM READ XXXXX ====="); end
	   else if (~mem_sel & (dbg_if_buf === 16'hxxxx)) begin dbg_rd_error=dbg_rd_error+1; tb_error("====== DBG INTERFACE DMEM READ XXXXX ====="); end

	   // Check result
           if      ( mem_sel & (dbg_if_buf !== dbg_pmem_reference[offset+idx]))  begin dbg_rd_error=dbg_rd_error+1; tb_error("====== DBG INTERFACE PMEM  READ ERROR ====="); end 
           else if (~mem_sel & (dbg_if_buf !== dbg_dmem_reference[offset+idx]))  begin dbg_rd_error=dbg_rd_error+1; tb_error("====== DBG INTERFACE DMEM  READ ERROR ====="); end 
        end
   end
endtask
