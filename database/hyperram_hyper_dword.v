/* ****************************************************************************
-- (C) Copyright 2018 Kevin M. Hubbard - All rights reserved.
-- Source file: hyper_dword.v           
-- Date:        April 2018
-- Author:      khubbard
-- Description: S27KL0641DABHI020 : Cypress IC DRAM 64MBIT 3V 100MHZ 24BGA
-- Language:    Verilog-2001
-- Simulation:  Mentor-Modelsim 
-- Synthesis:   Xilinst-XST 
-- License:     This project is licensed with the CERN Open Hardware Licence
--              v1.2.  You may redistribute and modify this project under the
--              terms of the CERN OHL v.1.2. (http://ohwr.org/cernohl).
--              This project is distributed WITHOUT ANY EXPRESS OR IMPLIED
--              WARRANTY, INCLUDING OF MERCHANTABILITY, SATISFACTORY QUALITY
--              AND FITNESS FOR A PARTICULAR PURPOSE. Please see the CERN OHL
--              v.1.2 for applicable Conditions.
-- ***************************************************************************/
`default_nettype none // Strictly enforce all nets to be declared
  
module hyper_dword 
(
  input  wire         reset,
  input  wire         clk_lb,
  input  wire         lb_cs_reg0,
  input  wire         lb_cs_reg1,
  input  wire         lb_cs_reg2,
  input  wire         lb_cs_reg3,
  input  wire         lb_wr,
  input  wire         lb_rd,
  input  wire [31:0]  lb_wr_d,
  output reg  [31:0]  lb_rd_d,
  output reg          lb_rd_rdy,
  output wire [7:0]   sump_dbg,

  output wire         dram_ck,
  output wire         dram_rst_l,
  output wire         dram_cs_l,

  input  wire [7:0]   dram_dq_in,
  output wire [7:0]   dram_dq_out,
  output wire         dram_dq_oe_l,

  input  wire         dram_rwds_in,
  output wire         dram_rwds_out,
  output wire         dram_rwds_oe_l
);// module hyper_dword 


  reg          rd_req;
  reg          wr_req;
  reg          mem_or_reg;
  reg  [3:0]   wr_byte_en;
  reg  [31:0]  addr;
  reg  [31:0]  wr_d;
  reg  [31:0]  rd_buffer;
  reg  [5:0]   rd_num_dwords;
  wire [31:0]  rd_d;
  wire         rd_rdy;
  wire         busy;
  reg  [7:0]   latency_1x;
  reg  [7:0]   latency_2x;


//-----------------------------------------------------------------------------
// Convert LocalBus to Hyper control lines
//-----------------------------------------------------------------------------
always @ ( posedge clk_lb ) begin : proc_lb_regs
 begin
   lb_rd_d   <= 32'd0;
   lb_rd_rdy <= 0;
   rd_req    <= 0;
   wr_req    <= 0;

   if ( rd_rdy == 1 ) begin 
     rd_buffer <= rd_d[31:0];
   end 

   if ( lb_wr == 1 ) begin
     if ( lb_cs_reg3 == 1 ) begin 
       rd_req         <=  lb_wr_d[0];// 0=WriteOp, 1=ReadOp
       wr_req         <= ~lb_wr_d[0];// 0=WriteOp, 1=ReadOp
       mem_or_reg     <=  lb_wr_d[1];// 0=MemSpace,1=RegSpace
       wr_byte_en     <=  lb_wr_d[7:4];
     end
     if ( lb_cs_reg2 == 1 ) begin 
       addr[31:0]  <= lb_wr_d[31:0];// Note this is 32bit addressing 
     end
     if ( lb_cs_reg1 == 1 ) begin 
       wr_d[31:0]  <= lb_wr_d[31:0];
     end
     if ( lb_cs_reg0 == 1 ) begin 
       rd_num_dwords <= lb_wr_d[ 5:0];
       latency_1x    <= lb_wr_d[23:16];
       latency_2x    <= lb_wr_d[31:24];
     end
   end 

   if ( lb_rd == 1 ) begin 
     if ( lb_cs_reg1 == 1 ) begin 
       lb_rd_d   <= rd_buffer[31:0];
       lb_rd_rdy <= 1;
     end
   end 

   if ( reset == 1 ) begin 
     latency_1x    <= 8'h12;
     latency_2x    <= 8'h16;          
     rd_num_dwords <= 6'd1;
   end 

 end
end // proc_lb_regs


//-----------------------------------------------------------------------------
// Bridge LB To a HyperRAM
//-----------------------------------------------------------------------------
hyper_xface u_hyper_xface
(
  .reset             ( reset              ),
  .clk               ( clk_lb             ),
  .rd_req            ( rd_req             ),
  .wr_req            ( wr_req             ),
  .mem_or_reg        ( mem_or_reg         ),
  .wr_byte_en        ( wr_byte_en         ),
  .addr              ( addr[31:0]         ),
  .rd_num_dwords     ( rd_num_dwords[5:0] ),
  .wr_d              ( wr_d[31:0]         ),
  .rd_d              ( rd_d[31:0]         ),
  .rd_rdy            ( rd_rdy             ),
  .busy              ( busy               ),
  .latency_1x        ( latency_1x[7:0]    ),
  .latency_2x        ( latency_2x[7:0]    ),
  .dram_dq_in        ( dram_dq_in[7:0]    ),
  .dram_dq_out       ( dram_dq_out[7:0]   ),
  .dram_dq_oe_l      ( dram_dq_oe_l       ),
  .dram_rwds_in      ( dram_rwds_in       ),
  .dram_rwds_out     ( dram_rwds_out      ),
  .dram_rwds_oe_l    ( dram_rwds_oe_l     ),
  .dram_ck           ( dram_ck            ),
  .dram_rst_l        ( dram_rst_l         ),
  .dram_cs_l         ( dram_cs_l          ),
  .sump_dbg          ( sump_dbg[7:0]      )
);// module hyper_xface


endmodule // hyper_dword.v
