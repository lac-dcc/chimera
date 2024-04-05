`include "riscvConst.vh"
`include "macros.vh"

// blocking data cache with flush capability
module DCache #
(
  parameter LINES = 256,
  parameter WORD_ADDR_BITS = 29
)
(
  input clk,
  input reset,
  
  input                       cpu_req_val,
  output                      cpu_req_rdy,
  input [`CPU_OP_BITS-1:0]    cpu_req_op,
  input [`CPU_ADDR_BITS-4:0]  cpu_req_addr,
  input [`CPU_DATA_BITS-1:0]  cpu_req_data,
  input [`CPU_WMASK_BITS-1:0] cpu_req_wmask,
  input [`CPU_TAG_BITS-1:0]   cpu_req_tag,
  
  output wire                    cpu_resp_val,
  output [`CPU_DATA_BITS-1:0]    cpu_resp_data,
  output wire[`CPU_TAG_BITS-1:0] cpu_resp_tag,
  
  output                        mem_req_val,
  input                         mem_req_rdy,
  output                        mem_req_rw,
  output [WORD_ADDR_BITS-1:`ceilLog2(`MEM_DATA_BITS/`CPU_DATA_BITS)] mem_req_addr,
  output [`MEM_DATA_BITS-1:0]   mem_req_data,
  output [`DC_MEM_TAG_BITS-1:0] mem_req_tag,
  
  input                        mem_resp_val,
  input                        mem_resp_nack,
  input [`MEM_DATA_BITS-1:0]   mem_resp_data,
  input [`DC_MEM_TAG_BITS-1:0] mem_resp_tag
);

  localparam CL_SIZE = `MEM_DATA_BITS*`MEM_DATA_CYCLES/8;

  reg flushing, flush_waiting;
  reg [`ceilLog2(LINES)-1:0] flush_count, flush_resp_count;
  reg [`CPU_TAG_BITS-1:0] r_cpu_req_tag;

  wire cpu_req_rdy_int;
  assign cpu_req_rdy = cpu_req_rdy_int & ~flush_waiting;
  wire cpu_req_val_int = (cpu_req_val & (cpu_req_op != `M_FLA) & ~flush_waiting) | flushing;
  wire [`CPU_OP_BITS-1:0] cpu_req_op_int = flushing ? `M_FLA : cpu_req_op;
  wire [`CPU_ADDR_BITS-4:0] cpu_req_addr_int = flushing ? {{`CPU_ADDR_BITS-3-`ceilLog2(LINES)-`ceilLog2(`MEM_DATA_BITS/`CPU_DATA_BITS*`MEM_DATA_CYCLES){1'b0}},flush_count,{`ceilLog2(`MEM_DATA_BITS/`CPU_DATA_BITS*`MEM_DATA_CYCLES){1'b0}}} : cpu_req_addr;
  wire [`CPU_TAG_BITS-1:0] cpu_req_tag_int = flushing ? r_cpu_req_tag : cpu_req_tag;

  wire cpu_resp_val_int;
  assign cpu_resp_val = cpu_resp_val_int & ~(flush_waiting && cpu_resp_tag == r_cpu_req_tag && flush_resp_count != {`ceilLog2(LINES){1'b1}});

  always @(posedge clk) begin
    if(reset)
      flush_count <= {`ceilLog2(LINES){1'b0}};
    else if(flushing && cpu_req_rdy_int)
      flush_count <= flush_count+1'b1;

    if(reset)
      flush_resp_count <= {`ceilLog2(LINES){1'b0}};
    else if(flush_waiting && cpu_resp_val_int && cpu_resp_tag == r_cpu_req_tag)
      flush_resp_count <= flush_resp_count+1'b1;

    if(cpu_req_val && cpu_req_rdy && cpu_req_op == `M_FLA)
      r_cpu_req_tag <= cpu_req_tag;

    if(reset) begin
      flushing <= 1'b0;
      flush_waiting <= 1'b0;
    end else if(cpu_req_val && cpu_req_rdy && cpu_req_op == `M_FLA) begin
      flushing <= 1'b1;
      flush_waiting <= 1'b1;
    end else begin
      if(cpu_req_rdy_int && flush_count == {`ceilLog2(LINES){1'b1}})
        flushing <= 1'b0;
      if(cpu_resp_val_int && cpu_resp_tag == r_cpu_req_tag && flush_resp_count == {`ceilLog2(LINES){1'b1}})
        flush_waiting <= 1'b0;
    end
  end

  DCache_noflush #(.LINES(LINES), .WORD_ADDR_BITS(WORD_ADDR_BITS)) dcache
  (
    clk,
    reset,

    cpu_req_val_int,
    cpu_req_rdy_int,
    cpu_req_op_int,
    cpu_req_addr_int,
    cpu_req_data,
    cpu_req_wmask,
    cpu_req_tag_int,

    cpu_resp_val_int,
    cpu_resp_data,
    cpu_resp_tag,
  
    mem_req_val,
    mem_req_rdy,
    mem_req_rw,
    mem_req_addr,
    mem_req_data,
    mem_req_tag,
  
    mem_resp_val,
    mem_resp_nack,
    mem_resp_data,
    mem_resp_tag
  );

endmodule

// blocking data cache without state machine to bomb the whole cache
module DCache_noflush #
(
  parameter LINES = 256,
  parameter WORD_ADDR_BITS = 29
)
(
  input clk,
  input reset,
  
  input                       cpu_req_val,
  output                      cpu_req_rdy,
  input [`CPU_OP_BITS-1:0]    cpu_req_op,
  input [`CPU_ADDR_BITS-4:0]  cpu_req_addr,
  input [`CPU_DATA_BITS-1:0]  cpu_req_data,
  input [`CPU_WMASK_BITS-1:0] cpu_req_wmask,
  input [`CPU_TAG_BITS-1:0]   cpu_req_tag,
  
  output reg                     cpu_resp_val,
  output [`CPU_DATA_BITS-1:0]    cpu_resp_data,
  output reg [`CPU_TAG_BITS-1:0] cpu_resp_tag,
  
  output                        mem_req_val,
  input                         mem_req_rdy,
  output                        mem_req_rw,
  output [WORD_ADDR_BITS-1:`ceilLog2(`MEM_DATA_BITS/`CPU_DATA_BITS)] mem_req_addr,
  output [`MEM_DATA_BITS-1:0]   mem_req_data,
  output [`DC_MEM_TAG_BITS-1:0] mem_req_tag,
  
  input                        mem_resp_val,
  input                        mem_resp_nack,
  input [`MEM_DATA_BITS-1:0]   mem_resp_data,
  input [`DC_MEM_TAG_BITS-1:0] mem_resp_tag
);

  localparam CL_SIZE = `MEM_DATA_BITS*`MEM_DATA_CYCLES/8;
  localparam LG_LINES = `ceilLog2(LINES);
  localparam WIDTH = `CPU_DATA_BITS;
  localparam LG_REFILL_CYCLES = `ceilLog2(`MEM_DATA_CYCLES);

  localparam OFFLSB = 0;
  localparam OFFMSB = OFFLSB-1+`ceilLog2(CL_SIZE*8/WIDTH);
  localparam IDXLSB = OFFMSB+1;
  localparam IDXMSB = IDXLSB-1+`ceilLog2(LINES);
  localparam TAGLSB = IDXMSB+1;
  localparam TAGMSB = `CPU_ADDR_BITS-1-`ceilLog2(WIDTH/8);
  localparam TAGBITS = TAGMSB-TAGLSB+1;
  localparam DATAIDXLSB = `ceilLog2(`MEM_DATA_BITS/WIDTH);
  localparam MEM_REQ_LSB = `ceilLog2(CL_SIZE*8/WIDTH);

  localparam STATE_RESET = 4'd0;
  localparam STATE_READY = 4'd1;
  localparam STATE_START_WRITEBACK = 4'd2;
  localparam STATE_WRITEBACK = 4'd3;
  localparam STATE_REQ_REFILL = 4'd4;
  localparam STATE_REFILL = 4'd5;
  localparam STATE_RESOLVE_MISS = 4'd6;
  localparam STATE_AMO_COMPUTE = 4'd7;
  localparam STATE_AMO_STORE = 4'd8;

  reg [3:0] state, next_state;
  reg [LG_LINES-1:0] reset_cnt;
  reg [LG_REFILL_CYCLES-1:0] refill_cnt;
  wire [LG_REFILL_CYCLES-1:0] next_refill_cnt = refill_cnt + 1'b1;

  wire tag_match, tag_dirty, tag_valid;

  reg                       r_cpu_req_val;
  reg [`CPU_OP_BITS-1:0]    r_cpu_req_op;
  reg [TAGMSB:0]            r_cpu_req_addr;
  reg [TAGMSB:0]            r_r_cpu_req_addr;
  reg [`CPU_DATA_BITS-1:0]  r_cpu_req_data;
  reg [`CPU_WMASK_BITS-1:0] r_cpu_req_wmask;
  reg [`CPU_TAG_BITS-1:0]   r_cpu_req_tag;

  always @(posedge clk) begin
    if(cpu_req_rdy && cpu_req_val) begin
      r_cpu_req_op <= cpu_req_op;
      r_cpu_req_addr <= cpu_req_addr;
      r_cpu_req_data <= cpu_req_data;
      r_cpu_req_wmask <= cpu_req_wmask;
      r_cpu_req_tag <= cpu_req_tag;
    end
    r_r_cpu_req_addr <= r_cpu_req_addr;

    if(reset)
      r_cpu_req_val <= 1'b0;
    else if(cpu_req_rdy)
      r_cpu_req_val <= cpu_req_val;
    else if(next_state == STATE_READY)
      r_cpu_req_val <= 1'b0;
  end

  wire r_st  = r_cpu_req_op == `M_XWR;
  wire r_ld  = r_cpu_req_op == `M_XRD;
  wire r_flush = r_cpu_req_op == `M_FLA;
  wire r_amo = ~r_st & ~r_ld & ~r_flush;

  always @(*) begin
    case(state)
      STATE_RESET:
        next_state = reset_cnt == {LG_LINES{1'b1}} ? STATE_READY
                   : STATE_RESET;
      STATE_READY:
        next_state = r_cpu_req_val & tag_match & r_amo ? STATE_AMO_COMPUTE
                   : ~r_cpu_req_val | tag_match ? STATE_READY
                   : tag_valid & tag_dirty ? STATE_START_WRITEBACK
                   : (r_flush ? STATE_RESOLVE_MISS : STATE_REQ_REFILL);
      STATE_START_WRITEBACK:
        next_state = STATE_WRITEBACK;
      STATE_WRITEBACK:
        next_state = refill_cnt == {LG_REFILL_CYCLES{1'b1}} &&
                     mem_req_rdy ? (r_flush ? STATE_RESOLVE_MISS : STATE_REQ_REFILL)
                   : STATE_WRITEBACK;
      STATE_REQ_REFILL:
        next_state = mem_req_rdy ? STATE_REFILL
                   : STATE_REQ_REFILL;
      STATE_REFILL:
        next_state = refill_cnt == {LG_REFILL_CYCLES{1'b1}} &&
                     mem_resp_val ? STATE_RESOLVE_MISS
                   : mem_resp_nack ? STATE_REQ_REFILL
                   : STATE_REFILL;
      STATE_RESOLVE_MISS:
        next_state = r_amo ? STATE_AMO_COMPUTE : STATE_READY;
      STATE_AMO_COMPUTE:
        next_state = STATE_AMO_STORE;
      STATE_AMO_STORE:
        next_state = STATE_READY;
      default:
        next_state = 4'bx;
    endcase
  end

  always @(posedge clk) begin
    if(reset)
      state <= STATE_RESET;
    else
      state <= next_state;

    if(reset)
      reset_cnt <= {LG_LINES{1'b0}};
    else if(state == STATE_RESET)
      reset_cnt <= reset_cnt + 1'b1;

    if(reset)
      refill_cnt <= {LG_REFILL_CYCLES{1'b0}};
    else if(mem_resp_val || mem_req_rdy && state == STATE_WRITEBACK)
      refill_cnt <= next_refill_cnt;
  end

  wire tag_we = state == STATE_RESET || state == STATE_RESOLVE_MISS || state == STATE_READY && r_cpu_req_val && tag_match && (r_st || r_amo) && ~tag_dirty;
  wire [TAGBITS+1:0] tag_wdata
    = state == STATE_RESET || r_flush ? {TAGBITS+2{1'b0}}
    : {1'b1,r_st|r_amo,r_cpu_req_addr[TAGMSB:TAGLSB]};
  wire [TAGBITS+1:0] tag_out;
  wire [IDXMSB:IDXLSB] tag_idx
    = (state == STATE_RESET) ? reset_cnt
    : cpu_req_rdy ? cpu_req_addr[IDXMSB:IDXLSB]
    : r_cpu_req_addr[IDXMSB:IDXLSB];

`ifdef ASICC
  SRAM_20x512_1P tags
  (
    .CE1(clk),
    .WEB1(~tag_we),
    .OEB1(1'b0),
    .CSB1(1'b0),
    .A1(tag_idx),
    .I1(tag_wdata),
    .O1(tag_out)
  );
`else
  sram #(TAGBITS+2,LG_LINES) tags
  (
    .A1(tag_idx),
    .BM1(1'b1),
    .CE1(clk),
    .WEB1(~tag_we),
    .OEB1(1'b0),
    .CSB1(1'b0),
    .I1(tag_wdata),
    .O1(tag_out)
  );
`endif

  wire [IDXMSB:DATAIDXLSB] data_idx
    = {r_cpu_req_addr[IDXMSB:IDXLSB],
        (state == STATE_WRITEBACK && mem_req_rdy) ? next_refill_cnt
      : (state == STATE_WRITEBACK) || (state == STATE_START_WRITEBACK) || (state == STATE_REFILL) ? refill_cnt
      : r_cpu_req_addr[OFFMSB:DATAIDXLSB]};

  reg [WIDTH-1:0] r_cpu_resp_data;
  wire [WIDTH-1:0] amo_result;
  amo_alu amo_alu
  (
    .op(r_cpu_req_op),
    .wmask(r_cpu_req_wmask),
    .lhs(r_cpu_resp_data),
    .rhs(r_cpu_req_data),
    .result(amo_result)
  );

  wire data_we = state == STATE_REFILL && mem_resp_val || (state == STATE_READY && r_cpu_req_val && tag_match && r_st || state == STATE_RESOLVE_MISS && r_st || state == STATE_AMO_STORE);
  wire [`MEM_DATA_BITS-1:0] data_wdata, data_out;
  wire [`MEM_DATA_BITS/8-1:0] data_wmask;
  generate
    genvar i;
    for(i = 0; i < `MEM_DATA_BITS/WIDTH; i=i+1) begin : foo
      assign data_wdata[WIDTH*(i+1)-1:WIDTH*i]
        = state == STATE_REFILL ? mem_resp_data[WIDTH*(i+1)-1:WIDTH*i]
        : r_amo                 ? amo_result
        : r_cpu_req_data;
      assign data_wmask[8*(i+1)-1:8*i] = {8{state == STATE_REFILL}} | {8{i == r_cpu_req_addr[DATAIDXLSB-1:0]}} & r_cpu_req_wmask;
    end
  endgenerate

`ifdef ASIC
  SRAM_128x1024_1P sram
  (
    .CE1(clk),
    .WEB1(~data_we),
    .OEB1(1'b0),
    .CSB1(1'b0),
    .A1(data_idx),
    .I1(data_wdata),
    .O1(data_out),
    .WBM1(data_wmask)
  );
`else
  sram #(`MEM_DATA_BITS,LG_LINES+LG_REFILL_CYCLES,8) data
  (
    .A1(data_idx),
    .BM1(data_wmask),
    .CE1(clk),
    .WEB1(~data_we),
    .OEB1(1'b0),
    .CSB1(1'b0),
    .I1(data_wdata),
    .O1(data_out)
  );
`endif

  assign tag_dirty = tag_out[TAGBITS];
  assign tag_valid = tag_out[TAGBITS+1];
  assign tag_match = (tag_out[TAGBITS-1:0] == r_cpu_req_addr[TAGMSB:TAGLSB])
                     & tag_valid & ~r_flush;

  assign cpu_req_rdy = (~r_cpu_req_val | tag_match & ~r_amo) & (state == STATE_READY) & ~tag_we;

  assign mem_req_val = (state == STATE_WRITEBACK) | (state == STATE_REQ_REFILL);
  assign mem_req_rw  = (state == STATE_WRITEBACK);
  assign mem_req_addr = state == STATE_REQ_REFILL ? {r_cpu_req_addr[TAGMSB:MEM_REQ_LSB],{MEM_REQ_LSB-DATAIDXLSB{1'b0}}}
                      : {tag_out[TAGBITS-1:0],r_cpu_req_addr[IDXMSB:MEM_REQ_LSB],refill_cnt};
  assign mem_req_data = data_out;
  assign mem_req_tag = {`DC_MEM_TAG_BITS{1'b0}};

  always @(posedge clk) begin
    if(reset)
      cpu_resp_val <= 1'b0;
    else
      cpu_resp_val <= ((r_cpu_req_val & tag_match & (state == STATE_READY)) |
                      (state == STATE_RESOLVE_MISS));
    cpu_resp_tag <= r_cpu_req_tag;
    r_cpu_resp_data <= cpu_resp_data;
  end

  generate
    for(i = 0; i < WIDTH; i=i+1) begin : bar
      assign cpu_resp_data[i] = data_out[r_r_cpu_req_addr[DATAIDXLSB-1:0]*WIDTH+i];
    end
  endgenerate

endmodule

module amo_alu
(
  input  wire [`CPU_OP_BITS-1:0]    op,
  input  wire [`CPU_WMASK_BITS-1:0] wmask,
  input  wire [`CPU_DATA_BITS-1:0]  lhs,
  input  wire [`CPU_DATA_BITS-1:0]  rhs,
  output reg  [`CPU_DATA_BITS-1:0]  result
);

  reg [`CPU_DATA_BITS-1:0] sum;
  reg signed_comp, sub, tmp;
  reg [`CPU_DATA_BITS-1:0] minmax;
  reg less2[1:0], less;
  reg [`CPU_DATA_BITS-1:0] adder_lhs, adder_rhs;

  always @(*) begin
    signed_comp = op == `M_XA_MIN || op == `M_XA_MAX;
    sub = op == `M_XA_MIN || op == `M_XA_MINU ||
          op == `M_XA_MAX || op == `M_XA_MAXU;

    // zap MSBs of lower word if doing a word AMO on the upper word
    adder_lhs = lhs;
    adder_lhs[`CPU_DATA_BITS/2-1] = adder_lhs[`CPU_DATA_BITS/2-1] & wmask[`CPU_WMASK_BITS/2-1];
    adder_rhs = rhs;
    adder_rhs[`CPU_DATA_BITS/2-1] = adder_rhs[`CPU_DATA_BITS/2-1] & wmask[`CPU_WMASK_BITS/2-1];
    adder_rhs = sub ? ~rhs : rhs;
    {sum,tmp} = {adder_lhs,1'b0}+{adder_rhs,sub};

    less2[0] = lhs[`CPU_WMASK_BITS/2-1] == rhs[`CPU_WMASK_BITS/2-1] ? sum[`CPU_WMASK_BITS/2-1]
             : signed_comp                                          ? lhs[`CPU_WMASK_BITS/2-1]
             :                                                        rhs[`CPU_WMASK_BITS/2-1];
    less2[1] = lhs[`CPU_WMASK_BITS-1] == rhs[`CPU_WMASK_BITS-1] ? sum[`CPU_WMASK_BITS-1]
             : signed_comp                                      ? lhs[`CPU_WMASK_BITS-1]
             :                                                    rhs[`CPU_WMASK_BITS-1];
    less = less2[wmask[`CPU_WMASK_BITS-1]];

    case(op)
      `M_XA_ADD:  result = sum;
      `M_XA_SWAP: result = rhs;
      `M_XA_AND:  result = lhs & rhs;
      `M_XA_OR:   result = lhs | rhs;
      `M_XA_MIN:  result =  less ? lhs : rhs;
      `M_XA_MINU: result =  less ? lhs : rhs;
      `M_XA_MAX:  result = ~less ? lhs : rhs;
      `M_XA_MAXU: result = ~less ? lhs : rhs;
      default:    result = 'x;
    endcase
  end

endmodule
