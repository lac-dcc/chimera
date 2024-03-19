module riscvDCacheArbiter
(
  input clk,
  input reset,
 
  input         htif_req_val,
  output        htif_req_rdy,
  input [3:0]   htif_req_op,
  input [31:0]  htif_req_addr,
  input [63:0]  htif_req_data,
  input [7:0]   htif_req_wmask,
  input [11:0]  htif_req_tag,
  output        htif_resp_val,
 
  input         dmem_req_val,
  output        dmem_req_rdy,
  input [3:0]   dmem_req_op,
  input [31:0]  dmem_req_addr,
  input [63:0]  dmem_req_data,
  input [7:0]   dmem_req_wmask,
  input [11:0]  dmem_req_tag,
  output        dmem_resp_val,
 
  output        dcache_req_val,
  input         dcache_req_rdy,
  output [3:0]  dcache_req_op,
  output [31:0] dcache_req_addr,
  output [63:0] dcache_req_data,
  output [7:0]  dcache_req_wmask,
  output [12:0] dcache_req_tag,
  input         dcache_resp_val,
  input         dcache_resp_tag_msb
);

  reg reg_htif_req_rdy;
  reg reg_dmem_req_rdy;

  wire next_htif_req_rdy = dcache_req_rdy;
  wire next_dmem_req_rdy = dcache_req_rdy & ~htif_req_val;

  always @(negedge clk)
  begin
    if (reset)
    begin
      reg_htif_req_rdy <= 1'b0;
      reg_dmem_req_rdy <= 1'b0;
    end
    else
    begin
      reg_htif_req_rdy <= next_htif_req_rdy;
      reg_dmem_req_rdy <= next_dmem_req_rdy;
    end
  end

  assign htif_req_rdy = reg_htif_req_rdy;
  assign dmem_req_rdy = reg_dmem_req_rdy;

  assign dcache_req_val = htif_req_val | dmem_req_val;
  assign dcache_req_op
    = htif_req_val ? htif_req_op
    : dmem_req_op;
  assign dcache_req_addr
    = htif_req_val ? htif_req_addr
    : dmem_req_addr;
  assign dcache_req_data
    = htif_req_val ? htif_req_data
    : dmem_req_data;
  assign dcache_req_wmask
    = htif_req_val ? htif_req_wmask
    : dmem_req_wmask;
  assign dcache_req_tag
    = htif_req_val ? {1'b0, htif_req_tag}
    : {1'b1, dmem_req_tag};

  assign htif_resp_val = dcache_resp_val & (dcache_resp_tag_msb == 1'b0);
  assign dmem_resp_val = dcache_resp_val & (dcache_resp_tag_msb == 1'b1);

endmodule
