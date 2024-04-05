`include "riscvConst.vh"
`include "macros.vh"

module resiliency_onecache
(
  input clk,
  input reset_core0,
  input reset_core1,
  input reset_l2,
  input reset_eds,

  output error_mode0,
  output error_mode1,

`ifndef ASIC
  output       console_out_val,
  input        console_out_rdy,
  output [7:0] console_out_bits,
`endif

  input                      htif_core0_fromhost_wen,
  input  [31:0]              htif_core0_fromhost,
  output [31:0]              htif_core0_tohost,

  input                      htif_core1_fromhost_wen,
  input  [31:0]              htif_core1_fromhost,
  output [31:0]              htif_core1_tohost,

  input  [15:0]              htif_eds_addr,
  input                      htif_eds_wen,
  input  [31:0]              htif_eds_wdata,
  output [31:0]              htif_eds_rdata,

  input                      htif_req_val,
  output                     htif_req_rdy,
  input                      htif_req_rw,
  input  [13:0]              htif_req_addr,
  input  [127:0]             htif_req_data,
  input  [`MEM_TAG_BITS-1:0] htif_req_tag,
  output                     htif_resp_val,
  output [127:0]             htif_resp_data,
  output [`MEM_TAG_BITS-1:0] htif_resp_tag
);

  wire         imem_cp_req_rdy;
  wire [31:0]  imem_cp_resp_data;

  wire         core0_imem_cp_req_val;
  wire [31:0]  core0_imem_cp_req_addr;
  wire         core0_imem_cp_resp_val;

  wire         core1_imem_cp_req_val;
  wire [31:0]  core1_imem_cp_req_addr;
  wire         core1_imem_cp_resp_val;

  wire         imem_cp_req_val;
  wire [31:0]  imem_cp_req_addr;
  wire         imem_cp_resp_val;

  wire         imem_vec_req_val;
  wire         imem_vec_req_rdy;
  wire [31:0]  imem_vec_req_addr;
  wire         imem_vec_resp_val;
  wire [31:0]  imem_vec_resp_data;

  wire         dcache_req_rdy;
  wire [127:0] dcache_resp_data;
  wire [14:0]  dcache_resp_tag;

  wire         core0_dcache_req_val;
  wire [3:0]   core0_dcache_req_op;
  wire [31:0]  core0_dcache_req_addr;
  wire [127:0] core0_dcache_req_data;
  wire [15:0]  core0_dcache_req_wmask;
  wire [14:0]  core0_dcache_req_tag;
  wire         core0_dcache_resp_val;

  wire         core1_dcache_req_val;
  wire [3:0]   core1_dcache_req_op;
  wire [31:0]  core1_dcache_req_addr;
  wire [127:0] core1_dcache_req_data;
  wire [15:0]  core1_dcache_req_wmask;
  wire [14:0]  core1_dcache_req_tag;
  wire         core1_dcache_resp_val;

  wire         dcache_req_val;
  wire [3:0]   dcache_req_op;
  wire [31:0]  dcache_req_addr;
  wire [127:0] dcache_req_data;
  wire [15:0]  dcache_req_wmask;
  wire [14:0]  dcache_req_tag;
  wire         dcache_resp_val;

  wire                        icc_mem_req_val;
  wire                        icc_mem_req_rdy;
  wire [`MEM_ADDR_BITS-1:0]   icc_mem_req_addr;
  wire                        icc_mem_req_tag;
  wire                        icc_mem_resp_val;
  wire                        icc_mem_resp_nack;

  wire                        icv_mem_req_val;
  wire                        icv_mem_req_rdy;
  wire [`MEM_ADDR_BITS-1:0]   icv_mem_req_addr;
  wire                        icv_mem_req_tag;
  wire                        icv_mem_resp_val;
  wire                        icv_mem_resp_nack;

  wire                        dc_mem_req_val;
  wire                        dc_mem_req_rdy;
  wire                        dc_mem_req_rw;
  wire [`MEM_ADDR_BITS-1:0]   dc_mem_req_addr;
  wire [`DC_MEM_TAG_BITS-1:0] dc_mem_req_tag;
  wire                        dc_mem_resp_val;
  wire                        dc_mem_resp_nack;

  wire                      refill_req_val;
  wire                      refill_req_rdy;
  wire                      refill_req_rw;
  wire [`MEM_ADDR_BITS-1:0] refill_req_addr;
  wire [`MEM_DATA_BITS-1:0] refill_req_data;
  wire [`MEM_TAG_BITS-1:0]  refill_req_tag;

  wire                      refill_resp_val;
  wire                      refill_resp_nack;
  wire [`MEM_DATA_BITS-1:0] refill_resp_data;
  wire [`MEM_TAG_BITS-1:0]  refill_resp_tag;

  wire                       mem_req_val;
  wire                       mem_req_rdy;
  wire [1:0]                 mem_req_rw;
  wire [`MEM_ADDR_BITS-1:0]  mem_req_addr;
  wire [`MEM_DATA_BITS-1:0]  mem_req_data;
  wire [`MEM_L2TAG_BITS-1:0] mem_req_tag;

  wire                       mem_resp_val;
  wire                       mem_resp_nack;
  wire [`MEM_DATA_BITS-1:0]  mem_resp_data;
  wire [`MEM_L2TAG_BITS-1:0] mem_resp_tag;

  riscvCoreNoCache #(.COREID(1), .HAS_FPU(1), .HAS_VECTOR(1)) core0
  (
    .clk(clk),
    .reset(reset_core0),

    .error_mode(error_mode0),
    .log_control(),

    .htif_fromhost_wen(htif_core0_fromhost_wen),
    .htif_fromhost(htif_core0_fromhost),
    .htif_tohost(htif_core0_tohost),

`ifndef ASIC
    .console_out_val(console_out_val),
    .console_out_rdy(console_out_rdy),
    .console_out_bits(console_out_bits),
`else
    .console_out_val(),
    .console_out_rdy(1'b1),
    .console_out_bits(),
`endif

    .imem_cp_req_val(core0_imem_cp_req_val),
    .imem_cp_req_rdy(imem_cp_req_rdy),
    .imem_cp_req_addr(core0_imem_cp_req_addr),
    .imem_cp_resp_val(core0_imem_cp_resp_val),
    .imem_cp_resp_data(imem_cp_resp_data),

    .imem_vec_req_val(imem_vec_req_val),
    .imem_vec_req_rdy(imem_vec_req_rdy),
    .imem_vec_req_addr(imem_vec_req_addr),
    .imem_vec_resp_val(imem_vec_resp_val),
    .imem_vec_resp_data(imem_vec_resp_data),

    .dcache_req_val(core0_dcache_req_val),
    .dcache_req_rdy(dcache_req_rdy),
    .dcache_req_op(core0_dcache_req_op),
    .dcache_req_addr(core0_dcache_req_addr),
    .dcache_req_data(core0_dcache_req_data),
    .dcache_req_wmask(core0_dcache_req_wmask),
    .dcache_req_tag(core0_dcache_req_tag),
    .dcache_resp_val(core0_dcache_resp_val),
    .dcache_resp_data(dcache_resp_data),
    .dcache_resp_tag(dcache_resp_tag)
  );

  wire [31:0]  cpu_eds1_en;
  wire [7:0]   cpu_eds2_en;
  wire [31:0]  cpu_eds1_err;
  wire [255:0] cpu_eds2_err;

  EDS_riscvCoreNoCache #(.COREID(2), .HAS_FPU(0), .HAS_VECTOR(0)) core1
  (
    .clk(clk),
    .reset(reset_core1),

    .error_mode(error_mode1),
    .log_control(),

    .cpu_eds1_en(cpu_eds1_en),
    .cpu_eds2_en(cpu_eds2_en),
    .cpu_eds1_err(cpu_eds1_err),
    .cpu_eds2_err(cpu_eds2_err),

    .htif_fromhost_wen(htif_core1_fromhost_wen),
    .htif_fromhost(htif_core1_fromhost),
    .htif_tohost(htif_core1_tohost),

    .console_out_val(),
    .console_out_rdy(1'b1),
    .console_out_bits(),

    .imem_cp_req_val(core1_imem_cp_req_val),
    .imem_cp_req_rdy(imem_cp_req_rdy),
    .imem_cp_req_addr(core1_imem_cp_req_addr),
    .imem_cp_resp_val(core1_imem_cp_resp_val),
    .imem_cp_resp_data(imem_cp_resp_data),

    .imem_vec_req_val(),
    .imem_vec_req_rdy(),
    .imem_vec_req_addr(),
    .imem_vec_resp_val(),
    .imem_vec_resp_data(),

    .dcache_req_val(core1_dcache_req_val),
    .dcache_req_rdy(dcache_req_rdy),
    .dcache_req_op(core1_dcache_req_op),
    .dcache_req_addr(core1_dcache_req_addr),
    .dcache_req_data(core1_dcache_req_data),
    .dcache_req_wmask(core1_dcache_req_wmask),
    .dcache_req_tag(core1_dcache_req_tag),
    .dcache_resp_val(core1_dcache_resp_val),
    .dcache_resp_data(dcache_resp_data),
    .dcache_resp_tag(dcache_resp_tag)
  );

  wire masked_core0_imem_cp_req_val
    = core0_imem_cp_req_val & ~reset_core0;

  wire masked_core1_imem_cp_req_val
    = core1_imem_cp_req_val & ~reset_core1;

  assign imem_cp_req_val
    = masked_core0_imem_cp_req_val | masked_core1_imem_cp_req_val;

  assign imem_cp_req_addr
    = masked_core0_imem_cp_req_val ? core0_imem_cp_req_addr
    : core1_imem_cp_req_addr;

  assign core0_imem_cp_resp_val = imem_cp_resp_val & ~reset_core0;
  assign core1_imem_cp_resp_val = imem_cp_resp_val & ~reset_core1;

  ICache_cp_wrap icache_cp
  (
    .clk(clk),
    .reset(reset_core0 & reset_core1),

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
    .mem_resp_data(refill_resp_data),
    .mem_resp_tag(refill_resp_tag[0])
  );

  ICache_vec_wrap icache_vec
  (
    .clk(clk),
    .reset(reset_core0 & reset_core1),

    .cpu_req_val(imem_vec_req_val),
    .cpu_req_rdy(imem_vec_req_rdy),
    .cpu_req_addr(imem_vec_req_addr[17:2]),

    .cpu_resp_val(imem_vec_resp_val),
    .cpu_resp_data(imem_vec_resp_data),

    .mem_req_val(icv_mem_req_val),
    .mem_req_rdy(icv_mem_req_rdy),
    .mem_req_addr(icv_mem_req_addr),
    .mem_req_tag(icv_mem_req_tag),

    .mem_resp_val(icv_mem_resp_val),
    .mem_resp_nack(icv_mem_resp_nack),
    .mem_resp_data(refill_resp_data),
    .mem_resp_tag(refill_resp_tag[0])
  );

  wire masked_core0_dcache_req_val
    = core0_dcache_req_val & ~reset_core0;

  wire masked_core1_dcache_req_val
    = core1_dcache_req_val & ~reset_core1;

  assign dcache_req_val
    = masked_core0_dcache_req_val | masked_core1_dcache_req_val;

  assign dcache_req_op
    = masked_core0_dcache_req_val ? core0_dcache_req_op
    : core1_dcache_req_op;

  assign dcache_req_addr
    = masked_core0_dcache_req_val ? core0_dcache_req_addr
    : core1_dcache_req_addr;

  assign dcache_req_data
    = masked_core0_dcache_req_val ? core0_dcache_req_data
    : core1_dcache_req_data;

  assign dcache_req_wmask
    = masked_core0_dcache_req_val ? core0_dcache_req_wmask
    : core1_dcache_req_wmask;

  assign dcache_req_tag
    = masked_core0_dcache_req_val ? core0_dcache_req_tag
    : core1_dcache_req_tag;

  assign core0_dcache_resp_val
    = dcache_resp_val & ~reset_core0;

  assign core1_dcache_resp_val
    = dcache_resp_val & ~reset_core1;

  wire [`CPU_ADDR_BITS-`ceilLog2(`MEM_DATA_BITS/8)-1:0] hc_mem_req_addr;
  assign dc_mem_req_addr = hc_mem_req_addr[`MEM_ADDR_BITS-1:0];

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
    .reset(reset_core0 & reset_core1),

    .cpu_req_val(dcache_req_val),
    .cpu_req_rdy(dcache_req_rdy),
    .cpu_req_op(dcache_req_op),
    .cpu_req_addr(dcache_req_addr[17:4]),
    .cpu_req_data(dcache_req_data),
    .cpu_req_wmask(dcache_req_wmask),
    .cpu_req_tag(dcache_req_tag),

    .cpu_resp_val(dcache_resp_val),
    .cpu_resp_data(dcache_resp_data),
    .cpu_resp_tag(dcache_resp_tag),

    .mem_req_val(dc_mem_req_val),
    .mem_req_rdy(dc_mem_req_rdy),
    .mem_req_rw(dc_mem_req_rw),
    .mem_req_addr(hc_mem_req_addr),
    .mem_req_data(refill_req_data),
    .mem_req_tag(dc_mem_req_tag),

    .mem_resp_val(dc_mem_resp_val),
    .mem_resp_nack(dc_mem_resp_nack),
    .mem_resp_data(refill_resp_data),
    .mem_resp_tag(refill_resp_tag[`DC_MEM_TAG_BITS-1:0])
  );

  xbarCacheRefill_3ports xbarRefill
  (
    .clk(clk),
    .reset(reset_core0 & reset_core1),

    .icc_mem_req_val(icc_mem_req_val),
    .icc_mem_req_rdy(icc_mem_req_rdy),
    .icc_mem_req_addr(icc_mem_req_addr),
    .icc_mem_req_tag(icc_mem_req_tag),
    .icc_mem_resp_val(icc_mem_resp_val),
    .icc_mem_resp_nack(icc_mem_resp_nack),

    .icv_mem_req_val(icv_mem_req_val),
    .icv_mem_req_rdy(icv_mem_req_rdy),
    .icv_mem_req_addr(icv_mem_req_addr),
    .icv_mem_req_tag(icv_mem_req_tag),
    .icv_mem_resp_val(icv_mem_resp_val),
    .icv_mem_resp_nack(icv_mem_resp_nack),

    .dc_mem_req_val(dc_mem_req_val),
    .dc_mem_req_rdy(dc_mem_req_rdy),
    .dc_mem_req_rw(dc_mem_req_rw),
    .dc_mem_req_addr(dc_mem_req_addr),
    .dc_mem_req_tag(dc_mem_req_tag),
    .dc_mem_resp_val(dc_mem_resp_val),
    .dc_mem_resp_nack(dc_mem_resp_nack),

    .mem_req_val(refill_req_val),
    .mem_req_rdy(refill_req_rdy),
    .mem_req_rw(refill_req_rw),
    .mem_req_addr(refill_req_addr),
    .mem_req_tag(refill_req_tag),
    .mem_resp_val(refill_resp_val),
    .mem_resp_nack(refill_resp_nack),
    .mem_resp_tag(refill_resp_tag)
  );

  // note that mem_req_rw is two bits
  // mem_req_rw = 2'b00, 4 loads
  // mem_req_rw = 2'b01, normal store
  // mem_req_rw = 2'b10, 1 load (only for the htif)
  // mem_req_rw = 2'b11, htif store

  xbarCoreL2 xbar
  (
    .htif_req_val(htif_req_val),
    .htif_req_rdy(htif_req_rdy),
    .htif_req_rw(htif_req_rw),
    .htif_req_addr(htif_req_addr),
    .htif_req_data(htif_req_data),
    .htif_req_tag(htif_req_tag),

    .htif_resp_val(htif_resp_val),
    .htif_resp_nack(),
    .htif_resp_data(htif_resp_data),
    .htif_resp_tag(htif_resp_tag),

    .core0_req_val(refill_req_val),
    .core0_req_rdy(refill_req_rdy),
    .core0_req_rw(refill_req_rw),
    .core0_req_addr(refill_req_addr),
    .core0_req_data(refill_req_data),
    .core0_req_tag(refill_req_tag),

    .core0_resp_val(refill_resp_val),
    .core0_resp_nack(refill_resp_nack),
    .core0_resp_data(refill_resp_data),
    .core0_resp_tag(refill_resp_tag),

    .core1_req_val(1'b0),
    .core1_req_rdy(),
    .core1_req_rw(),
    .core1_req_addr(),
    .core1_req_data(),
    .core1_req_tag(),

    .core1_resp_val(),
    .core1_resp_nack(),
    .core1_resp_data(),
    .core1_resp_tag(),

    .mem_req_val(mem_req_val),
    .mem_req_rdy(mem_req_rdy),
    .mem_req_rw(mem_req_rw),
    .mem_req_addr(mem_req_addr),
    .mem_req_data(mem_req_data),
    .mem_req_tag(mem_req_tag),

    .mem_resp_val(mem_resp_val),
    .mem_resp_nack(mem_resp_nack),
    .mem_resp_data(mem_resp_data),
    .mem_resp_tag(mem_resp_tag)
  );

  sramL2_64K l2
  (
    .clk(clk),
    .reset(reset_l2),

    .mem_req_val(mem_req_val),
    .mem_req_rdy(mem_req_rdy),
    .mem_req_rw(mem_req_rw),
    .mem_req_addr(mem_req_addr[11:0]),
    .mem_req_data(mem_req_data),
    .mem_req_tag(mem_req_tag),

    .mem_resp_val(mem_resp_val),
    .mem_resp_nack(mem_resp_nack),
    .mem_resp_data(mem_resp_data),
    .mem_resp_tag(mem_resp_tag)
  );

  EDS_top eds
  (
    .clk(clk),
    .reset(reset_eds),

    .htif_addr(htif_eds_addr),
    .htif_wen(htif_eds_wen),
    .htif_wdata(htif_eds_wdata),
    .htif_rdata(htif_eds_rdata),

    .cpu_eds1_en(cpu_eds1_en),
    .cpu_eds2_en(cpu_eds2_en),
    .cpu_eds1_err(cpu_eds1_err),
    .cpu_eds2_err(cpu_eds2_err)
  );

endmodule
