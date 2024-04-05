module resiliency
(
  input clk,
  input reset,

  output error_mode,

  input                      htif_start,
  input                      htif_fromhost_wen,
  input  [31:0]              htif_fromhost,
  output [31:0]              htif_tohost,

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
/*`
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
*/

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

  riscvCore core0
  (
    .clk(clk),
    .reset(reset),

    .error_mode(error_mode),
    .log_control(),

    .htif_start(htif_start),
    .htif_fromhost_wen(htif_fromhost_wen),
    .htif_fromhost(htif_fromhost),
    .htif_tohost(htif_tohost),

    .console_out_val(),
    .console_out_rdy(),
    .console_out_bits(),

    .mem_req_val(core0_req_val),
    .mem_req_rdy(core0_req_rdy),
    .mem_req_rw(core0_req_rw),
    .mem_req_addr(core0_req_addr),
    .mem_req_data(core0_req_data),
    .mem_req_tag(core0_req_tag),

    .mem_resp_val(core0_resp_val),
    .mem_resp_nack(core0_resp_nack),
    .mem_resp_data(core0_resp_data),
    .mem_resp_tag(core0_resp_tag)
  );

  // note that mem_req_rw is two bits
  // mem_req_rw = 2'b00, 4 loads
  // mem_req_rw = 2'b01, normal store
  // mem_req_rw = 2'b10, 1 load (only for the htif)
  // mem_req_rw = 2'b11, htif store (same as normal store)

  xbarCoreL2_scalar xbar
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

    .core0_req_val(core0_req_val),
    .core0_req_rdy(core0_req_rdy),
    .core0_req_rw(core0_req_rw),
    .core0_req_addr(core0_req_addr),
    .core0_req_data(core0_req_data),
    .core0_req_tag(core0_req_tag),

    .core0_resp_val(core0_resp_val),
    .core0_resp_nack(core0_resp_nack),
    .core0_resp_data(core0_resp_data),
    .core0_resp_tag(core0_resp_tag),

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

  sramL2_256K l2
  (
    .clk(clk),
    .reset(reset),

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

/*
  sramL2 l2
  (
    .clk(clk),
    .reset(reset),

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
*/
endmodule
