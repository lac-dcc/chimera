`include "riscvConst.vh"

module xbarCoreL2
(
  input                       htif_req_val,
  output                      htif_req_rdy,
  input                       htif_req_rw,
  input  [`MEM_ADDR_BITS-1:0] htif_req_addr,
  input  [`MEM_DATA_BITS-1:0] htif_req_data,
  input  [`MEM_TAG_BITS-1:0]  htif_req_tag,

  output                      htif_resp_val,
  output                      htif_resp_nack,
  output [`MEM_DATA_BITS-1:0] htif_resp_data,
  output [`MEM_TAG_BITS-1:0]  htif_resp_tag,

  input                       core0_req_val,
  output                      core0_req_rdy,
  input                       core0_req_rw,
  input  [`MEM_ADDR_BITS-1:0] core0_req_addr,
  input  [`MEM_DATA_BITS-1:0] core0_req_data,
  input  [`MEM_TAG_BITS-1:0]  core0_req_tag,

  output                      core0_resp_val,
  output                      core0_resp_nack,
  output [`MEM_DATA_BITS-1:0] core0_resp_data,
  output [`MEM_TAG_BITS-1:0]  core0_resp_tag,

  input                       core1_req_val,
  output                      core1_req_rdy,
  input                       core1_req_rw,
  input  [`MEM_ADDR_BITS-1:0] core1_req_addr,
  input  [`MEM_DATA_BITS-1:0] core1_req_data,
  input  [`MEM_TAG_BITS-1:0]  core1_req_tag,

  output                      core1_resp_val,
  output                      core1_resp_nack,
  output [`MEM_DATA_BITS-1:0] core1_resp_data,
  output [`MEM_TAG_BITS-1:0]  core1_resp_tag,

  output                       mem_req_val,
  input                        mem_req_rdy,
  output [1:0]                 mem_req_rw,
  output [`MEM_ADDR_BITS-1:0]  mem_req_addr,
  output [`MEM_DATA_BITS-1:0]  mem_req_data,
  output [`MEM_L2TAG_BITS-1:0] mem_req_tag,

  input                        mem_resp_val,
  input                        mem_resp_nack,
  input  [`MEM_DATA_BITS-1:0]  mem_resp_data,
  input  [`MEM_L2TAG_BITS-1:0] mem_resp_tag
);

  assign htif_req_rdy = mem_req_rdy;
  assign core0_req_rdy = mem_req_rdy & ~htif_req_val;
  assign core1_req_rdy = mem_req_rdy & ~htif_req_val;

  assign mem_req_val = htif_req_val | core0_req_val | core1_req_val;

  assign mem_req_rw
    = htif_req_val ? {1'b1, htif_req_rw}
    : core0_req_val ? {1'b0, core0_req_rw}
    : {1'b0, core1_req_rw};

  assign mem_req_addr
    = htif_req_val ? htif_req_addr
    : core0_req_val ? core0_req_addr
    : core1_req_addr;

  assign mem_req_data
    = htif_req_val ? htif_req_data
    : core0_req_val ? core0_req_data
    : core1_req_data;

  assign mem_req_tag
    = htif_req_val ? {2'd0, htif_req_tag}
    : core0_req_val ? {2'd1, core0_req_tag}
    : {2'd2, core1_req_tag};

  assign htif_resp_val = mem_resp_val & (mem_resp_tag[`MEM_L2TAG_BITS-1:`MEM_L2TAG_BITS-2] == 2'd0);
  assign core0_resp_val = mem_resp_val & (mem_resp_tag[`MEM_L2TAG_BITS-1:`MEM_L2TAG_BITS-2] == 2'd1);
  assign core1_resp_val = mem_resp_val & (mem_resp_tag[`MEM_L2TAG_BITS-1:`MEM_L2TAG_BITS-2] == 2'd2);

  assign htif_resp_nack = mem_resp_nack & (mem_resp_tag[`MEM_L2TAG_BITS-1:`MEM_L2TAG_BITS-2] == 2'd0);
  assign core0_resp_nack = mem_resp_nack & (mem_resp_tag[`MEM_L2TAG_BITS-1:`MEM_L2TAG_BITS-2] == 2'd1);
  assign core1_resp_nack = mem_resp_nack & (mem_resp_tag[`MEM_L2TAG_BITS-1:`MEM_L2TAG_BITS-2] == 2'd2);

  assign htif_resp_data = mem_resp_data;
  assign core0_resp_data = mem_resp_data;
  assign core1_resp_data = mem_resp_data;

  assign htif_resp_tag = mem_resp_tag[`MEM_TAG_BITS-1:0];
  assign core0_resp_tag = mem_resp_tag[`MEM_TAG_BITS-1:0];
  assign core1_resp_tag = mem_resp_tag[`MEM_TAG_BITS-1:0];

endmodule
