`include "riscvConst.vh"

module xbarCacheRefill_2ports
(
  input clk,
  input reset,

  input                       ic_mem_req_val,
  output                      ic_mem_req_rdy,
  input [`MEM_ADDR_BITS-1:0]  ic_mem_req_addr,
  output                      ic_mem_resp_val,

  input                       dc_mem_req_val,
  output                      dc_mem_req_rdy,
  input                       dc_mem_req_rw,
  input [`MEM_ADDR_BITS-1:0]  dc_mem_req_addr,
  input [`DC_MEM_TAG_BITS-1:0]dc_mem_req_tag,
  output                      dc_mem_resp_val,

  output                      mem_req_val,
  input                       mem_req_rdy,
  output                      mem_req_rw,
  output [`MEM_ADDR_BITS-1:0] mem_req_addr,
  output [`MEM_TAG_BITS-1:0]  mem_req_tag,
  input                       mem_resp_val,
  input [`MEM_TAG_BITS-1:0]   mem_resp_tag
);

  assign dc_mem_req_rdy = mem_req_rdy;
  assign ic_mem_req_rdy = mem_req_rdy & ~dc_mem_req_val;

  assign mem_req_val = dc_mem_req_val | ic_mem_req_val;
  assign mem_req_rw
    = dc_mem_req_val ? dc_mem_req_rw
    : 1'b0;
  assign mem_req_addr
    = dc_mem_req_val ? dc_mem_req_addr
    : ic_mem_req_addr;
  assign mem_req_tag
    = dc_mem_req_val ? {2'b00, dc_mem_req_tag}
    : {1'b1,{`MEM_TAG_BITS-1{1'b0}}};

  assign dc_mem_resp_val = mem_resp_val & (mem_resp_tag[`MEM_TAG_BITS-1] == 1'b0);
  assign ic_mem_resp_val = mem_resp_val & (mem_resp_tag[`MEM_TAG_BITS-1] == 1'b1);

endmodule
