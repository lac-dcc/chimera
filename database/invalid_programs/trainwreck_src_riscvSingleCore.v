`include "riscvConst.vh"

module riscvCore
(
  input clk,
  input reset,

  output error_mode,
  output log_control,

  input         htif_start,
  input         htif_fromhost_wen,
  input  [31:0] htif_fromhost,
  output [31:0] htif_tohost,

  output       console_out_val,
  input        console_out_rdy,
  output [7:0] console_out_bits,

  output                      mem_req_val,
  input                       mem_req_rdy,
  output                      mem_req_rw,
  output [`MEM_ADDR_BITS-1:0] mem_req_addr,
  output [`MEM_DATA_BITS-1:0] mem_req_data,
  output [`MEM_TAG_BITS-1:0]  mem_req_tag,

  input                       mem_resp_val,
  input                       mem_resp_nack,
  input [`MEM_DATA_BITS-1:0]  mem_resp_data,
  input [`MEM_TAG_BITS-1:0]   mem_resp_tag
);
  wire         imem_cp_req_val;
  wire         imem_cp_req_rdy;
  wire [31:0]  imem_cp_req_addr;
  wire         imem_cp_resp_val;
  wire [31:0]  imem_cp_resp_data;

  wire         dmem_cp_req_val;
  wire         dmem_cp_req_rdy;
  wire [3:0]   dmem_cp_req_op;
  wire [31:0]  dmem_cp_req_addr;
  wire [63:0]  dmem_cp_req_data;
  wire [7:0]   dmem_cp_req_wmask;
  wire [11:0]  dmem_cp_req_tag;
  wire         dmem_cp_resp_val;
  wire [63:0]  dmem_cp_resp_data;
  wire [11:0]  dmem_cp_resp_tag;

  wire [14:0]  dmem_resp_tag;
  wire [127:0] dmem_resp_data128;

  wire         dcache_req_val;
  wire         dcache_req_rdy;
  wire [3:0]   dcache_req_op;
  wire [31:0]  dcache_req_addr;
  wire [127:0] dcache_req_data;
  wire [15:0]  dcache_req_wmask;
  wire [14:0]  dcache_req_tag;
  wire         dcache_resp_val;
  wire [127:0] dcache_resp_data;
  wire [14:0]  dcache_resp_tag;

  wire                        icc_mem_req_val;
  wire                        icc_mem_req_rdy;
  wire [`MEM_ADDR_BITS-1:0]   icc_mem_req_addr;
  wire                        icc_mem_req_tag;
  wire                        icc_mem_resp_val;
  wire                        icc_mem_resp_nack;

  wire                        dc_mem_req_val;
  wire                        dc_mem_req_rdy;
  wire                        dc_mem_req_rw;
  wire [`MEM_ADDR_BITS-1:0]   dc_mem_req_addr;
  wire [`DC_MEM_TAG_BITS-1:0] dc_mem_req_tag;
  wire                        dc_mem_resp_val;
  wire                        dc_mem_resp_nack;

  riscvProc #(.HAS_FPU(0), .HAS_VECTOR(0)) proc
  (
    .clk(clk),
    .reset(reset),

    .error_mode(error_mode),
    .log_control(log_control),

    .htif_start(htif_start),
    .htif_fromhost_wen(htif_fromhost_wen),
    .htif_fromhost(htif_fromhost),
    .htif_tohost(htif_tohost),

    .console_out_val(console_out_val),
    .console_out_rdy(console_out_rdy),
    .console_out_bits(console_out_bits),

    .vec_cmdq_bits(),
    .vec_cmdq_val(),
    .vec_cmdq_rdy(1'b1),

    .vec_ximm1q_bits(),
    .vec_ximm1q_val(),
    .vec_ximm1q_rdy(1'b1),
  
    .vec_ximm2q_bits(),       
    .vec_ximm2q_val(),
    .vec_ximm2q_rdy(1'b1),    
  
    .vec_ackq_val(1'b1),      
    .vec_ackq_rdy(),

    .imem_req_val(imem_cp_req_val),
    .imem_req_rdy(imem_cp_req_rdy),
    .imem_req_addr(imem_cp_req_addr),
    .imem_resp_val(imem_cp_resp_val),
    .imem_resp_data(imem_cp_resp_data),

    .dmem_req_val(dmem_cp_req_val),
    .dmem_req_rdy(dmem_cp_req_rdy),
    .dmem_req_op(dmem_cp_req_op),
    .dmem_req_addr(dmem_cp_req_addr),
    .dmem_req_data(dmem_cp_req_data),
    .dmem_req_wmask(dmem_cp_req_wmask),
    .dmem_req_tag(dmem_cp_req_tag),
    .dmem_resp_val(dmem_cp_resp_val),
    .dmem_resp_data(dmem_cp_resp_data),
    .dmem_resp_tag(dmem_cp_resp_tag)
  );

  assign dmem_cp_resp_tag = dmem_resp_tag[11:0];
  assign dmem_cp_resp_data = dmem_resp_tag[12] ? dmem_resp_data128[127:64] : dmem_resp_data128[63:0];

  ICache_cp_wrap icache_cp
  (
    .clk(clk),
    .reset(reset),

    .cpu_req_val(imem_cp_req_val),
    .cpu_req_rdy(imem_cp_req_rdy),
    .cpu_req_addr(imem_cp_req_addr[17:2]),

    .cpu_resp_val(imem_cp_resp_val),
    .cpu_resp_data(imem_cp_resp_data),

    .mem_req_val(icc_mem_req_val),
    .mem_req_rdy(icc_mem_req_rdy),
    .mem_req_addr(icc_mem_req_addr),
    .mem_req_tag(icc_mem_req_tag),

    .mem_resp_val(icc_mem_resp_val),
    .mem_resp_nack(icc_mem_resp_nack),
    .mem_resp_data(mem_resp_data),
    .mem_resp_tag(mem_resp_tag[0])
  );

  wire [`CPU_ADDR_BITS-`ceilLog2(`MEM_DATA_BITS/8)-1:0] hc_mem_req_addr;
  assign dc_mem_req_addr = hc_mem_req_addr[`MEM_ADDR_BITS-1:0];

  wire [127:0] dmem_cp_req_data128 = {dmem_cp_req_data, dmem_cp_req_data};
  wire [15:0]  dmem_cp_req_wmask16 = dmem_cp_req_addr[3] ? {dmem_cp_req_wmask, 8'd0} : {8'd0, dmem_cp_req_wmask}; 

  assign icc_mem_resp_nack = mem_resp_nack & ~mem_resp_tag[`MEM_TAG_BITS-1];
  assign dc_mem_resp_nack  = mem_resp_nack &  mem_resp_tag[`MEM_TAG_BITS-1];

  HellaCache #
  (
    .SETS(128),
    .WAYS(2),
    .NMSHR(2**`DC_MEM_TAG_BITS),
    .NSECONDARY_PER_MSHR(8),
    .NSECONDARY_STORES(16),
    .CPU_WIDTH(128),
    .WORD_ADDR_BITS(`CPU_ADDR_BITS-`ceilLog2(`CPU_DATA_BITS/8))
  )
  dcache
  (
    .clk(clk),
    .reset(reset),

    .cpu_req_val(dmem_cp_req_val),
    .cpu_req_rdy(dmem_cp_req_rdy),
    .cpu_req_op(dmem_cp_req_op),
    .cpu_req_addr(dmem_cp_req_addr[17:4]),
    .cpu_req_data(dmem_cp_req_data128),
    .cpu_req_wmask(dmem_cp_req_wmask16),
    .cpu_req_tag({2'd0, dmem_cp_req_addr[3], dmem_cp_req_tag}),

    .cpu_resp_val(dmem_cp_resp_val),
    .cpu_resp_data(dmem_resp_data128),
    .cpu_resp_tag(dmem_resp_tag),

    .mem_req_val(dc_mem_req_val),
    .mem_req_rdy(dc_mem_req_rdy),
    .mem_req_rw(dc_mem_req_rw),
    .mem_req_addr(hc_mem_req_addr),
    .mem_req_data(mem_req_data),
    .mem_req_tag(dc_mem_req_tag),

    .mem_resp_val(dc_mem_resp_val),
    .mem_resp_nack(dc_mem_resp_nack),
    .mem_resp_data(mem_resp_data),
    .mem_resp_tag(mem_resp_tag[`DC_MEM_TAG_BITS-1:0])
  );

  riscvArbiter arbiter        
  (
    .clk(clk),
    .reset(reset),
  
    .ic_mem_req_val(icc_mem_req_val),
    .ic_mem_req_rdy(icc_mem_req_rdy),
    .ic_mem_req_addr(icc_mem_req_addr),
    .ic_mem_resp_val(icc_mem_resp_val),
  
    .dc_mem_req_val(dc_mem_req_val),
    .dc_mem_req_rdy(dc_mem_req_rdy),
    .dc_mem_req_rw(dc_mem_req_rw),
    .dc_mem_req_addr(dc_mem_req_addr),
    .dc_mem_req_tag(dc_mem_req_tag),
    .dc_mem_resp_val(dc_mem_resp_val),
  
    .mem_req_val(mem_req_val),
    .mem_req_rdy(mem_req_rdy),
    .mem_req_rw(mem_req_rw),   
    .mem_req_addr(mem_req_addr),
    .mem_req_tag(mem_req_tag), 
    .mem_resp_val(mem_resp_val),
    .mem_resp_tag(mem_resp_tag)
  );

endmodule

module ICache_cp_wrap
(
  input clk,
  input reset,
  
  input                       cpu_req_val,
  output                      cpu_req_rdy,
  input [`CPU_ADDR_BITS-3:0]  cpu_req_addr,
  
  output                      cpu_resp_val,
  output [`CPU_INST_BITS-1:0] cpu_resp_data,
  
  output                      mem_req_val,
  input                       mem_req_rdy,
  output [`MEM_ADDR_BITS-1:0] mem_req_addr,
  output                      mem_req_tag,
  
  input                       mem_resp_val,
  input                       mem_resp_nack,
  input [`MEM_DATA_BITS-1:0]  mem_resp_data,
  input                       mem_resp_tag
);

  wire [`CPU_ADDR_BITS-`ceilLog2(`MEM_DATA_BITS/8)-1:0] ic_mem_req_addr, wide_mem_req_addr;
  wire ic_mem_req_val, ic_mem_req_rdy;
  wire ic_mem_resp_val, ic_mem_resp_nack;
  wire [`MEM_DATA_BITS-1:0] ic_mem_resp_data;

  ICache #
  (
    .LINES(256),
    .CPU_WIDTH(`CPU_INST_BITS),
    .WORD_ADDR_BITS(`CPU_ADDR_BITS-`ceilLog2(`CPU_INST_BITS/8))
  )
  wrap
  (
    .clk(clk),
    .reset(reset),

    .cpu_req_val(cpu_req_val),
    .cpu_req_rdy(cpu_req_rdy),
    .cpu_req_addr(cpu_req_addr),

    .cpu_resp_val(cpu_resp_val),
    .cpu_resp_data(cpu_resp_data),

    .mem_req_val(ic_mem_req_val),
    .mem_req_rdy(ic_mem_req_rdy),
    .mem_req_addr(ic_mem_req_addr),

    .mem_resp_val(ic_mem_resp_val),
    .mem_resp_nack(ic_mem_resp_nack),
    .mem_resp_data(ic_mem_resp_data)
  );
`ifndef IPREFETCH
  assign mem_req_val = ic_mem_req_val;
  assign ic_mem_req_rdy = mem_req_rdy;
  assign wide_mem_req_addr = ic_mem_req_addr;
  assign mem_req_tag = 1'b0;

  assign ic_mem_resp_val = mem_resp_val;
  assign ic_mem_resp_nack = mem_resp_nack;
  assign ic_mem_resp_data = mem_resp_data;
`else
  IPrefetcher #
  (
    .CPU_WIDTH(`CPU_INST_BITS),
    .WORD_ADDR_BITS(`CPU_ADDR_BITS-`ceilLog2(`CPU_INST_BITS/8))
  )
  prefetcher
  (
    .clk(clk),
    .reset(reset),

    .ic_mem_req_val(ic_mem_req_val),
    .ic_mem_req_rdy(ic_mem_req_rdy),
    .ic_mem_req_addr(ic_mem_req_addr),

    .ic_mem_resp_val(ic_mem_resp_val),
    .ic_mem_resp_nack(ic_mem_resp_nack),
    .ic_mem_resp_data(ic_mem_resp_data),

    .mem_req_val(mem_req_val),
    .mem_req_rdy(mem_req_rdy),
    .mem_req_addr(wide_mem_req_addr),
    .mem_req_tag(mem_req_tag),

    .mem_resp_val(mem_resp_val),
    .mem_resp_nack(mem_resp_nack),
    .mem_resp_data(mem_resp_data),
    .mem_resp_tag(mem_resp_tag)
  );
`endif

  assign mem_req_addr = wide_mem_req_addr[`MEM_ADDR_BITS-1:0];

endmodule

