`include "riscvConst.vh"

module resiliency
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

  wire                      core0_req_val;
  wire                      core0_req_rdy;
  wire                      core0_req_rw;
  wire [`MEM_ADDR_BITS-1:0] core0_req_addr;
  wire [`MEM_DATA_BITS-1:0] core0_req_data;
  wire [`MEM_TAG_BITS-1:0]  core0_req_tag;

  wire                      core0_resp_val;
  wire                      core0_resp_nack;
  wire [`MEM_DATA_BITS-1:0] core0_resp_data;
  wire [`MEM_TAG_BITS-1:0]  core0_resp_tag;

  wire                      core1_req_val;
  wire                      core1_req_rdy;
  wire                      core1_req_rw;
  wire [`MEM_ADDR_BITS-1:0] core1_req_addr;
  wire [`MEM_DATA_BITS-1:0] core1_req_data;
  wire [`MEM_TAG_BITS-1:0]  core1_req_tag;

  wire                      core1_resp_val;
  wire                      core1_resp_nack;
  wire [`MEM_DATA_BITS-1:0] core1_resp_data;
  wire [`MEM_TAG_BITS-1:0]  core1_resp_tag;

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

  assign core0_req_val = 1'b0;

  riscvCore #(.COREID(2), .HAS_FPU(0), .HAS_VECTOR(0)) core1
  (
    .clk(clk),
    .reset(reset_core1),

    .error_mode(error_mode1),
    .log_control(),

    //.cpu_eds1_en(cpu_eds1_en),
    //.cpu_eds2_en(cpu_eds2_en),
    //.cpu_eds1_err(cpu_eds1_err),
    //.cpu_eds2_err(cpu_eds2_err),

    .htif_fromhost_wen(htif_core1_fromhost_wen),
    .htif_fromhost(htif_core1_fromhost),
    .htif_tohost(htif_core1_tohost),

    .console_out_val(),
    .console_out_rdy(1'b1),
    .console_out_bits(),

    .mem_req_val(core1_req_val),
    .mem_req_rdy(core1_req_rdy),
    .mem_req_rw(core1_req_rw),
    .mem_req_addr(core1_req_addr),
    .mem_req_data(core1_req_data),
    .mem_req_tag(core1_req_tag),

    .mem_resp_val(core1_resp_val),
    .mem_resp_nack(core1_resp_nack),
    .mem_resp_data(core1_resp_data),
    .mem_resp_tag(core1_resp_tag)
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

    .core0_req_val(core0_req_val & ~reset_core0),
    .core0_req_rdy(core0_req_rdy),
    .core0_req_rw(core0_req_rw),
    .core0_req_addr(core0_req_addr),
    .core0_req_data(core0_req_data),
    .core0_req_tag(core0_req_tag),

    .core0_resp_val(core0_resp_val),
    .core0_resp_nack(core0_resp_nack),
    .core0_resp_data(core0_resp_data),
    .core0_resp_tag(core0_resp_tag),

    .core1_req_val(core1_req_val & ~reset_core1),
    .core1_req_rdy(core1_req_rdy),
    .core1_req_rw(core1_req_rw),
    .core1_req_addr(core1_req_addr),
    .core1_req_data(core1_req_data),
    .core1_req_tag(core1_req_tag),

    .core1_resp_val(core1_resp_val),
    .core1_resp_nack(core1_resp_nack),
    .core1_resp_data(core1_resp_data),
    .core1_resp_tag(core1_resp_tag),

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

endmodule
