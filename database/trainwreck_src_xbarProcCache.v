module xbarProcCache
(
  input clk,
  input reset,

  output [31:0]  dcache_req_addr,
  output [3:0]   dcache_req_op,
  output [127:0] dcache_req_data,
  output [15:0]  dcache_req_wmask,
  output [14:0]  dcache_req_tag,
  output         dcache_req_val,
  input          dcache_req_rdy,

  input          dcache_resp_val,
  input [127:0]  dcache_resp_data,
  input [14:0]   dcache_resp_tag,

  // VMU UT interface
  input [31:0] dmem_req2_addr,
  input [3:0]  dmem_req2_op,
  input [63:0] dmem_req2_data,
  input [7:0]  dmem_req2_wmask,
  input [11:0] dmem_req2_tag,
  input        dmem_req2_val,
  output       dmem_req2_rdy,
  output       dmem_resp2_val,

  // VMU Vector ld/st interface
  input [31:0]  dmem_req3_addr,
  input [3:0]   dmem_req3_op,
  input [127:0] dmem_req3_data,
  input [15:0]  dmem_req3_wmask,
  input [11:0]  dmem_req3_tag,
  input         dmem_req3_val,
  output        dmem_req3_rdy,
  output        dmem_resp3_val,

  // CP interface
  input [31:0] dmem_req4_addr,
  input [3:0]  dmem_req4_op,
  input [63:0] dmem_req4_data,
  input [7:0]  dmem_req4_wmask,
  input [11:0] dmem_req4_tag,
  input        dmem_req4_val,
  output       dmem_req4_rdy,
  output       dmem_resp4_val,

  output [11:0]  dmem_resp_tag,
  output [63:0]  dmem_resp_data64,
  output [127:0] dmem_resp_data128
);

  wire [63:0]  dmem_req_data64;
  wire [127:0] dmem_req_data128;
  wire [7:0]   dmem_req_wmask8;
  wire [15:0]  dmem_req_wmask16;
  wire         dmem_req_wordsel;

  assign dmem_req2_rdy = dcache_req_rdy;
  assign dmem_req3_rdy = dcache_req_rdy & ~dmem_req2_val;
  assign dmem_req4_rdy = dcache_req_rdy & ~dmem_req2_val & ~dmem_req3_val;

  assign dcache_req_val = dmem_req2_val | dmem_req3_val | dmem_req4_val;

  assign dmem_req_data64
    = dmem_req2_val ? dmem_req2_data
    : dmem_req4_data;

  assign dmem_req_wmask8
    = dmem_req2_val ? dmem_req2_wmask
    : dmem_req4_wmask;

  assign dmem_req_wordsel
    = dmem_req2_val ? dmem_req2_addr[3]
    : dmem_req4_addr[3];

  assign dmem_req_data128 = {{2{dmem_req_data64}}};

  assign dmem_req_wmask16
    = (dmem_req_wordsel == 1'b0) ? {8'd0, dmem_req_wmask8}
    : {dmem_req_wmask8, 8'd0};

  assign dmem_resp_data128 = dcache_resp_data;

  assign dmem_resp_data64
    = (dcache_resp_tag[12] == 1'b0) ? dcache_resp_data[63:0]
    : dcache_resp_data[127:64];

  assign dmem_resp_tag  = dcache_resp_tag[11:0];
  assign dmem_resp2_val = dcache_resp_val & (dcache_resp_tag[14:13] == 2'b01);
  assign dmem_resp3_val = dcache_resp_val & (dcache_resp_tag[14:13] == 2'b10);
  assign dmem_resp4_val = dcache_resp_val & (dcache_resp_tag[14:13] == 2'b11);

  assign dcache_req_addr
    = dmem_req2_val ? dmem_req2_addr
    : dmem_req3_val ? dmem_req3_addr
    : dmem_req4_addr;

  assign dcache_req_data
    = dmem_req2_val ? dmem_req_data128
    : dmem_req3_val ? dmem_req3_data
    : dmem_req_data128;

  assign dcache_req_op
    = dmem_req2_val ? dmem_req2_op
    : dmem_req3_val ? dmem_req3_op
    : dmem_req4_op;

  assign dcache_req_wmask
    = dmem_req2_val ? dmem_req_wmask16
    : dmem_req3_val ? dmem_req3_wmask
    : dmem_req_wmask16;

  assign dcache_req_tag
    = dmem_req2_val ? {2'b01, dmem_req2_addr[3], dmem_req2_tag}
    : dmem_req3_val ? {2'b10, 1'b0, dmem_req3_tag}
    : {2'b11, dmem_req4_addr[3], dmem_req4_tag};

endmodule
