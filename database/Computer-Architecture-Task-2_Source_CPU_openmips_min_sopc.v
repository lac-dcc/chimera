// This program was cloned from: https://github.com/lmxyy/Computer-Architecture-Task-2
// License: MIT License

`ifdef openmips_min_sopc.v
`else
 `define openmips_min_sopc.v
// --------------------------------------------------------------------------------
 `include "defines.v"
 `include "openmips.v"
 // `include "inst_rom.v"
 // `include "data_ram.v"
 `include "mem_sim.v"
 `include "dcache.v"
 `include "icache.v"

module openmips_min_sopc
  (
   input wire clk,
   input wire rst
   );

   wire [`InstAddrBus] inst_addr;
   wire [`InstBus]     inst;
   wire 	       rom_ce;
   wire 	       mem_ce;

   wire 	       mem_we_i;
   wire 	       mem_re_i;
   
   wire [`RegBus]      mem_addr_i;
   wire [`RegBus]      mem_data_i;
   wire [`RegBus]      mem_data_o;
   wire [3:0] 	       mem_sel_i;  
   
   wire 	       stallreq_from_if_cache;
   wire 	       stallreq_from_mem_cache;
   
   openmips openmips0
     (
      .clk(clk),
      .rst(rst),
      
      .rom_data_i(inst),
      .rom_addr_o(inst_addr),
      .rom_ce_o(rom_ce),      

      .ram_data_i(mem_data_o),
      .ram_addr_o(mem_addr_i),
      .ram_data_o(mem_data_i),
      .ram_we_o(mem_we_i),
      .ram_re_o(mem_re_i),
      .ram_sel_o(mem_sel_i),
      .ram_ce_o(mem_ce_i),		

      .stallreq_from_if_cache(stallreq_from_if_cache),
      .stallreq_from_mem_cache(stallreq_from_mem_cache)
      );
   
   wire 	       if_cache_req_o;
   wire [31:0]	       if_cache_addr_o;
   wire 	       if_cache_rep_i;
   wire [63:0] 	       if_cache_rep_data_i;   
   
   icache if_cache
     (
      .clk(clk),
      .rst(rst),
      .ce(rom_ce),
      
      .addr(inst_addr),

      .read_flag(1'b1),
      .read_data(inst),

      .cache_req_o(if_cache_req_o),
      .cache_addr_o(if_cache_addr_o),
      
      .cache_rep_i(if_cache_rep_i),
      .cache_rep_data_i(if_cache_rep_data_i),

      .stallreq(stallreq_from_if_cache)
      );

   wire 	       mem_cache_req_o;
   wire [31:0]	       mem_cache_addr_o;
   wire 	       mem_cache_write_o;
   wire [31:0]	       mem_cache_data_o;
   wire [3:0] 	       mem_cache_mask_o;
   wire 	       mem_cache_rep_i;
   wire [63:0]	       mem_cache_rep_data_i;
      
   dcache mem_cache
     (
      .clk(clk),
      .rst(rst),
      .ce(mem_ce),

      .addr(mem_addr_i),

      .read_flag(mem_re_i),
      .read_data(mem_data_o),

      .write_data(mem_data_i),
      .write_mask(mem_sel_i),
      .write_flag(mem_we_i),

      .cache_req_o(mem_cache_req_o),
      .cache_addr_o(mem_cache_addr_o),

      .cache_write_o(mem_cache_write_o),
      .cache_write_data_o(mem_cache_data_o),
      .cache_write_mask_o(mem_cache_mask_o),

      .cache_rep_i(mem_cache_rep_i),
      .cache_rep_data_i(mem_cache_rep_data_i),

      .stallreq(stallreq_from_mem_cache)
      );   
   
    mem_sim mem_sim0
     (
      .clk(clk),

      .if_ms_req_i(if_cache_req_o),
      .if_addr(if_cache_addr_o),

      .mem_ms_req_i(mem_cache_req_o),
      .mem_addr(mem_cache_addr_o),

      .ms_write_i(mem_cache_write_o),
      .ms_write_data_i(mem_cache_data_o),
      .ms_write_mask_i(mem_cache_mask_o),

      .if_ms_rep_o(if_cache_rep_i),
      .if_ms_rep_data_o(if_cache_rep_data_i),

      .mem_ms_rep_o(mem_cache_rep_i),
      .mem_ms_rep_data_o(mem_cache_rep_data_i)
      );
   
endmodule // openmips_min_sopc

// --------------------------------------------------------------------------------
`endif
