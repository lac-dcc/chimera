`include "riscvConst.vh"

module xbarCacheRefill_3ports
(
  input clk,
  input reset,

  input                       icc_mem_req_val,
  output                      icc_mem_req_rdy,
  input [`MEM_ADDR_BITS-1:0]  icc_mem_req_addr,
  input                       icc_mem_req_tag,
  output                      icc_mem_resp_val,
  output                      icc_mem_resp_nack,

  input                       icv_mem_req_val,
  output                      icv_mem_req_rdy,
  input [`MEM_ADDR_BITS-1:0]  icv_mem_req_addr,
  input                       icv_mem_req_tag,
  output                      icv_mem_resp_val,
  output                      icv_mem_resp_nack,

  input                       dc_mem_req_val,
  output                      dc_mem_req_rdy,
  input                       dc_mem_req_rw,
  input [`MEM_ADDR_BITS-1:0]  dc_mem_req_addr,
  input [`DC_MEM_TAG_BITS-1:0]dc_mem_req_tag,
  output                      dc_mem_resp_val,
  output                      dc_mem_resp_nack,

  output                      mem_req_val,
  input                       mem_req_rdy,
  output                      mem_req_rw,
  output [`MEM_ADDR_BITS-1:0] mem_req_addr,
  output [`MEM_TAG_BITS-1:0]  mem_req_tag,
  input                       mem_resp_val,
  input                       mem_resp_nack,
  input [`MEM_TAG_BITS-1:0]   mem_resp_tag
);

  assign dc_mem_req_rdy = mem_req_rdy;
  assign icc_mem_req_rdy = mem_req_rdy & ~dc_mem_req_val;
  assign icv_mem_req_rdy = mem_req_rdy & ~dc_mem_req_val & ~icc_mem_req_val;

  assign mem_req_val = dc_mem_req_val | icc_mem_req_val | icv_mem_req_val;
  assign mem_req_rw
    = dc_mem_req_val ? dc_mem_req_rw
    : icc_mem_req_val ? 1'b0
    : 1'b0;
  assign mem_req_addr
    = dc_mem_req_val ? dc_mem_req_addr
    : icc_mem_req_val ? icc_mem_req_addr
    : icv_mem_req_addr;
  assign mem_req_tag
    = dc_mem_req_val ? {2'd0, dc_mem_req_tag}
    : icc_mem_req_val ? {2'd1, {`DC_MEM_TAG_BITS-1{1'b0}}, icc_mem_req_tag}
    : {2'd2, {`DC_MEM_TAG_BITS-1{1'b0}}, icv_mem_req_tag};

  assign dc_mem_resp_val = mem_resp_val & (mem_resp_tag[`MEM_TAG_BITS-1:`MEM_TAG_BITS-2] == 2'd0);
  assign icc_mem_resp_val = mem_resp_val & (mem_resp_tag[`MEM_TAG_BITS-1:`MEM_TAG_BITS-2] == 2'd1);
  assign icv_mem_resp_val = mem_resp_val & (mem_resp_tag[`MEM_TAG_BITS-1:`MEM_TAG_BITS-2] == 2'd2);

  assign dc_mem_resp_nack = mem_resp_nack & (mem_resp_tag[`MEM_TAG_BITS-1:`MEM_TAG_BITS-2] == 2'd0);
  assign icc_mem_resp_nack = mem_resp_nack & (mem_resp_tag[`MEM_TAG_BITS-1:`MEM_TAG_BITS-2] == 2'd1);
  assign icv_mem_resp_nack = mem_resp_nack & (mem_resp_tag[`MEM_TAG_BITS-1:`MEM_TAG_BITS-2] == 2'd2);

endmodule
