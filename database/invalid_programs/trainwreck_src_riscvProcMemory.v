`include "riscvConst.vh"
`include "fpu_common.v"

module riscvProcMemory
(
  input clk,
  input reset,

  input mem_mrq_val,
  input [3:0] mem_mrq_cmd,
  input [2:0] mem_mrq_type,

  input [63:0] dpath_rs2,
  input [4:0] dpath_waddr,
  input [63:0] dpath_alu_out,

  input fpu_fsdq_val,
  input [`FPR_WIDTH-1:0] fpu_fsdq_bits,

  output        dmem_req_val,
  input         dmem_req_rdy,
  output [3:0]  dmem_req_op,
  output [31:0] dmem_req_addr,
  output [63:0] dmem_req_data,
  output [7:0]  dmem_req_wmask,
  output [11:0] dmem_req_tag,

  output mem_mrq_deq,
  output fpu_fsdq_deq,

  input  fpu_flaq_enq,
  output fpu_flaq_deq
);

  wire mrq_enq_xf;
  wire [3:0] mrq_enq_op;
  wire [2:0] mrq_enq_type;

  wire mrq_deq_xf;
  wire [3:0] mrq_deq_op;
  wire [2:0] mrq_deq_type;
  wire [4:0] mrq_deq_waddr;
  wire [31:0] mrq_deq_addr;

  wire [63:0] xsdq_deq_wdata;
  wire [63:0] fsdq_deq_wdata;

  wire mrq_deq_val;
  wire mrq_deq_rdy;
  wire xsdq_deq_val;
  wire xsdq_deq_rdy;
  wire fsdq_deq_val;
  wire fsdq_deq_rdy;

  assign mrq_enq_xf
    = (mem_mrq_cmd == `M_FRD || mem_mrq_cmd == `M_FWR);

  assign mrq_enq_op
    = (mem_mrq_cmd == `M_FRD) ? `M_XRD
    : (mem_mrq_cmd == `M_FWR) ? `M_XWR
    : mem_mrq_cmd;

  assign mrq_enq_type = mem_mrq_type;

  `VC_SIMPLE_QUEUE(45,`MEM_RQ_DEPTH) mrq
  (
    .clk(clk),
    .reset(reset),

    .enq_bits({mrq_enq_xf,mrq_enq_op,mrq_enq_type,dpath_waddr,dpath_alu_out[31:0]}),
    .enq_val(mem_mrq_val),
    .enq_rdy(), // issue logic takes care of this

    .deq_bits({mrq_deq_xf,mrq_deq_op,mrq_deq_type,mrq_deq_waddr,mrq_deq_addr}),
    .deq_val(mrq_deq_val),
    .deq_rdy(mrq_deq_rdy)
  );

  // we don't need to have a separate counter for the xsdq
  // we have as many entries in the xsdq as the mrq

  `VC_SIMPLE_QUEUE(64,`XP_SDQ_DEPTH) xsdq
  (
    .clk(clk),
    .reset(reset),

    .enq_bits(dpath_rs2),
    .enq_val(mem_mrq_val & (`OP_IS_XWR(mrq_enq_op) | `OP_IS_AMO(mrq_enq_op))),
    .enq_rdy(), // issue logic takes care of this

    .deq_bits(xsdq_deq_wdata),
    .deq_val(xsdq_deq_val),
    .deq_rdy(xsdq_deq_rdy)
  );

  `VC_SIMPLE_QUEUE(64,`FP_SDQ_DEPTH) fsdq
  (
    .clk(clk),
    .reset(reset),

    .enq_bits(fpu_fsdq_bits),
    .enq_val(fpu_fsdq_val),
    .enq_rdy(), // issue logic takes care of this

    .deq_bits(fsdq_deq_wdata),
    .deq_val(fsdq_deq_val),
    .deq_rdy(fsdq_deq_rdy)
  );

  // we can't issue FP loads until the (decoupled) FPU has decided they
  // are data hazard free, so we block FP loads until there's a flaq token.
  wire flaq_deq_rdy, flaq_deq_val, flaq_empty, mrq_deq_fload;
  assign flaq_deq_val = ~flaq_empty;
  assign fpu_flaq_deq = flaq_deq_rdy & flaq_deq_val;
  riscvProcCtrlCnt#(`FP_CMDQ_DEPTH) flaq
  (
    .clk(clk),
    .reset(reset),

    .enq(fpu_flaq_enq),
    .deq(fpu_flaq_deq),

    .empty(flaq_empty),
    .full() // issue logic takes care of this
  );


  assign mem_mrq_deq = mrq_deq_val & mrq_deq_rdy;
  assign fpu_fsdq_deq = fsdq_deq_val & fsdq_deq_rdy;

  wire mrq_deq_xload = mrq_deq_op == `M_XRD & ~mrq_deq_xf;
  assign mrq_deq_fload = mrq_deq_op == `M_XRD & mrq_deq_xf & flaq_deq_val;
  wire mrq_deq_flush = mrq_deq_op == `M_FLA;
  wire mrq_deq_xstore = mrq_deq_op == `M_XWR & ~mrq_deq_xf & xsdq_deq_val;
  wire mrq_deq_fstore = mrq_deq_op == `M_XWR & mrq_deq_xf & fsdq_deq_val;
  wire mrq_deq_amo = (mrq_deq_op == `M_XA_ADD || mrq_deq_op == `M_XA_SWAP || mrq_deq_op == `M_XA_AND || mrq_deq_op == `M_XA_OR || mrq_deq_op == `M_XA_MIN || mrq_deq_op == `M_XA_MAX || mrq_deq_op == `M_XA_MINU || mrq_deq_op == `M_XA_MAXU) & ~mrq_deq_xf & xsdq_deq_val;

  assign mrq_deq_rdy = dmem_req_rdy & (mrq_deq_xload | mrq_deq_xstore | mrq_deq_amo | mrq_deq_fload | mrq_deq_fstore | mrq_deq_flush);
  assign xsdq_deq_rdy = dmem_req_rdy & mrq_deq_val & (mrq_deq_op == `M_XWR || mrq_deq_op == `M_XA_ADD || mrq_deq_op == `M_XA_SWAP || mrq_deq_op == `M_XA_AND || mrq_deq_op == `M_XA_OR || mrq_deq_op == `M_XA_MIN || mrq_deq_op == `M_XA_MAX || mrq_deq_op == `M_XA_MINU || mrq_deq_op == `M_XA_MAXU) & ~mrq_deq_xf;
  assign fsdq_deq_rdy = dmem_req_rdy & mrq_deq_val & mrq_deq_op == `M_XWR & mrq_deq_xf;
  assign flaq_deq_rdy = dmem_req_rdy & mrq_deq_val & mrq_deq_op == `M_XRD & mrq_deq_xf;

  wire [63:0] wdata
    = mrq_deq_fstore ? fsdq_deq_wdata
    : xsdq_deq_wdata;

  wire [7:0] wmask_b
    = (mrq_deq_addr[2:0] == 3'd0) ? 8'b0000_0001
    : (mrq_deq_addr[2:0] == 3'd1) ? 8'b0000_0010
    : (mrq_deq_addr[2:0] == 3'd2) ? 8'b0000_0100
    : (mrq_deq_addr[2:0] == 3'd3) ? 8'b0000_1000
    : (mrq_deq_addr[2:0] == 3'd4) ? 8'b0001_0000
    : (mrq_deq_addr[2:0] == 3'd5) ? 8'b0010_0000
    : (mrq_deq_addr[2:0] == 3'd6) ? 8'b0100_0000
    : (mrq_deq_addr[2:0] == 3'd7) ? 8'b1000_0000
    : 8'bx;

  wire [7:0] wmask_h
    = (mrq_deq_addr[2:1] == 2'd0) ? 8'b0000_0011
    : (mrq_deq_addr[2:1] == 2'd1) ? 8'b0000_1100
    : (mrq_deq_addr[2:1] == 2'd2) ? 8'b0011_0000
    : (mrq_deq_addr[2:1] == 2'd3) ? 8'b1100_0000
    : 8'bx;

  wire [7:0] wmask_w
    = (mrq_deq_addr[2] == 1'd0) ? 8'b0000_1111
    : (mrq_deq_addr[2] == 1'd1) ? 8'b1111_0000
    : 8'bx;

  wire [7:0] wmask_d
    = 8'b1111_1111;

  assign dmem_req_val = mrq_deq_val & (mrq_deq_xload | mrq_deq_xstore | mrq_deq_amo | mrq_deq_fload | mrq_deq_fstore | mrq_deq_flush);
  assign dmem_req_op = mrq_deq_op;
  assign dmem_req_addr = {mrq_deq_addr[31:3],3'd0};

  assign dmem_req_data
    = (mrq_deq_type == `MT_B) ? {8{wdata[7:0]}}
    : (mrq_deq_type == `MT_H) ? {4{wdata[15:0]}}
    : (mrq_deq_type == `MT_W) ? {2{wdata[31:0]}}
    : (mrq_deq_type == `MT_D) ? wdata
    : 64'bx;

  assign dmem_req_wmask
    = (mrq_deq_type == `MT_B) ? wmask_b
    : (mrq_deq_type == `MT_H) ? wmask_h
    : (mrq_deq_type == `MT_W) ? wmask_w
    : (mrq_deq_type == `MT_D) ? wmask_d
    : 8'bx;

  // pretend all stores/flushes are on the integer side for counting acks.
  // use rd=0 for stores/flushes to distinguish from loads.
  wire dmem_req_xf
    = mrq_deq_op != `M_XWR && mrq_deq_op != `M_FLA ? mrq_deq_xf : 1'b0;
  wire [4:0] dmem_req_waddr
    = mrq_deq_op != `M_XWR && mrq_deq_op != `M_FLA ? mrq_deq_waddr : 5'b0;

  assign dmem_req_tag = {dmem_req_xf,mrq_deq_type,mrq_deq_addr[2:0],dmem_req_waddr};

endmodule
